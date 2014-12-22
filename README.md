CrmMentions
===========

Esta aplicação foi feita como forma de demonstração de minhas habilidades com o RubyOnRails. Tem o objetivo de buscar os tweets de que mencionam determinado usuário para descobrir o que está sendo dito no Twitter.
### Versões
Ruby version

Esta aplicação utliza o Ruby na versão 2.1.3.
	
```console
$ ruby -v
ruby 2.1.3p242 (2014-09-19 revision 47630) [x86_64-linux]
```
	
e o Rails versão 4.2.
	
```console
$ rails -v
Rails 4.2.0.rc2
```

###Instalação

Para realizar a instalação da ferramenta é necessário baixar o código do github, para isso digite

```console
$ git clone https://github.com/GabrielMalakias/CrmMentions.git
```

Após o download execute, para instalar as gems necessárias

```console
$ bundle install
```
Se faz necessário também a criação e configuração do banco de dados, para isso configure o database.yml com o usuário e senha do mysql e depois execute

```console
$ rake db:migrate
```

Para rodar o projeto

```console
$ rails s
```
Abra o navegador de sua preferência e acesse o projeto com a seguinte url

	http://localhost:3000 ou http://127.0.0.1:3000/

### Atualização

Este projeto utiliza a gem <a href="https://github.com/collectiveidea/delayed_job">delayed_job</a>, para processamentos assíncronos, assim após solicitar o update no menu do projeto e escolher o tipo de resultado, execute 
	
```console
$ rake jobs:work 
```

Este passo fará o download e criação dos tweets no banco de dados local

### Testes

Para executar os testes execute 
```console
$ rspec
```