# Storyboard, XIBs, View Code ou SwiftUI?

## Nosso problema

Antigamente, ~~quando tudo era mato~~, aqui no Elo7 implementamos uma [arquitetura](https://blog.elo7.dev/minimizando-codigo-duplicado-com-react-native/) onde o desenvolvimento de layouts era a partir do React Native, era uma arquitetura que resolvia um grande problema nosso à época: a duplicação de código para as duas plataformas (iOS e Android) que distribuímos nossos aplicativos (Elo7 e Talk7). E por muito tempo foi uma boa solução, mas acabamos nos deparando com um problema (que até hoje não sabemos se tem alguma solução, se você souber alguma forma comente aqui :D).

Queríamos desenvolver features e comportamentos mais complexos e que entregariam uma experiência *fora de série* para nossos usuários e para isso precisávamos alinhar o Gerenciamento de Estado (*componentDidMount, componentDidUpdate, etc.*) do React Native com o Ciclo de Vida do Nativo (*onCreate, viewDidLoad, onDestroy, viewWillDisappear, etc.*). Nesse tempo desenvolvemos várias POCs (*proof of concepts*) e nenhuma supriu nossas expectativas, decidimos então que era improdutivo evoluir aquela arquitetura.

Neste momento, em paralelo, discutíamos sobre a implementação do nosso BFF (*Backend For Frontend*) [link pro post do BFF] e como ele alimentaria nossos aplicativos, durante essas discussões resolvemos também falar sobre nossa stack que até o momento era Nativo + React Native e apresentamos propostas sobre irmos para Full Nativo ou fazer um *hard reset* e começar tudo com Flutter (ta na moda, né?!). Discutimos sobre todos esse assuntos e tomamos a decisão por *n* fatores que o Nativo supriria nosso problema.

## Nosso mais novo problema

Beleza vamos implementar código nativo, qual nossa primeira barreira? Temos várias telas em React Native no nosso projeto e para ficar com código full nativo teríamos que começar a implementá-las em nativo. E como faríamos isso? Para o Android seguimos o padrão que é criar layouts em *XML*, mas e para o iOS como vamos prosseguir? Temos os Storyboards, temos os XIBs, temos o ViewCode, qual deles nos ajudaria e elevaria a qualidade da nossa entrega? 

## Storyboards: Clicar, arrastar e deixar tudo junto

Nossa primeira opção foram os Storyboards. Os storyboards são simples de implementar, apesar de ter algumas coisas que não são tão simples, se você já tentou fazer um botão arredondado com storyboard sabe do que eu estou falando.

A curva de aprendizado com storyboards é muito menor com relação ao View Code e a prototipagem é facilitada com o InterfaceBuilder, então storyboards seriam uma boa solução para nós.

*Seriam*, por conta de trabalharmos em equipe e adotarmos o *pair programming* ainda tentamos paralelizar o máximo das entregas possíveis, portanto é provável que em algum momento duas ou mais partes da equipe estejam trabalhando no mesmo storyboard. Quando vários desenvolvedores trabalham no mesmo arquivo de storyboard ao mesmo tempo conflitos serão inevitáveis. O storyboard é um arquivo XML gerenciado pelo próprio Xcode, e cada linha de código desse XML não é tão simples de entender, imagine então resolver conflitos, me dá até calafrios pensar nisso.

Além dos conflitos, uma outra premissa que queríamos é a reutilização de código, no caso de storyboards reutilizar um não é tão trivial. Para instanciar um storyboard em um outro fluxo é necessário que você instancie o storyboard **completo**, você não pode simplesmente instanciar uma única *ViewController* presente naquele storyboard.

## XIBs: Clicar, arrastar e deixar tudo separado

Nossa segunda alternativa, XIBs. Os XIBs parecem uma ideia interessante, assim como o Storyboard são simples de implementar e também temos o feedback visual. Mas além de carregar os pontos fortes do storyboard os XIBs carregam também o ponto fraco, problemas de conflitos (em menor escala, é verdade).

Bom os conflitos são em menor escala, teoricamente seria difícil ter dois ou mais desenvolvedores trabalhando no mesmo arquivo então ainda é uma solução plausível. Sim, mas no Elo7 temos telas dinâmicas, várias das informações que são apresentadas nas nossas telas são decididas pelo nosso BFF, portanto não temos certeza de quais informações o nosso layout vai exibir. E os arquivos XIBs não são tão propensos a esse "dinamismo" tornando eles uma solução parcial para nosso problema.

## SwiftUI: Inovação inviável

SwiftUI foi uma alternativa que pensamos a respeito, nosso principal empecilho é a necessidade de termos nosso aplicativos com versão mínima suportada iOS 13. Fizemos um breve estudo sobre nossa base de usuários e vimos que uma boa quantidade de usuários utilizam o SO em versões abaixo da 13, portanto SwiftUI foi descartado no momento, quem sabe no futuro.

## View Code: Código? É! Código!

Chegamos então a nossa terceira alternativa, o View Code. No nosso time já tínhamos um integrante com experiência em View Code e que defendia a implementação.

> "Ahhhhh, é código, código vocês sabem fazer." (QUALQUER, Pessoa).

Apesar de ser a solução mais "complexa", foi a que melhor atendeu nossos problemas e nossas expectativas. O view code tem uma curva de aprendizado muito maior que XIBs e Storyboards, além de que o maior **Pró** das outras alternativas é o maior **Contra** do view code, o feedback visual.

O view code tem evoluído bastante nos últimos tempos, além das próprias bibliotecas da Apple, atualmente temos bibliotecas que auxiliam na implementação como o [SnapKit](https://snapkit.io) (~~torne-se também uma Testemunha de SnapKit!~~).

Para view code a Apple disponibiliza três alternativas de implementação, o *Visual Format, Layout Constraints e Layout Anchors.* Nossa proposta inicial era começar com *Layout Anchors*, é o mais recente entre os três e que apresentava uma curva de aprendizagem mais interessante para nós. No meio dos nossos estudos encontramos uma alternativa que nos servia ainda melhor, o SnapKit! É uma biblioteca que encapsula algumas funcionalidades do *Layout Anchors* e torna nossa vida um pouco mais simples! Vou trazer alguns exemplos das 4 alternativas abaixo e discutir um pouco sobre o que encontramos de bom e ruim em cada uma delas.

### Protótipo

 **Vou utilizar uma tela bem simples para demonstrar como é a implementação, ela tem um *Label* e um *Button*, nada muito elaborado:

![Storyboard,%20XIBs,%20View%20Code%20ou%20SwiftUI%20fe8ba55b397d42f48113ed88b6613e40/Untitled.png](Storyboard,%20XIBs,%20View%20Code%20ou%20SwiftUI%20fe8ba55b397d42f48113ed88b6613e40/Untitled.png)

Uma tela simples com um texto e um botão.

```swift
import UIKit

class ViewController: UIViewController {

	private lazy var label: UILabel = {
		let label = UILabel()
		label.text = "Exemplo de View Code"
		label.textAlignment = .center
		return label
	}

	private lazy var button: UIButton = {
		let button = UIButton()
		button.setTitle("Botão que faz nada", for: .normal)
		button.backgroundColor = .systemYellow
		button.layer.cornerRadius = 15		
		return button
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		view.addSubview(label)
		view.addSubview(button)

		//TODO: Call a constraint method here.
	}

	[...]
```

## Visual Format

Essa é a forma mais antiga de implementação de view code e provavelmente a menos utilizada. Ela não é tão objetiva e simples de entender, eu mesmo nunca tinha visto até então. Mas basicamente é uma *String* com caracteres especiais que simbolizam componentes, orientações, distanciamentos, conexões, etc.

A formatação da *String* segue o seguinte padrão:

```swift
<orientation>:<superview><connection>[<view>](<connection><view>)<connection><superview>
```

E apresenta os seguintes símbolos especiais:

```swift
**V:** orientação vertical

**H:** orientação horizontal

**|:** superview

**-:** espaçamento padrão (8 px)

**==:** larguras iguais (opcional)

**-20-:** espaçamento (20 px)

**<=:** menor ou igual

**>=:** maior ou igual

**@XXX:** prioridade da constraint (valor entre 0 e 1000):

	@**250:** baixa prioridade

	@**750:** alta prioridade

	@**1000:** obrigatório
```

Vou pegar de exemplo a *String* de formatação que usamos logo abaixo para definir as constraints horizontais do nosso *Label*:

```swift
[...]
	withVisualFormat: "H:|-20-[label]-20-|"
[...]
```

Primeiro precisamos definir qual a orientação da nossa constraint, já que nossa constraint é horizontal usamos o **H** (*horizontal*), em seguida definimos o componente ao qual vamos "amarrar" a constraint a nossa esquerda, no caso o **|** (nossa *superview*) e adicionamos o tamanho da constraint que queremos, **-20-** (20 de distância entre a *superview* e o próximo componente), assim declaramos o componente que queremos distanciar, nossa **[label]** e então declaramos a constraint que queremos para a direita, **-20-**, por fim declaramos o nosso componente a esquerda que é **|** (nossa *superview* novamente).

Com um componente simples como esse a abordagem do Visual Format parece fácil, mas imagine que você vá montar uma tela com vários componentes, seriam muitas constraints para se declarar em uma *String* tornando a possibilidade de erros muito maior.

### Implementação em Visual Format

Neste bloco de código, temos o nosso layout implementado com Visual Format, é um tanto quanto complexo e bastante verboso a princípio, mas conforme evoluirmos para os outros métodos este talvez fique um pouco mais claro.

```swift
	[...]

	private func setupVisualFormatConstraints() {
		let viewsDict = [
				"label" = label,
				"button" = button
		]

		let verticalConstraints = NSLayoutConstraint.constraints(
				withVisualFormat: "V:|-40-[label]-20-[button]",
				options: [],
				metrics: nil,
				views: viewsDict
		)

		let labelHorizontalConstraints = NSLayoutConstraint.constraints(
				withVisualFormat: "H:|-20-[label]-20-|",
				options: [],
				metrics: nil,
				views: viewsDict
		)

		let buttonHorizontalConstraints = NSLayoutConstraint.constraints(
				withVisualFormat: "H:|-20-[button]-20-|",
				options: [],
				metrics: nil,
				views: viewsDict
		)

		NSLayoutConstraint.activate(verticalConstraint)
		NSLayoutConstraint.activate(labelHorizontalConstraints)
		NSLayoutConstraint.activate(buttonHorizontalConstraints)
	}
}
```

Caso você tenha se interessado pela ~~relíquia~~ forma como é implementado, você pode aprender mais nesse post do [Ray Wenderlich](https://www.raywenderlich.com/277-auto-layout-visual-format-language-tutorial).

## Layout Constraints

//TODO: Explicar Layout Constraints

### Implementação em Layout Constraints

```swift
	[...]
	
	private func setupLayoutConstraints() {
		let labelTopConstraint = NSLayoutConstraint(
			item: label,
			attribute: .top,
			relatedBy: .equal,
			toItem: view,
			attribute: .top,
			multiplier: 1,
			constant: 40
		)

		let labelLeadingConstraint = NSLayoutConstraint(
			item: label,
			attribute: .leading,
			relatedBy: .equal,
			toItem: view,
			attribute: .leading,
			multiplier: 1,
			constant: 20
		)

		let labelTrailingConstraint = NSLayoutConstraint(
			item: label,
			attribute: .trailing,
			relatedBy: .equal,
			toItem: view,
			attribute: .trailing,
			multiplier: 1,
			constant: -20
		)

		let buttonTopConstraint = NSLayoutConstraint(
			item: button,
			attribute: .top,
			relatedBy: .equal,
			toItem: label,
			attribute: .bottom,
			multiplier: 1,
			constant: 20
		)

		let buttonLeadingConstraint = NSLayoutConstraint(
			item: button,
			attribute: .leading,
			relatedBy: .equal,
			toItem: view,
			attribute: .leading,
			multiplier: 1,
			constant: 20
		)

		let buttonTrailingConstraint = NSLayoutConstraint(
			item: button,
			attribute: .trailing,
			relatedBy: .equal,
			toItem: view,
			attribute: .trailing,
			multiplier: 1,
			constant: -20
		)

		view.addConstraints([
			labelTopConstraint,
			labelLeadingConstraint,
			labelTrailingConstraint,
			buttonTopConstraint,
			buttonLeadingConstraint,
			buttonTrailingConstraint
		])
	}
}
```

## Layout Anchors

TODO: Explicar Layout Anchors.

### Implementação em Layout Anchors

```swift
[...]

	private lazy var label: UILabel = {
		let label = UILabel()
		label.text = "Exemplo de View Code"
		label.textAlignment = .center
		**label.translatesAutoresizingMaskIntoConstraints = false**
		return label
	}

	private lazy var button: UIButton = {
		let button = UIButton()
		button.setTitle("Botão que faz nada", for: .normal)
		button.backgroundColor = .systemYellow
		button.layer.cornerRadius = 15
		**button.translatesAutoresizingMaskIntoConstraints = false**
		return button
	}

	[...]

	private func setupLayoutAnchors() {
		label.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
		label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
		label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
	
		button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
		button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
		button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
	}
}
```

## SnapKit

//TODO: falar do snapkit

### Implementação em SnapKit

```swift
 [...]
	
	private func setupSnapKitConstraints() {
		label.snp.makeConstraints { make in
			make.top.left.equalToSuperview().offset(40)
			make.right.equalToSuperView().inset(20)
    }

		button.snp.makeConstraints { make in
			make.top.equalTo(label.snp.bottom).offset(20)
			make.left.equalToSuperView().offset(20)
			make.right.equalToSuperView().inset(20)
    }
	}
}
```
