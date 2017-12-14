Ext.define('Classes.MainTheme', {
    tools: 'Ext.toolbar.Toolbar',
    content: 'Ext.panel.Panel',

    constructor: function () {
        this.tools = Ext.create('Ext.toolbar.Toolbar', {
            renderTo: Ext.getBody(),
            items: [{
                text: 'Первая страница',
                handler: function () {
                    window.location = "./../FirstPage.html";
                }
            }, {
                text: 'Вторая страница',
                handler: function () {
                    window.location = "./../SecondPage.html";
                }
            }]
        });

        this.content = Ext.create('Ext.panel.Panel', {
            renderTo: Ext.getBody(),
            height: Ext.getBody().getViewSize().height,
            anchor: "100% 100%",
            padding: 0,
            title: 'Приложение на Ext JS',
            layout: {
                type: 'hbox',
                align: 'top'
            },
            id: "head",
            dockedItems: [this.tools]
        });
    },


});