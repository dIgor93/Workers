var separatorsJson = [
    [' ', 'Пробел'],
    [', ', 'Запятая'],
    ['<br />', 'Перенос строки']
];

///Класс представления формы страницы сотрудников
Ext.define('Classes.EmployeersList', {
    extend: 'Classes.MainTheme',
    autoShow: true,
    constructor: function () {
        this.callParent();
        loadAllPage();

        function loadAllPage() {
            ///Форма отображения списка работников
            var employeersListPanel = Ext.create('Ext.Panel', {
                title: "Список сотрудников",
                height: (Ext.getBody().getViewSize().height - 150),
                width: '70%',
                padding: 10,
                overflowY: 'scroll',
                bodyStyle: 'padding: 10px;'
            });

            ///Область выбора разделителя 
            var separatorCombobox = Ext.create('Ext.form.ComboBox', {
                fieldLabel: 'Из списка',
                labelAlign: 'top',
                store: new Ext.data.SimpleStore({
                    id: 0,
                    fields:
                    [
                        'separatorText',
                        'separatorName'
                    ],
                    data: separatorsJson
                }),
                valueField: 'separatorText',
                displayField: 'separatorName',
                queryMode: 'local',
                padding: 10
            });

            var submitButton = Ext.create('Ext.button.Button', {
                text: 'Отобразить'
            });

            ///Форма обертка вышеперечисленого выбора разделителя
            var separatorSelectorPanel = Ext.create('Ext.form.Panel', {
                title: "Выберите разделитель",
                id: 'myform',
                width: '25%',
                height: 200,
                padding: 10,
                items: [separatorCombobox],
                buttons: [submitButton],
                renderTo: Ext.getBody()
            });

            submitButton.on('click', function () {
                if (separatorCombobox.getValue() == null) { 
                    alert("Выберите разделитель");
                } else {
                    var separator_str = separatorCombobox.getValue();
                    Ext.Ajax.request({
                        url: '/ajax_employeers_get_list',
                        method: 'GET',
                        params: {
                            separator : separator_str
                        },
                        success: function (response) {
                            employeersListPanel.update(response.responseText);
                        },
                        failure: function (response) { }
                    });
                }
            });

            Ext.getCmp('head').insert(5, employeersListPanel);
            Ext.getCmp('head').insert(5, separatorSelectorPanel);
        }
    },
});

Ext.onReady(function () {
    mainFrom = new Classes.EmployeersList();
});