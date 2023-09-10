$ mkdir purs-project && cd purs-project
$ pulp init
$ cat > index.html
<head><script src="app.js"></script></head>
^C
$ pulp server

render :: T.Render _ {} _ {}
render _ _ _ _ = R.div' [ R.h1' [ R.text "Hello world!" ] ]

spec :: T.Spec _ {} _ {}
spec = T.simpleSpec {} perfAction render

perfAction :: T.PerformAction _ {} _ {}
perfAction _ _ = T.modifyState (const {})

main :: forall eff. Eff (dom :: DOM.DOM | eff) R.ReactElement
main = body >>= R.render (R.createFactory (T.createClass spec) {})
    where
        body = do
            win <- DOM.window 
            doc <- DOM.document win
            elm <- fromJust <$> toMaybe <$> DOM.body doc
            return $ DOM.htmlElementToElement elm

            
