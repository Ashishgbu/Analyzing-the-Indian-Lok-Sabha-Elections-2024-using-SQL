-- create elections database 
CREATE DATABASE elections;

-- use election database
USE elections;

-- 1. What is the total number of Lok Sabha seats?
SELECT COUNT(DISTINCT Parliament_Constituency) AS Total_Seats
FROM constituencywise_results;

-- 2. What is the total number of seats available for elections in each state?
SELECT s.State AS State_Name,COUNT(cr.Constituency_ID) AS Total_Seats_Available
FROM constituencywise_results cr
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
GROUP BY s.State
ORDER BY s.State;

-- 3. Total Number of Seats Secured by NDA Alliance
SELECT SUM(CASE 
		WHEN party IN (
            'Bharatiya Janata Party - BJP', 
            'Telugu Desam - TDP',
            'Janata Dal  (United) - JD(U)',
            'Shiv Sena - SHS', 
            'AJSU Party - AJSUP',
            'Apna Dal (Soneylal) - ADAL',
            'Asom Gana Parishad - AGP',
            'Hindustani Awam Morcha (Secular) - HAMS',
            'Janasena Party - JnP',
            'Janata Dal  (Secular) - JD(S)',
            'Lok Janshakti Party(Ram Vilas) - LJPRV',
            'Nationalist Congress Party - NCP',
            'Rashtriya Lok Dal - RLD',
            'Sikkim Krantikari Morcha - SKM'
        ) THEN won
        ELSE 0 
    END) AS NDA_Total_Seats_Won
FROM partywise_results;

-- 4. Identify the parties within the NDA alliance and specify the number of seats each party secured in the 2024 elections.
SELECT party as Party_Name,won as Seats_Won
FROM partywise_results
WHERE party IN (
        'Bharatiya Janata Party - BJP', 
        'Telugu Desam - TDP', 
		'Janata Dal  (United) - JD(U)',
        'Shiv Sena - SHS', 
        'AJSU Party - AJSUP', 
        'Apna Dal (Soneylal) - ADAL', 
        'Asom Gana Parishad - AGP',
        'Hindustani Awam Morcha (Secular) - HAMS', 
        'Janasena Party - JnP', 
		'Janata Dal  (Secular) - JD(S)',
        'Lok Janshakti Party(Ram Vilas) - LJPRV', 
        'Nationalist Congress Party - NCP',
        'Rashtriya Lok Dal - RLD', 
        'Sikkim Krantikari Morcha - SKM'
    )
ORDER BY Seats_Won DESC;


-- 5. Identify the parties within the I.N.D.I.A. alliance and specify the number of seats each party secured in the 2024 elections.
SELECT party as Party_Name,won as Seats_Won
FROM partywise_results
WHERE party IN (
        'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
    )
ORDER BY Seats_Won DESC;

-- 6. Find the total number of seats won by the I.N.D.I.A. Alliance.
SELECT SUM(CASE 
            WHEN party IN (
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
            ) THEN Won
            ELSE 0 
        END) AS INDIA_Total_Seats_Won
FROM 
    partywise_results;
    
-- 7. Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER

ALTER TABLE partywise_results
ADD party_alliance VARCHAR(250);
-- I.N.D.I.A Alliance
UPDATE partywise_results
SET party_alliance = 'I.N.D.I.A'
WHERE party IN (
    'Indian National Congress - INC',
    'Aam Aadmi Party - AAAP',
    'All India Trinamool Congress - AITC',
    'Bharat Adivasi Party - BHRTADVSIP',
    'Communist Party of India  (Marxist) - CPI(M)',
    'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
    'Communist Party of India - CPI',
    'Dravida Munnetra Kazhagam - DMK',	
    'Indian Union Muslim League - IUML',
    'Jammu & Kashmir National Conference - JKN',
    'Jharkhand Mukti Morcha - JMM',
    'Kerala Congress - KEC',
    'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
    'Rashtriya Janata Dal - RJD',
    'Rashtriya Loktantrik Party - RLTP',
    'Revolutionary Socialist Party - RSP',
    'Samajwadi Party - SP',
    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
    'Viduthalai Chiruthaigal Katchi - VCK');
