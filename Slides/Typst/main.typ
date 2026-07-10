#import "@preview/touying:0.7.4": *
#import "unipd-slides.typ": *

#show: unipd-theme.with(
  aspect-ratio: "16-9",
  institution: "Università degli Studi di Padova",
  department: "Dipartimento di Matematica «Tullio Levi-Civita»",
  lang: "it",
  config-info(
    title: [Titolo della Presentazione],
    subtitle: [Un sottotitolo esplicativo],
    author: [Nome Cognome],
    date: datetime.today(),
  ),
)

#unipd-title-slide(
  title: [Titolo della Presentazione],
  subtitle: [Un sottotitolo esplicativo, se serve],
  authors: [Nome Cognome — Relatore: Prof. Nome Cognome],
  date: [10 luglio 2026],
  department: "Dipartimento di Matematica «Tullio Levi-Civita»",
  // logo-path: "images/unipd-logo.png", // decommentare quando disponibile
)

= Introduzione

== Indice

#outline(title: none, indent: 1em)

== Contesto e motivazioni

Il problema che affrontiamo nasce da tre osservazioni principali:

- Prima osservazione, con dettaglio a supporto
- Seconda osservazione #pause
- Terza osservazione, che emerge solo dopo le prime due

#pause

Questo apre naturalmente alla domanda di ricerca centrale del lavoro.

== Layout a due colonne

#slide(composer: (1fr, 1fr))[
  *Colonna sinistra*

  - Punto uno
  - Punto due
  - Punto tre
][
  *Colonna destra*

  #unipd-rule(width: 60%)

  Testo di supporto, immagine o diagramma possono andare qui.
]

= Metodo

== Frammento di codice

```python
def fibonacci(n: int) -> int:
    a, b = 0, 1
    for _ in range(n):
        a, b = b, a + b
    return a
```

== Tabella

#align(center, table(
  columns: 3,
  stroke: 0.5pt + unipd-colors.border,
  [*Metodo*], [*Accuratezza*], [*Tempo (s)*],
  [Baseline], [0.71], [12.4],
  [Proposto], [0.88], [9.1],
))

= Risultati

== Evidenze principali

#uncover("2-")[Il metodo proposto migliora l'accuratezza del *17%* rispetto alla baseline.]

#pause

#uncover("3-")[Il guadagno è più marcato nel regime a bassi dati (< 100 campioni).]

#unipd-focus-slide[
  Domande?
]

#unipd-closing-slide(
  title: [Grazie per l'attenzione],
  contact: [nome.cognome\@studenti.unipd.it],
)
