Ext.define('EmplployeersStore', {
    extend: 'Ext.data.Model',
    idProperty: 'id',
    fields: [{
        name: 'id',
        type: 'int'
    }, {
        name: 'surname',
        type: 'string'
    }, {
        name: 'name',
        type: 'string'
    }, {
        name: 'patronymic',
        type: 'string'
    }, {
        name: 'departmentId',
        type: 'int'
    }],
    proxy: {
        type: 'ajax'
    }
});

Ext.define('DepartmentsStore', {
    extend: 'Ext.data.Model',
    idProperty: 'id',
    fields: [{
        name: 'id',
        type: 'int'
    }, {
        name: 'name',
        type: 'string'
    }],
    proxy: {
        type: 'ajax'
    }
});

Ext.define('Classes.EmployeersForm', {
    extend: 'Classes.MainTheme',
    autoShow: true,

    constructor: function () {
        this.callParent();

        var dep_store = Ext.create('Ext.data.Store', {
            model: 'DepartmentsStore',
            autoLoad: {
                callback: initData
            },
            proxy: {
                type: 'ajax',
                url: '/ajax_departments',
                reader: {
                    type: 'json',
                    root: 'root'
                }
            }
        });

        var emp_store = Ext.create('Ext.data.Store', {
            model: 'EmplployeersStore',
            autoSync: true,
            autoLoad: {
                callback: initData
            },
            proxy: {
                type: 'ajax',
                url: '/ajax_employeers_bind',
                reader: {
                    type: 'json',
                    root: 'root'
                }
            }
        });

        var myComboStores = [emp_store, dep_store]
        function initData() {
            var loaded = true;
            Ext.each(myComboStores, function (store) {
                if (store.isLoading()) {
                    loaded = false;
                }
            });
            if (loaded) {
                loadAllPage();
            }
        }

        Ext.util.Format.comboRenderer = function (combo) {
            return function (value) {
                var record = combo.findRecord(combo.valueField, value);
                return record ? record.get(combo.displayField) : "-";
            }
        }

        function loadAllPage() {
            var combo = new Ext.form.ComboBox({
                store: dep_store,
                allowBlank: false,
                valueField: 'id',
                displayField: 'name',
            });

            ///Отображение таблица сотрудников
            var grid = Ext.create('Ext.grid.Panel', {
                title: 'Сотрудники',
                height: (Ext.getBody().getViewSize().height - 150),
                width: '70%',
                padding: 10,
                store: emp_store,
                plugins: [{
                    ptype: 'rowediting',
                    clicksToEdit: 2
                }],
                columns: [{
                    header: '№',
                    dataIndex: 'id',
                    flex: 1,
                }, {
                    header: 'Фамилия',
                    dataIndex: 'surname',
                    flex: 1,
                    editor: {
                        xtype: 'textfield',
                        allowBlank: false
                    }
                }, {
                    header: 'Имя',
                    dataIndex: 'name',
                    flex: 1,
                    editor: {
                        xtype: 'textfield',
                        allowBlank: false
                    }
                }, {
                    header: 'Отчество',
                    dataIndex: 'patronymic',
                    flex: 1,
                    editor: {
                        xtype: 'textfield',
                        allowBlank: false
                    }
                }, {
                    header: 'Отдел',
                    dataIndex: 'departmentId',
                    flex: 1,
                    editor: combo,
                    renderer: Ext.util.Format.comboRenderer(combo)
                }],
                renderTo: Ext.getBody()
            });

            ///Форма добавления сотрудника
            var formPanel_tmp = Ext.create('Ext.form.Panel', {
                title: 'Новый сотрудник',
                width: '25%',
                height: 500,
                padding: 10,
                bodyStyle: 'padding:5px 5px 0 0',
                layout: 'column',
                id: 'myform',
                
                items: [{
                    xtype: 'textfield',
                    allowBlank: false,
                    maskRe: /[A-Za-zА-Яа-я]/i,
                    name: 'surname',
                    fieldLabel: 'Фамилия',
                    labelAlign: 'top',
                    padding: 10,
                    width: '90%'
                }, {
                    xtype: 'textfield',
                    allowBlank: false,
                    maskRe: /[A-Za-zА-Яа-я]/i,
                    name: 'name',
                    fieldLabel: 'Имя',
                    labelAlign: 'top',
                    padding: 10,
                    width: '90%'
                }, {
                    xtype: 'textfield',
                    fieldLabel: 'Отчество',
                    labelAlign: 'top',
                    allowBlank: false,
                    maskRe: /[A-Za-zА-Яа-я]/i,
                    name: 'patronymic',
                    padding: 10,
                    width: '90%'
                }, {
                    xtype: 'combobox',
                    name: 'departmentId',
                    fieldLabel: 'Отдел',
                    labelAlign: 'top',
                    store: dep_store,
                    allowBlank: false,
                    valueField: 'id',
                    displayField: 'name',
                    padding: 10,
                    width: '90%'
                }
                ],
                renderTo: Ext.getBody(),
                buttons: [{
                    text: 'Принять на работу!',
                    handler: function (formPanel) {
                        Ext.Ajax.request({
                            url: '/ajax_employeers_add/',
                            headers: { 'Content-Type': 'application/json' }, 
                            params: Ext.encode(Ext.getCmp('myform').getForm().getValues()),
                            success: function (response) { },
                            failure: function (response) { }
                        });
                    }
                }],
            });
            Ext.getCmp('head').insert(5, grid);
            Ext.getCmp('head').insert(5, formPanel_tmp);
            
        }
    },


});

Ext.onReady(function () {
    mainFrom = new Classes.EmployeersForm();
});