-- NDA Alliance
UPDATE partywise_results
SET party_alliance = 'NDA'
WHERE party IN (
    'Bharatiya Janata Party - BJP',
    'Telugu Desam - TDP',
    'Janata Dal  (United) - JD(U)',
    'Shiv Sena - SHS',
    'AJSU Party - AJSUP',
    'Apna Dal (Soneylal) - ADAL',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janasena Party - JnP',
    'Janata Dal  (Secular) - JD(S)',
    'Lok Janshakti Party(Ram Vilas) - LJPRV',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM');
-- OTHER
UPDATE partywise_results
SET party_alliance = 'OTHER'
WHERE party_alliance IS NULL;

-- 8. What are the total seats won by the NDA, I.N.D.I.A, and OTHER party alliances?
SELECT p.party_alliance,COUNT(cr.Constituency_ID) AS Seats_Won
FROM constituencywise_results cr
JOIN partywise_results p ON cr.Party_ID = p.Party_ID
WHERE p.party_alliance IN ('NDA', 'I.N.D.I.A', 'OTHER')
GROUP BY p.party_alliance
ORDER BY Seats_Won DESC;

-- 9. Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency?
SELECT cr.Winning_Candidate, p.Party, p.party_alliance, cr.Total_Votes, cr.Margin, cr.Constituency_Name, s.State
FROM constituencywise_results cr
JOIN partywise_results p ON cr.Party_ID = p.Party_ID
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency  
JOIN states s ON sr.State_ID = s.State_ID
WHERE cr.Constituency_Name = 'AMETHI';

-- 10. What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?
SELECT cd.Candidate,cd.Party,cd.EVM_Votes,cd.Postal_Votes,cd.Total_Votes,cr.Constituency_Name
FROM constituencywise_details cd
JOIN constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
WHERE cr.Constituency_Name = 'MATHURA'
ORDER BY cd.Total_Votes DESC;

-- 11. Which parties won the most seats in a State, and how many seats did each party win?
SELECT p.Party,COUNT(cr.Constituency_ID) AS Seats_Won
FROM constituencywise_results cr
JOIN partywise_results p ON cr.Party_ID = p.Party_ID
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
WHERE s.state = 'Uttar Pradesh'
GROUP BY p.Party
ORDER BY Seats_Won DESC;

-- 12. What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024
SELECT 
    s.State AS State_Name,
    SUM(CASE WHEN p.party_alliance = 'NDA' THEN 1 ELSE 0 END) AS NDA_Seats_Won,
    SUM(CASE WHEN p.party_alliance = 'I.N.D.I.A' THEN 1 ELSE 0 END) AS INDIA_Seats_Won,
	SUM(CASE WHEN p.party_alliance = 'OTHER' THEN 1 ELSE 0 END) AS OTHER_Seats_Won
FROM constituencywise_results cr
JOIN partywise_results p ON cr.Party_ID = p.Party_ID
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
WHERE p.party_alliance IN ('NDA', 'I.N.D.I.A',  'OTHER')  -- Filter for NDA and INDIA alliances
GROUP BY s.State
ORDER BY s.State;

-- 13. Which candidate received the highest number of EVM votes in each constituency (Top 10)?
SELECT cr.Constituency_Name,cd.Constituency_ID,cd.Candidate,cd.EVM_Votes
FROM constituencywise_details cd
JOIN constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
WHERE cd.EVM_Votes = (
        SELECT MAX(cd1.EVM_Votes)
        FROM constituencywise_details cd1
        WHERE cd1.Constituency_ID = cd.Constituency_ID
    )
ORDER BY cd.EVM_Votes DESC LIMIT 10;










