-- 1) Buscar nome e ano dos filmes
USE [Filmes]
SELECT [Nome], [Ano] FROM [Filmes];
GO

-- 2) Buscar nome, ano e duracao ordenados por ordem crescente pelo ano
SELECT [Nome], [Ano], [Duracao] FROM [Filmes] ORDER BY Ano;
GO

-- 3) Buscar pelo filme 'De volta para o futuro', trazendo o nome, ano e duracao
SELECT [Nome], [Ano], [Duracao] FROM [Filmes] WHERE [Nome] = 'De Volta para o Futuro';
GO

-- 4) Buscar pelos filmes lançados em 1997
SELECT [Nome], [Ano], [Duracao] FROM [Filmes] WHERE [Ano] = 1997;
GO

-- 5) Buscar os filmes lançados APÓS o ano 2000
SELECT [Nome], [Ano], [Duracao] FROM [Filmes] WHERE [Ano] > 2000;
GO

-- 6) Buscar os Filmes com duração maior que 100 e menor que 150, ordenando pela duração crescente
SELECT [Nome], [Ano], [Duracao] FROM [Filmes] WHERE [Duracao] > 100 AND [Duracao] < 150 ORDER BY [Duracao];
GO

-- 7) Buscar quantidade de filmes lançadas por ano ordenando pela QUANTIDADE decrescente (ENUNCIADO DO PROBLEMA ESTÁ ERRADO)
SELECT [Ano], COUNT([Duracao]) AS Quantidade FROM [Filmes] GROUP BY [Ano] ORDER BY Quantidade DESC;
GO

-- 8) Buscar os atores do gênero masculino, retornando o primeiro nome e último nome
SELECT [Id], [PrimeiroNome], [UltimoNome], [Genero] FROM [Atores] WHERE [Genero] = 'M';
GO

-- 9) Buscar os atores do gênero feminino, retornando o primeiro nome e último nome ordenado pelo primeiro nome
SELECT [Id], [PrimeiroNome], [UltimoNome], [Genero] FROM [Atores] WHERE [Genero] = 'F' ORDER BY [PrimeiroNome];
GO

-- 10) Buscar o nome do filme e o gênero
SELECT F.Nome, G.Genero
FROM Filmes AS F
INNER JOIN dbo.FilmesGenero FG on F.Id = FG.IdFilme
INNER JOIN dbo.Generos G on FG.IdGenero = G.Id
GO

-- 11) Buscar o nome do filme e o gênero "Mistério"
SELECT F.Nome, G.Genero
FROM Filmes AS F
INNER JOIN dbo.FilmesGenero FG on F.Id = FG.IdFilme
INNER JOIN dbo.Generos G on FG.IdGenero = G.Id
WHERE G.Genero = 'Mistério'
GO

-- 12) Buscar o nome do filme e os atores trazendo o primeiro nome, ultimo nome e seu papel
SELECT F.Nome, A.PrimeiroNome, A.UltimoNome, EF.Papel
FROM Filmes AS F
INNER JOIN dbo.ElencoFilme EF on F.Id = EF.IdFilme
INNER JOIN dbo.Atores A on EF.IdAtor = A.Id
GO