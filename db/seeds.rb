# Academy.create(name: "Bienestar y cuidado", description: "Esta categoría agrupa aquellos cursos orientados a la atención de ciertos grupos y/o al cuidado de algún aspecto de la salud. En esta academia contamos con cuatro estándares acreditados.")
# Academy.create(name: "Comunicación e idiomas", description: "El objetivo de esta categoría es agrupar aquellos cursos que se orienten a la mejora de las habilidades comunicativas en español o en una lengua extranjera. También incluye los cursos de Lengua de Señas Mexicana.")
# Academy.create(name: "Energía y medio ambiente", description: "Es una categoría que incluye los cursos orientados a la enseñanza de métodos, técnicas y asuntos relacionados con las energías verdes.")
# Academy.create(name: "Educación", description: "Agrupa a todos los cursos orientados a la capacitación de las personas: desde las técnicas instruccionales hasta la elaboración de los materiales necesarios en cualquier proceso de formación de personal.")
# Academy.create(name: "Gobierno y asuntos públicos", description: "Esta academia ofrece una oferta orientada a la profesionalización de los cuadros de servidores públicos en distintos temas, siempre con el objetivo de asegurar que la atención al ciudadano sea la prioridad.")
# Academy.create(name: "Movilidad y transporte", description: "Comprende los cursos orientados a la mejora del servicio que prestan los operadores de transporte público, en su mayoría.")
# Academy.create(name: "Negocios y administración", description: "El objetivo de la academia es proporcionar cursos para la profesionalización de mandos medios y superiores al interior de las organizaciones. Se enfoca en el desarrollo de habilidades administrativas necesarias para contribuir al incremento de la productividad de una organización.")
# Academy.create(name: "Sociohabilidades", description: "Es una academia que reúne los cursos comúnmente conocidos como de habilidades blandas y su intención es contribuir al desarrollo de la empleabilidad de las personas que se encuentran laborando o de aquellas que están en búsqueda de un trabajo remunerado.")
# Academy.create(name: "Tecnología e innovación", description: "Comprende aquellos cursos que buscan desarrollar las habilidades mínimas en el manejo de la paquetería comercial, por un lado, y en aquellas para proporcionar mantenimiento básico a equipos de cómputo, por el otro.")
# Academy.create(name: "Turismo y gastronomía", description: "En esta categoría encontrarás la oferta que se relaciona con la producción de alimentos y con los servicios asociados al sector turismo.")

# Warehouse
w1 = Warehouse.create(name: "Almacen 1")
w2 = Warehouse.create(name: "Almacen 2")
w3= Warehouse.create(name: "Control de bienes")

# Shelf
s1 = Shelf.create(warehouse_id: w1.id, category: "Anaquel 2")
s2 = Shelf.create(warehouse_id: w2.id, category: "Anaquel 1")
s3 = Shelf.create(warehouse_id: w1.id, category: "Anaquel 3")

ShelfSection.create(shelf_id: s1.id, number: 1)
ShelfSection.create(shelf_id: s2.id, number: 2)
ShelfSection.create(shelf_id: s3.id, number: 3)
ShelfSection.create(shelf_id: s1.id, number: 5)
ShelfSection.create(shelf_id: s1.id, number: 5)