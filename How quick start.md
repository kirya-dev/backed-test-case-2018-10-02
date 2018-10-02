composer create-project symfony/framework-standard-edition chulakov-test
cd chulakov-test

composer require sonata-project/admin-bundle

CREATE USER & DATABASE:
	create database my_test_db with owner postgres;


psql -h localhost -U postgres -d my_test_db -f database.sql



//для работы импорта
composer require sonata-project/doctrine-orm-admin-bundle
composer require symfony/dependency-injection

//импортим в xml
bin/console doctrine:mapping:import --force AppBundle yml

//импортим в Entity
bin/console doctrine:mapping:convert annotation ./src

//Генерим методы
bin/console doctrine:generate:entities AppBundle

//Обновляем схему на всякий
bin/console doctrine:schema:update --force


bin/console sonata:admin:generate AppBundle/Entity/Stuff
bin/console sonata:admin:generate AppBundle/Entity/Department
