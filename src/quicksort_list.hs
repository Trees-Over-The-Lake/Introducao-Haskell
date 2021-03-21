-- Usando list comprehension
quickSort []     = []                               -- Criando uma lista vazia
quickSort (x:xs) = quickSort [a | a <- xs, a < x]   -- Ordenando a primeira metade da esquerda
                   ++ [x] ++                        -- Inserindo o pivo entre as duas partes da lista
                   quickSort [a | a <- xs, a >= x]  -- Ordenando a segunda metade da lista

