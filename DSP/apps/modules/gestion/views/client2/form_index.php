<script type="text/javascript">
	var tab = Ext.getCmp(inicio.id+'-tabContent');
	if(!Ext.getCmp('client2-tab')){
		var client2 = {
			id:'client2',
			id_menu:'<?php echo $p["id_menu"];?>',
			url:'/gestion/client2/',
			opcion:'I',
			id_lote:0,
			shi_codigo:0,
			fac_cliente:0,
			init:function(){
				Ext.tip.QuickTipManager.init();

				Ext.define('Task', {
				    extend: 'Ext.data.TreeModel',
				    fields: [
				        {name: 'shi_codigo', type: 'string'},
				        {name: 'shi_nombre', type: 'string'},
	                    {name: 'fec_ingreso', type: 'string'},
	                    {name: 'shi_estado', type: 'string'},
	                    {name: 'id_user', type: 'string'},
	                    {name: 'fecact', type: 'string'},
	                    {name: 'cod_contrato', type: 'string'},
	                    {name: 'pro_descri', type: 'string'}
				    ]
				});
				var storeTree2 = new Ext.data.TreeStore({
	                model: 'Task',
				    autoLoad:false,
	                proxy: {
	                    type: 'ajax',
	                    url: client2.url+'get_list_clientcontratos/'

	                },
	                folderSort: true,
	                listeners:{
	                	beforeload: function (store, operation, opts) {

					    },
	                    load: function(obj, records, successful, opts){
	                 		Ext.getCmp(client2.id + '-gridTree').doLayout();
	                 		storeTree2.removeAt(0);
	                 		Ext.getCmp(client2.id + '-gridTree').collapseAll();
		                    Ext.getCmp(client2.id + '-gridTree').getRootNode().cascadeBy(function (node) {
		                          if (node.getDepth() < 1) { node.expand(); }
		                          if (node.getDepth() == 0) { return false; }
		                     });
	                    }
	                }
	            });

				var storeTree = new Ext.data.TreeStore({
	                fields: [
	                	{name: 'shi_codigo', type: 'string'},
	                    {name: 'shi_nombre', type: 'string'},
	                    {name: 'fec_ingreso', type: 'string'},
	                    {name: 'shi_estado', type: 'string'},
						{name: 'id_user', type: 'string'},	                    
	                    {name: 'fecact', type: 'string'}
	                ],
				    autoLoad:false,
	                proxy: {	
	                    type: 'ajax',
	                    url: client2.url+'get_list_client/',
	                    reader:{
	                        type: 'json',
	                        rootProperty: 'data'
	                    }
	                },
	                folderSort: true
	            });



				var store = Ext.create('Ext.data.Store',{
                fields: [
                    {name: 'id_lote', type: 'string'},
                    {name: 'tipdoc', type: 'string'},
                    {name: 'nombre', type: 'string'},
                    {name: 'fecha', type: 'string'},
                    {name: 'tot_folder', type: 'string'},                    
                    {name: 'id_user', type: 'string'},                    
                    {name: 'estado', type: 'string'}
                ],
                autoLoad:false,
                proxy:{
                    type: 'ajax',
                    url: client2.url+'get_list_lotizer/',
                    reader:{
                        type: 'json',
                        rootProperty: 'data'
                    }
                },
                listeners:{
                    load: function(obj, records, successful, opts){
                        
                    }
                }
            });
            var store_contratos = Ext.create('Ext.data.Store',{
                fields: [
                    {name: 'fac_cliente', type: 'string'},
                    {name: 'cod_contrato', type: 'string'},
                    {name: 'pro_descri', type: 'string'}
                ],
                autoLoad:false,
                proxy:{
                    type: 'ajax',
                    url: client2.url+'get_list_contratos/',
                    reader:{
                        type: 'json',
                        rootProperty: 'data'
                    }
                },
                listeners:{
                    load: function(obj, records, successful, opts){
                        
                    }
                }
            });
			var myData = [
    				['1','Activo']
    				/*,
				    ['0','Inactivo']*/
			];
			var store_estado = Ext.create('Ext.data.ArrayStore', {
		        storeId: 'estado',
		        autoLoad: true,
		        data: myData,
		        fields: ['code', 'name']
		    });

		    var myDataLote = [
				    ['1','Activo']/*,
				    ['0','Inactivo']*/
			];
			var store_estado_lote = Ext.create('Ext.data.ArrayStore', {
		        storeId: 'estado',
		        autoLoad: true,
		        data: myDataLote,
		        fields: ['code', 'name']
		    });

				var panel = Ext.create('Ext.form.Panel',{
					id:client2.id+'-form',
					bodyStyle: 'background: transparent',
					border:false,
					layout:'border',
					defaults:{
						border:false
					},
					tbar:[],
					items:[
						
						
					]
				});
				tab.add({
					id:client2.id+'-tab',
					border:true,
					autoScroll:true,
					closable:true,
					layout:'border',
					items:[
						{
                            region:'north',
                            layout:'border',
                            border:true,
                            height:100,
                            items:[
		                        {
		                            region:'center',
		                            border:true,
		                            xtype: 'uePanelS',
		                            logo: 'CL',
		                            title: 'Listado de Clientes',
		                            legend: 'Búsqueda de Clientes registrados',
		                            width:1500,
		                            height:100,
		                            items:[
		                                {
		                                    xtype:'panel',
		                                    border:false,
		                                    bodyStyle: 'background: transparent',
		                                    padding:'2px 5px 1px 5px',
		                                    layout:'column',
		                                    height: 100,
		                                    //width : 1000,

		                                    items: [
		                                        {

		                                            width:350,
		                                            border:false,
		                                            padding:'0px 2px 0px 0px',  
		                                            bodyStyle: 'background: transparent',
		                                            hidden:true,
		                                            items:[
		                                                {
		                                                    xtype: 'textfield',	
		                                                    fieldLabel: 'Cliente',
		                                                    id:client2.id+'-txt-cliente',
		                                                    labelWidth:55,
		                                                    labelAlign:'right',
		                                                    width:'100%',
		                                                    anchor:'100%'
		                                                },
		                                            ]
		                                        },

		                                        {
			                                        width: 160,border:false,
			                                        padding:'0px 2px 0px 0px',  
			                                    	bodyStyle: 'background: transparent',
			                                    	hidden:true,
			                                        items:[
			                                            {
			                                                xtype:'datefield',
			                                                id:client2.id+'-txt-fecha-filtro',
			                                                fieldLabel:'Fecha',
			                                                labelWidth:60,
			                                                labelAlign:'right',
			                                                value:'',//new Date(),
			                                                format: 'Ymd',
			                                                width: '100%',
			                                                anchor:'100%'
			                                            }
			                                        ]
			                                    },
		                                        {
			                                   		width: 150,border:false,
			                                    	padding:'0px 2px 0px 0px',  
			                                    	bodyStyle: 'background: transparent',
			                                    	hidden:true,
			                                 		items:[
			                                                {
			                                                    xtype:'combo',
			                                                    fieldLabel: 'Estado',
			                                                    id:client2.id+'-txt-estado-filter',
			                                                    store: store_estado_lote,
			                                                    queryMode: 'local',
			                                                    triggerAction: 'all',
			                                                    valueField: 'code',	
			                                                    displayField: 'name',
			                                                    emptyText: '[Seleccione]',
			                                                    labelAlign:'right',
			                                                    labelWidth: 50,
			                                                    width:'100%',
			                                                    anchor:'100%',
			                                                    listeners:{
			                                                        afterrender:function(obj, e){
			                                                            Ext.getCmp(client2.id+'-txt-estado-filter').setValue(' ');
			                                                        },
			                                                        select:function(obj, records, eOpts){
			                                                
			                                                        }
			                                                    }
			                                                }
			                                 		]
			                                    },
		                                        {
		                                            width: 450,
		                                            height : 100,
		                                            border:false,
		                                            padding:'0px 2px 0px 0px',  
		                                            bodyStyle: 'background: transparent',
		                                            items:[
		                                                {
									                        xtype:'button',
									                        text: 'Buscar',
									                        icon: '/images/icon/binocular.png',
									                        listeners:{
									                            beforerender: function(obj, opts){
									                            },
									                            click: function(obj, e){	             	
									                            	var name = Ext.getCmp(client2.id+'-txt-cliente').getValue();
									                            	var fecha = Ext.getCmp(client2.id+'-txt-fecha-filtro').getValue();

									                            	if(fecha == ' ' || fecha == '' ) 
									                            
									                            	{
									                            				fecha = '';
									                            	} 
									                          
									                            	var estado = Ext.getCmp(client2.id+'-txt-estado-filter').getValue();	


		                               					            client2.getReloadGridlotizer(name,fecha,estado);
									                            }
									                        }
									                    },
									                    {
															id: client2.id + '-cancelar',
									                        xtype:'button',
									                        width:80,
									                        text: 'Limpiar',
									                        icon: '/images/icon/broom.png',
									                        hidden:true,
									                        listeners:{
									                            beforerender: function(obj, opts){
									                            },
									                            click: function(obj, e){
																	client2.set_lotizer_clear();
									                            }
									                        }
									                    },

									                    {
															id: client2.id + '-nuevo',
									                        xtype:'button',
									                        width:150,
									                        text: 'Nuevo Cliente',
									                        icon: '/images/icon/add_green_button.png',
									                        hidden:true,
									                        listeners:{
									                            beforerender: function(obj, opts){

									                            },
									                            click: function(obj, e){
																	client2.getFormMant('I','','1',0);
									                            }
									                        }
									                    },


									                    {
															id: client2.id + '-nuevo2',
									                        xtype:'button',
									                        width:150,
									                        text: 'Nueva Area',
									                        icon: '/images/icon/add.png',
									                        listeners:{
									                            beforerender: function(obj, opts){

									                            },
									                            click: function(obj, e){
																	client2.getFormMant2('I','','A',0,0);
									                            }
									                        }
									                    },


									                ]    			
		                                            
		                                        }
		                                    ]

		                                }
		                            ]

		                        }
		                    ]
		                },
						{
							region:'center',
							layout:'border',
							items:[
								{
									region:'center',
									layout:'border',
									items:[
										
										{
											region:'center',
											border:false,
											layout:'fit',
											items:[
												{
							                        xtype: 'treepanel',
											        useArrows: true,
											        rootVisible: true,
											        multiSelect: true,
							                        id: client2.id + '-gridTree',
							                        columnLines: true,
							                        store: storeTree2,
										            columns: [
											            {
											            	hidden : true,
											            	//xtype: 'treecolumn',
						                                    text: 'id_Cliente',
						                                    dataIndex: 'shi_codigo',
						                                    sortable: true,
						                                    width: 80
						                                },
						                                {
						                                	xtype: 'treecolumn',
						                                    text: 'Nombre',
						                                    dataIndex: 'shi_nombre',
						                                    flex: 2
						                                },

						                                {
						                                    hidden: true,
						                                    text: 'id_Contrato',
						                                    dataIndex: 'cod_contrato',
						                                    width: 80,
						                                    align: 'center'
						                                },

						                                {
						                                    text: 'Area',
						                                    dataIndex: 'pro_descri',
						                                    flex: 1,
						                                    align: 'center'
						                                },

						                                {
						                                    text: 'Fecha Ingreso',
						                                    dataIndex: 'fec_ingreso',
						                                    width: 150,
						                                    align: 'center'
						                                },
						                                {
						                                    text: 'User',
						                                    dataIndex: 'id_user',
						                                    width: 120,
						                                    align: 'center'
						                                },
						                                {
						                                    text: 'Fecha Update',
						                                    dataIndex: 'fecact',
						                                    width: 150,
						                                    align: 'center'
						                                },

						                                {
						                                    text: 'Estado Registro',
						                                    dataIndex: 'shi_estado',
						                                    loocked : true,
						                                    width: 100,
						                                    align: 'center',
						                                    renderer: function(value, metaData, record, rowIndex, colIndex, store, view){
						                                        //console.log(record);
						                                        metaData.style = "padding: 0px; margin: 0px";
							                                        if(parseInt(record.get('nivel')) == 1) {	
						                                        	var estado = (record.get('shi_estado')=='1')?'check-circle-green-16.png':'check-circle-red.png';
						                                        	var qtip = (record.get('shi_estado')=='1')?'Estado de Cliente Activo.':'Estado de Cliente Inactivo.';
						                                        }
						                                        else
						                                        {
						                                       		var estado = (record.get('shi_estado')=='A')?'check-circle-green-16.png':'check-circle-red.png';
						                                        	var qtip = (record.get('shi_estado')=='A')?'Estado de Area Activo.':'Estado de Area Inactivo.';

						                                        }
						                                        
						                                        return global.permisos({
						                                            type: 'link',
						                                            id_menu: client2.id_menu,
						                                            icons:[
						                                                {id_serv: 2, img: estado, qtip: qtip, js: ""}
						                                            ]
						                                        });
						                                    }
						                                },


						                                {
						                                    text: 'Edición',
						                                    dataIndex: 'estado',
						                                    width: 150,
						                                    align: 'center',
						                                    renderer: function(value, metaData, record, rowIndex, colIndex, store, view){

						                                        if(parseInt(record.get('nivel')) == 1){
						                                        	var clienteform = record.get('shi_nombre');
						                                        	var estadoform = record.get('shi_estado');  	
						                                        	var codigoform = record.get("shi_codigo");  	

						                                        	client2.shi_nombre = record.get('shi_nombre');
						                                        	client2.shi_estado = record.get('shi_estado');
						                                        /*
								                                        if(record.get('shi_estado') == '1'){
									                                        metaData.style = "padding: 0px; margin: 0px";
									                                        return global.permisos({
									                                            type: 'link',
									                                            id_menu: client2.id_menu,

																			

									                                            icons:[
									                                                {id_serv: 2, img: 'ico_editar.gif', qtip: 'Click para Editar Cliente.', js: "client2.getFormMant('U','"+clienteform+"','"+estadoform+"','"+codigoform+"')"},

									                                                {id_serv: 2, img: 'recicle_nov.ico', qtip: 'Click para Desactivar Cliente.', js: "client2.setEditLote("+rowIndex+",'D')"}
									                                            ]
									                                        });
									                                    }else{
									                                        metaData.style = "padding: 0px; margin: 0px";
									                                        return global.permisos({
									                                            type: 'link',
									                                            id_menu: client2.id_menu,

																			

									                                            icons:[
									                                                {id_serv: 2, img: 'ico_editar.gif', qtip: 'Click para Editar Cliente.', js: "client2.getFormMant('U','"+clienteform+"','"+estadoform+"','"+codigoform+"')"}
									                                            ]
									                                        });
								                                        }*/
							                                    }else{
							                                  		var clienteform = record.get('pro_descri');
							                                  		var estadoform = record.get('shi_estado');
							                                  		var codigoform = record.get("shi_codigo");
							                                  		var contraform = record.get("cod_contrato");

						                                        	client2.shi_nombre = record.get('pro_descri');
						                                        	client2.shi_estado = record.get('shi_estado');
						                                        	//client.cod_contrato = record.get("cod_contrato"):


									                                    	if(record.get('shi_estado') == 'A'){
											                                        metaData.style = "padding: 0px; margin: 0px";
											                                        return global.permisos({
											                                            type: 'link',
											                                            id_menu: client2.id_menu,

																					

											                                            icons:[

											                                                {id_serv: 2, img: 'ico_editar.gif', qtip: 'Click para Editar Area.', js: "client2.getFormMant2('U','"+clienteform+"','"+estadoform+"','"+codigoform+"','"+contraform+"')"},


											                                                {id_serv: 2, img: 'recicle_nov.ico', qtip: 'Click para Desactivar Area.', js: "client2.setEditLote2("+rowIndex+",'D')"}
											                                            ]

										                                        });
											                                }        		
											                                else {
											                                        metaData.style = "padding: 0px; margin: 0px";
											                                        return global.permisos({
											                                            type: 'link',
											                                            id_menu: client2.id_menu,

																					

											                                            icons:[

											                                                {id_serv: 2, img: 'ico_editar.gif', qtip: 'Click para Editar Area.', js: "client2.getFormMant2('U','"+clienteform+"','"+estadoform+"','"+codigoform+"','"+contraform+"')"}
											                                            ]

										                                        });

											                                }	
						                                        	
						                                        }
						                                    }
						                                }



											        ],
							                        hideItemsReadFalse: function () {
													    var me = this,
													        items = me.getReferences().treelistRef.itemMap;


													    for(var i in items){
													        if(items[i].config.node.data.read == false){
													            items[i].destroy();
													        }
													    }
													},
							                        trackMouseOver: false,
							                        listeners:{
							                            afterrender: function(obj){
	
							                                
							                            },
														beforeselect:function(obj, record, index, eOpts ){

														}
							                        }
							                    }
											]
										}
										

									]
									
								}
							]
						}
					],
					listeners:{
						beforerender: function(obj, opts){
	                        global.state_item_menu(client2.id_menu, true);
	                    },
	                    afterrender: function(obj, e){

	                        tab.setActiveTab(obj);
	                        global.state_item_menu_config(obj,client2.id_menu);

	                        var name = Ext.getCmp(client2.id+'-txt-cliente').getValue();
                        	var fecha = Ext.getCmp(client2.id+'-txt-fecha-filtro').getValue();

                        	if(fecha == ' ' || fecha == '' ) 
                        
                        	{
                        				fecha = '';
                        	} 
                      
                        	var estado = Ext.getCmp(client2.id+'-txt-estado-filter').getValue();	


					            client2.getReloadGridlotizer(name,fecha,estado);
	                    },
	                    beforeclose:function(obj,opts){
	                    	global.state_item_menu(client2.id_menu, false);
	                    }
					}

				}).show();
			},
			getImagen:function(param){

			},
			setEditLote:function(index,op){
				var rec = Ext.getCmp(client2.id + '-gridTree').getStore().getAt(index);
				client2.shi_codigo = (rec.data.shi_codigo)
				client2.opcion=op;
				if(op!='D'){

					Ext.getCmp(client2.id+'-txt-nombre').setValue(rec.data.shi_nombre);

				  	Ext.getCmp(client2.id+'-txt-estado').setValue(rec.data.shi_estado);

				  	Ext.getCmp(client2.id+'-txt-nombre').focus(true);

				}else{
					client2.set_client(2,'¿Está seguro de Desactivar?');
				}
			},
			setEditLote2:function(index,op){
				var rec = Ext.getCmp(client.id + '-gridTree').getStore().getAt(index);
				client2.shi_codigo = (rec.data.shi_codigo)
				client2.cod_contrato = (rec.data.cod_contrato)
				client2.shi_nombre = (rec.data.shi_nombre)
				client2.shi_estado = (rec.data.shi_estado)
				client2.opcion=op;
				if(op!='D'){

					Ext.getCmp(client2.id+'-txt-nombre').setValue(rec.data.shi_nombre);

				  	Ext.getCmp(client2.id+'-txt-estado').setValue(rec.data.shi_estado);

				  	Ext.getCmp(client2.id+'-txt-nombre').focus(true);

				}else{
					client2.set_contrato(2,'¿Está seguro de Desactivar?');
				}
			},


			set_lotizer_clear:function(){
				Ext.getCmp(client2.id+'-txt-estado-filter').setValue(' ');
				Ext.getCmp(client2.id+'-txt-fecha-filtro').setValue('Y-m-d');
				Ext.getCmp(client2.id+'-txt-cliente').setValue('');

			  	client2.shi_codigo=0;

				client2.opcion='I';
				Ext.getCmp(client2.id+'-txt-cliente').focus(true);
			},

			set_lotizer_clearform:function(){
				Ext.getCmp(client2.id+'-txt-nombre').setValue('');
			  	Ext.getCmp(client2.id+'-txt-estado').setValue('1');
				Ext.getCmp(client2.id+'-txt-nombre').focus(true);
			},





			setValidaLote:function(){
				if(client2.opcion=='I' || client2.opcion=='U'){
					var nombre = Ext.getCmp(client2.id+'-txt-nombre').getValue();
					if(nombre== null || nombre==''){
			            global.Msg({msg:"Ingrese un nombre por favor.",icon:2,fn:function(){}});
			            return false;
			        }
			        var estado = Ext.getCmp(client2.id+'-txt-estado').getValue();
			        if(estado== null || estado==''){
			            global.Msg({msg:"Ingrese un estado por favor.",icon:2,fn:function(){}});
			            return false; 
			        }
			    }
		        return true;
			},

			set_client:function(ico,msn){
				if(!client2.setValidaLote())return;
				global.Msg({
                    msg: msn,
                    icon: ico,
                    buttons: 3,
                    fn: function(btn){
                    	if (btn == 'yes'){
	                        Ext.getCmp(client2.id+'-tab').el.mask('Cargando…', 'x-mask-loading');
	                        Ext.Ajax.request({
								url: client2.url + 'set_client/',
								params:{
									vp_op: client2.opcion,
									vp_shi_codigo:client2.shi_codigo,
			                        vp_nombre:client2.shi_nombre,
			                        vp_estado:client2.shi_estado
								},
								success:function(response,options){
									var res = Ext.decode(response.responseText);
									Ext.getCmp(client2.id+'-tab').el.unmask();
									global.Msg({
		                                msg: res.msn,
		                                icon: parseInt(res.error),
		                                buttons: 1,
		                                fn: function(btn){
		                                    if(parseInt(res.error)==1){
		                                    	if (client2.opcion == 'U' || client2.opcion == 'I') {
		                                    	//Ext.getCmp(client.id+'-win-form').close();
		                                    	}
		                                    	client2.getReloadGridlotizer('');
		                                    	client2.set_lotizer_clear();
		                                    }
		                                }
		                            });
				    			}
				    		});
				    	}
		            }
                });
			},

			set_contrato:function(ico,msn){
				if(!client2.setValidaLote())return;
				global.Msg({
                    msg: msn,
                    icon: ico,
                    buttons: 3,
                    fn: function(btn){
                    	if (btn == 'yes'){
	                        Ext.getCmp(client2.id+'-tab').el.mask('Cargando…', 'x-mask-loading');
	                        Ext.Ajax.request({
								url: client2.url + 'set_contrato/',
								params:{
									vp_op: client2.opcion,
									vp_shi_codigo:client2.shi_codigo,
			                        vp_nombre:client2.shi_nombre,
			                        vp_estado:client2.shi_estado,
			                        vp_cod_contrato:client2.cod_contrato
								},
								success:function(response,options){
									var res = Ext.decode(response.responseText);
									Ext.getCmp(client2.id+'-tab').el.unmask();
									global.Msg({
		                                msg: res.msn,
		                                icon: parseInt(res.error),
		                                buttons: 1,
		                                fn: function(btn){
		                                    if(parseInt(res.error)==1){
		                                    	if (client2.opcion == 'U' || client2.opcion == 'I') {
		                                    	//Ext.getCmp(client.id+'-win-form').close();
		                                    	}
		                                    	client2.getReloadGridlotizer('');
		                                    	client2.set_lotizer_clear();
		                                    }
		                                }
		                            });
				    			}
				    		});
				    	}
		            }
                });
			},


			getContratos:function(shi_codigo){
				Ext.getCmp(client2.id+'-cbx-contrato').getStore().removeAll();
				Ext.getCmp(client2.id+'-cbx-contrato').getStore().load(
	                {params: {vp_shi_codigo:shi_codigo},
	                callback:function(){

	                }
	            });
			},
			getReloadGridlotizer:function(name,fecha,estado){

				Ext.getCmp(client2.id + '-gridTree').getStore().load(
	                {params: {vp_name:name,vp_date:fecha,vp_estado:estado},
	                callback:function(){

	                }
	            });
			},
			getReloadGridlotizer2:function(id_lote){
				Ext.getCmp(client2.id+'-form').el.mask('Cargando…', 'x-mask-loading');

				Ext.getCmp(client2.id + '-grid-client').getStore().load(
	                {params: {vp_id_lote:id_lote},
	                callback:function(){
	                	Ext.getCmp(client2.id+'-form').el.unmask();
	                }
	            });
			},
			setNuevo:function(){

				Ext.getCmp(client2.id+'-txt-nombre').setValue('');
				Ext.getCmp(client2.id+'-txt-nombre').setReadOnly(false);
				Ext.getCmp(client2.id+'-txt-tipdoc').setValue('');
				Ext.getCmp(client2.id+'-txt-tipdoc').setReadOnly(false);
				Ext.getCmp(client2.id+'-txt-fecha').setValue('');
				Ext.getCmp(client2.id+'-txt-fecha').setReadOnly(false);
				Ext.getCmp(client2.id+'-txt-estado').setValue('');
				Ext.getCmp(client2.id+'-txt-estado').setReadOnly(false);
				Ext.getCmp(client2.id+'-txt-tot_folder').setValue('');
				Ext.getCmp(client2.id+'-txt-tot_folder').setReadOnly(false);
				Ext.getCmp(client2.id+'-txt-nombre').focus();
			},

			getFormMant:function(op,cliente,estado,codigo){
				client2.shi_codigo = codigo;
				client2.opcion = op;
				if (op == 'U') {
					var titulo = 'Edición Cliente';
					var icono = "/images/icon/edit.png";
					var oculto = "false";
				} 
				else
				{
					var titulo = 'Nuevo Cliente';
					var icono = "/images/icon/add_green_button.png";	
					var oculto = "true";
				}


				var myData = [
				    ['1','Activo']
				    /*,
				    ['0','Inactivo']*/
				];
				var store_estado = Ext.create('Ext.data.ArrayStore', {
			        storeId: 'estado',
			        autoLoad: true,
			        data: myData,
			        fields: ['code', 'name']
			    });

				Ext.create('Ext.window.Window',{
	                id:client2.id+'-win-form',
	                plain: true,
	                title:titulo,
	                icon: icono,
	                height: 200,
	                width: 1000,
	                resizable:false,
	                modal: true,
	                border:false,
	                closable:true,
	                padding:20,
	                items:[

												{
			                                        xtype: 'fieldset',
			                                        margin: '5 5 5 10',
			                                        title:'<b>Mantenimiento Clientes</b>',
			                                        border:true,
			                                        bodyStyle: 'background: transparent',
			                                        padding:'2px 5px 1px 5px',
			                                        layout:'column',
			                                        items: [
			                                            {	
			                                            	hidden : oculto,	
			                                                columnWidth: .3,border:false,
			                                                padding:'10px 2px 0px 0px',  bodyStyle: 'background: transparent',
			                                                items:[
			                                                    {
			                                                        xtype: 'textfield',
			                                                        fieldLabel: 'id_Cliente',
			                                                        labelWidth:50,
			                                                        readOnly:true,
			                                                        labelAlign:'right',
			                                                        width:'100%',
			                                                        anchor:'100%',
			                                                        value:codigo
			                                                    }
			                                                ]
			                                            },

			                                            {
			                                                columnWidth: .3,border:false,
			                                                padding:'10px 2px 0px 0px',  bodyStyle: 'background: transparent',
			                                                items:[
			                                                    {
			                                                        xtype: 'textfield',
			                                                        fieldLabel: 'Cliente',
			                                                        id:client2.id+'-txt-nombre',
			                                                        labelWidth:60,
			                                                        labelAlign:'right',
			                                                        width:'100%',
			                                                        anchor:'100%',
			                                                        value:cliente
			                                                    }
			                                                ]
			                                            },
			                                            {
		                                               		width: 150,border:false,
		                                                	padding:'10px 2px 0px 0px',  bodyStyle: 'background: transparent',
		                                             		items:[
				                                                    {
				                                                        xtype:'combo',
				                                                        fieldLabel: 'Estado',
				                                                        id:client2.id+'-txt-estado',
				                                                        store: store_estado,
				                                                        queryMode: 'local',
				                                                        triggerAction: 'all',
				                                                        valueField: 'code',
				                                                        displayField: 'name',
				                                                        emptyText: '[Seleccione]',
				                                                        labelAlign:'right',
				                                                        value:estado,
				                                                        labelWidth: 60,
				                                                        width:'100%',
				                                                        anchor:'100%',
				                                                        listeners:{
				                                                            afterrender:function(obj, e){

				                                                                Ext.getCmp(client2.id+'-txt-estado').setValue('1');
				                                                            },
				                                                            select:function(obj, records, eOpts){
				                                                    
				                                                            }
				                                                        }
				                                                    }
		                                             		]
		                                                },
									                    {

															margin:'10px 2px 0px 0px',  bodyStyle: 'background: transparent',
									                        xtype:'button',
									                        width:80,
									                        text: 'Limpiar',
									                        icon: '/images/icon/broom.png',
									                        listeners:{
									                            beforerender: function(obj, opts){
									                                
									                            },
									                            click: function(obj, e){
																	client2.set_lotizer_clearform();
									                            }
									                        }
									                    }
			                                            
			                                        ]
			                                    }



	                ],
	                bbar:[       
		                                                {

															id: client2.id + '-grabar',
															margin:'10px 2px 0px 0px',  bodyStyle: 'background: transparent',
									                        xtype:'button',
									                        width:80,
									                        text: 'Grabar',
									                        icon: '/images/icon/save.png',
									                        listeners:{
									                            beforerender: function(obj, opts){

									                            },
									                            click: function(obj, e){
									                            	Ext.getCmp(client2.id+'-win-form').el.mask('Cargando…', 'x-mask-loading');
									                            	client2.shi_estado = Ext.getCmp(client2.id+'-txt-estado').getValue();
									                           		client2.shi_nombre = Ext.getCmp(client2.id+'-txt-nombre').getValue();

																	client2.set_client(3,'¿Está seguro de guardar?');
																	Ext.getCmp(client2.id+'-win-form').close();

									                            }
									                        }
									                    },
	                    '-',
	                    {
	                        xtype:'button',
	                        text: 'Salir',
	                        icon: '/images/icon/get_back.png',
	                        listeners:{
	                            beforerender: function(obj, opts){

	                            },
	                            click: function(obj, e){
	                                Ext.getCmp(client2.id+'-win-form').close();
	                            }
	                        }
	                    },
	                    '-'
	                ],
	                listeners:{
	                    'afterrender':function(obj, e){ 



	                    },
	                    'close':function(){

	                    }
	                },

	            }).show().center();

			},

			getFormMant2:function(op,cliente,estado,codigo,contrato){
				client2.shi_codigo = codigo;
				client2.cod_contrato = contrato;
				client2.opcion = op;
				if (op == 'U') {
					var titulo = 'Edición Area';
					var icono = "/images/icon/edit.png";
					var oculto = "false";
				} 
				else
				{
					var titulo = 'Nueva Area';
					var icono = "/images/icon/add.png";	
					var oculto = "true";

				}


					var store_shipper = Ext.create('Ext.data.Store',{
		                fields: [
		                    {name: 'shi_codigo', type: 'string'},
		                    {name: 'shi_nombre', type: 'string'},
		                    {name: 'shi_logo', type: 'string'},
		                    {name: 'fec_ingreso', type: 'string'},                    
		                    {name: 'shi_estado', type: 'string'},
		                    {name: 'id_user', type: 'string'},
		                    {name: 'fecha_actual', type: 'string'}
		                ],
		                autoLoad:true,
		                proxy:{
		                    type: 'ajax',
		                    url: client2.url+'get_list_shipper/',
		                    reader:{
		                        type: 'json',
		                        rootProperty: 'data'
		                    }
		                },
		                listeners:{
		                    load: function(obj, records, successful, opts){
		                        
		                    }
		                }
		            });

					var store_usr_shipper = Ext.create('Ext.data.Store',{
		                fields: [
		                    {name: 'shi_codigo', type: 'string'},
		                    {name: 'shi_nombre', type: 'string'},
		                    {name: 'shi_logo', type: 'string'},
		                    {name: 'fec_ingreso', type: 'string'},                    
		                    {name: 'shi_estado', type: 'string'},
		                    {name: 'id_user', type: 'string'},
		                    {name: 'fecha_actual', type: 'string'}
		                ],
		                autoLoad:true,
		                proxy:{
		                    type: 'ajax',
		                    url: client2.url+'get_usr_shipper/',
		                    reader:{
		                        type: 'json',
		                        rootProperty: 'data'
		                    }
		                },
		                listeners:{
		                    load: function(obj, records, successful, opts){
		                        
		                    }
		                }
		            });		            



				var myData = [
				    ['A','Activo']/*,
				    ['I','Inactivo']*/
				];
				var store_estado = Ext.create('Ext.data.ArrayStore', {
			        storeId: 'estado',
			        autoLoad: true,
			        data: myData,
			        fields: ['code', 'name']
			    });

				if (op == 'U') {

				Ext.create('Ext.window.Window',{
	                id:client2.id+'-win-form',
	                plain: true,
	                title:titulo,
	                icon: icono,
	                height: 300,
	                width: 1500,
	                resizable:false,
	                modal: true,
	                border:false,
	                closable:true,
	                padding:20,
	                items:[

												{
			                                        xtype: 'fieldset',
			                                        margin: '5 5 5 10',
			                                        title:'<b>Mantenimiento Areas</b>',
			                                        border:true,
			                                        bodyStyle: 'background: transparent',
			                                        padding:'2px 5px 1px 5px',
			                                        layout:'column',
			                                        items: [
			                                            {	
			                                            	hidden : true,	
			                                                columnWidth: .3,border:false,
			                                                padding:'10px 2px 0px 0px',  bodyStyle: 'background: transparent',
			                                                items:[
			                                                    {
			                                                        xtype: 'textfield',
			                                                        fieldLabel: 'id_Contrato',
			                                                        labelWidth:50,
			                                                        readOnly:true,
			                                                        labelAlign:'right',
			                                                        width:'100%',
			                                                        anchor:'100%',
			                                                        value:contrato
			                                                    }
			                                                ]
			                                            },


			                                            {
			                                                columnWidth: .3,border:false,
			                                                padding:'10px 2px 0px 0px',  bodyStyle: 'background: transparent',
			                                                items:[
			                                                    {
			                                                        xtype: 'textfield',
			                                                        fieldLabel: 'Areas',
			                                                        id:client2.id+'-txt-nombre',
			                                                        labelWidth:60,
			                                                        labelAlign:'right',
			                                                        width:'100%',
			                                                        anchor:'100%',
			                                                        value:cliente
			                                                    }
			                                                ]
			                                            },
			                                            {
		                                               		width: 150,border:false,
		                                                	padding:'10px 2px 0px 0px',  bodyStyle: 'background: transparent',
		                                             		items:[
				                                                    {
				                                                        xtype:'combo',
				                                                        fieldLabel: 'Estado',
				                                                        id:client2.id+'-txt-estado',
				                                                        store: store_estado,
				                                                        queryMode: 'local',
				                                                        triggerAction: 'all',
				                                                        valueField: 'code',
				                                                        displayField: 'name',
				                                                        emptyText: '[Seleccione]',
				                                                        labelAlign:'right',
				                                                        value:estado,
				                                                        labelWidth: 60,
				                                                        width:'100%',
				                                                        anchor:'100%',
				                                                        listeners:{
				                                                            afterrender:function(obj, e){

				                                                                Ext.getCmp(client2.id+'-txt-estado').setValue('A');
				                                                            },
				                                                            select:function(obj, records, eOpts){
				                                                    
				                                                            }
				                                                        }
				                                                    }
		                                             		]
		                                                },
									                    {

															margin:'10px 2px 0px 0px',  bodyStyle: 'background: transparent',
									                        xtype:'button',
									                        width:80,
									                        text: 'Limpiar',
									                        icon: '/images/icon/broom.png',
									                        listeners:{
									                            beforerender: function(obj, opts){
									                                
									                            },
									                            click: function(obj, e){
																	client2.set_lotizer_clearform();
									                            }
									                        }
									                    }
			                                            
			                                        ]
			                                    }



	                ],
	                bbar:[       
		                                                {

															id: client2.id + '-grabar',
															margin:'10px 2px 0px 0px',  bodyStyle: 'background: transparent',
									                        xtype:'button',
									                        width:80,
									                        text: 'Grabar',
									                        icon: '/images/icon/save.png',
									                        listeners:{
									                            beforerender: function(obj, opts){

									                            },
									                            click: function(obj, e){
									                            	//client.shi_codigo = Ext.getCmp(client.id+'-cbx-cliente').getValue();

									                            	Ext.getCmp(client2.id+'-win-form').el.mask('Cargando…', 'x-mask-loading');
									                            	client2.shi_estado = Ext.getCmp(client2.id+'-txt-estado').getValue();
									                           		client2.shi_nombre = Ext.getCmp(client2.id+'-txt-nombre').getValue();
									                           		client2.shi_codigo = Ext.getCmp(client2.id+'-cbx-cliente').getValue();

																	client2.set_contrato(3,'¿Está seguro de guardar?');
																	Ext.getCmp(client2.id+'-win-form').close();

									                            }
									                        }
									                    },
	                    '-',
	                    {
	                        xtype:'button',
	                        text: 'Salir',
	                        icon: '/images/icon/get_back.png',
	                        listeners:{
	                            beforerender: function(obj, opts){

	                            },
	                            click: function(obj, e){
	                                Ext.getCmp(client2.id+'-win-form').close();
	                            }
	                        }
	                    },
	                    '-'
	                ],
	                listeners:{
	                    'afterrender':function(obj, e){ 

	                    },
	                    'close':function(){

	                    }
	                },

	            }).show().center();

				}
				else
				{
				Ext.create('Ext.window.Window',{
	                id:client2.id+'-win-form',
	                plain: true,
	                title:titulo,
	                icon: icono,
	                height: 300,
	                width: 1500,
	                resizable:false,
	                modal: true,
	                border:false,
	                closable:true,
	                padding:20,
	                items:[

												{
			                                        xtype: 'fieldset',
			                                        margin: '5 5 5 10',
			                                        title:'<b>Mantenimiento Areas</b>',
			                                        border:true,
			                                        bodyStyle: 'background: transparent',
			                                        padding:'2px 5px 1px 5px',
			                                        layout:'column',
			                                        items: [
			                                            {	
			                                            	hidden : true,	
			                                                columnWidth: .3,border:false,
			                                                padding:'10px 2px 0px 0px',  bodyStyle: 'background: transparent',
			                                                items:[
			                                                    {
			                                                        xtype: 'textfield',
			                                                        fieldLabel: 'id_Contrato',
			                                                        labelWidth:50,
			                                                        readOnly:true,
			                                                        labelAlign:'right',
			                                                        width:'100%',
			                                                        anchor:'100%',
			                                                        value:contrato
			                                                    }
			                                                ]
			                                            },

		                                    	{
		                                    		
			                                   		width: 250,border:false,
			                                    	padding:'10px 2px 0px 0px',  
		                                            bodyStyle: 'background: transparent',
			                                 		items:[
			                                                {
			                                                	
			                                                    xtype:'combo',
			                                                    fieldLabel: 'Cliente',
			                                                    id:client2.id+'-cbx-cliente',
			                                                    store: store_usr_shipper,
			                                                    queryMode: 'local',
			                                                    triggerAction: 'all',
			                                                    valueField: 'shi_codigo',
			                                                    displayField: 'shi_nombre',
			                                                    emptyText: '[Seleccione]',
			                                                    labelAlign:'right',
			                                                    //hidden: true,
			                                                    //allowBlank: false,
			                                                    labelWidth: 50,
			                                                    width:'100%',
			                                                    anchor:'100%',

			                                                    //readOnly: true,
			                                                    listeners:{
			                                                    	beforerender: function(obj, opts){
					                                                  /*	if (op == 'I') {
					                                                		setVisible(true);
					                                                	}*/
									                            	},

			                                                        afterrender:function(obj, e){
			                                                            // obj.getStore().load();
			                                                        },
			                                                        select:function(obj, records, eOpts){

			                                                        	//Ext.getCmp(client.id+'-cbx-contrato').setValue('');
			                                                			//lotizer.getContratos(records.get('shi_codigo'));
			                                                        }
			                                                    }
			                                                }
			                                 		]
			                                 
			                                    },

			                                            {
			                                                columnWidth: .3,border:false,
			                                                padding:'10px 2px 0px 0px',  bodyStyle: 'background: transparent',
			                                                items:[
			                                                    {
			                                                        xtype: 'textfield',
			                                                        fieldLabel: 'Areas',
			                                                        id:client2.id+'-txt-nombre',
			                                                        labelWidth:60,
			                                                        labelAlign:'right',
			                                                        width:'100%',
			                                                        anchor:'100%',
			                                                        value:cliente
			                                                    }
			                                                ]
			                                            },
			                                            {
		                                               		width: 150,border:false,
		                                                	padding:'10px 2px 0px 0px',  bodyStyle: 'background: transparent',
		                                             		items:[
				                                                    {
				                                                        xtype:'combo',
				                                                        fieldLabel: 'Estado',
				                                                        id:client2.id+'-txt-estado',
				                                                        store: store_estado,
				                                                        queryMode: 'local',
				                                                        triggerAction: 'all',
				                                                        valueField: 'code',
				                                                        displayField: 'name',
				                                                        emptyText: '[Seleccione]',
				                                                        labelAlign:'right',
				                                                        value:estado,
				                                                        labelWidth: 60,
				                                                        width:'100%',
				                                                        anchor:'100%',
				                                                        listeners:{
				                                                            afterrender:function(obj, e){

				                                                                Ext.getCmp(client2.id+'-txt-estado').setValue('A');
				                                                            },
				                                                            select:function(obj, records, eOpts){
				                                                    
				                                                            }
				                                                        }
				                                                    }
		                                             		]
		                                                },
									                    {

															margin:'10px 2px 0px 0px',  bodyStyle: 'background: transparent',
									                        xtype:'button',
									                        width:80,
									                        text: 'Limpiar',
									                        icon: '/images/icon/broom.png',
									                        listeners:{
									                            beforerender: function(obj, opts){
									                                
									                            },
									                            click: function(obj, e){
																	client2.set_lotizer_clearform();
									                            }
									                        }
									                    }
			                                            
			                                        ]
			                                    }



	                ],
	                bbar:[       
		                                                {

															id: client2.id + '-grabar',
															margin:'10px 2px 0px 0px',  bodyStyle: 'background: transparent',
									                        xtype:'button',
									                        width:80,
									                        text: 'Grabar',
									                        icon: '/images/icon/save.png',
									                        listeners:{
									                            beforerender: function(obj, opts){

									                            },
									                            click: function(obj, e){


									                            	Ext.getCmp(client2.id+'-win-form').el.mask('Cargando…', 'x-mask-loading');
									                            	client2.shi_codigo = Ext.getCmp(client2.id+'-cbx-cliente').getValue();
									                            	client2.shi_estado = Ext.getCmp(client2.id+'-txt-estado').getValue();
									                           		client2.shi_nombre = Ext.getCmp(client2.id+'-txt-nombre').getValue();

																	client2.set_contrato(3,'¿Está seguro de guardar?');
																	Ext.getCmp(client2.id+'-win-form').close();	


									                            }
									                        }
									                    },
	                    '-',
	                    {
	                        xtype:'button',
	                        text: 'Salir',
	                        icon: '/images/icon/get_back.png',
	                        listeners:{
	                            beforerender: function(obj, opts){

	                            },
	                            click: function(obj, e){
	                                Ext.getCmp(client2.id+'-win-form').close();
	                            }
	                        }
	                    },
	                    '-'
	                ],
	                listeners:{
	                    'afterrender':function(obj, e){ 

	                    },
	                    'close':function(){

	                    }
	                },

	            }).show().center();

				}

			}





		}
		Ext.onReady(client2.init,client2);
		Ext.getCmp(client2.id+'-txt-cliente').focus(true);

	}else{
		tab.setActiveTab(client2.id+'-tab');
	}
</script>2