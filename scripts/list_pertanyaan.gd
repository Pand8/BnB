extends Node

var ayam = load("res://Assets/animal sprites/ayam.png")
var bebek = load("res://Assets/animal sprites/BEBEK.png")
var sapi = load("res://Assets/animal sprites/sapi.png")
var domba = load("res://Assets/animal sprites/domba.png")
var ikan = load("res://Assets/animal sprites/ikan.png")
var kucing = load("res://Assets/animal sprites/meng.png")
var anjing = load("res://Assets/animal sprites/ANJING.png")
var singa = load("res://Assets/animal sprites/singa.png")
var katak = load("res://Assets/animal sprites/katak.png")
var semut = load("res://Assets/animal sprites/semut.png")



var pertanyaan_angka: Array = [
	{
		text= "[center]ADA BERAPA BUAH?[/center]",
		opsi1= "5",
		opsi2= "2",
		opsi3= "4",
		jawaban_benar= 2,
		num_object= 2,
		object_type= "apple"
	},
		{
		text= "[center]ADA BERAPA BUAH?[/center]",
		opsi1= "4",
		opsi2= "7",
		opsi3= "2",
		jawaban_benar= 1,
		num_object= 4,
		object_type= "banana"
	},
		{
		text= "[center]ADA BERAPA BUAH?[/center] ",
		opsi1= "3",
		opsi2= "2",
		opsi3= "1",
		jawaban_benar= 3,
		num_object= 1,
		object_type= "melon"
	}, 
		{
		text= "[center]ADA BERAPA BUAH?[/center]",
		opsi1= "6",
		opsi2= "1",
		opsi3= "5",
		jawaban_benar= 1,
		num_object= 6,
		object_type= ""
	},
		{
		text= "[center]ADA BERAPA BUAH?[/center]",
		opsi1= "2",
		opsi2= "3",
		opsi3= "7",
		jawaban_benar= 3,
		num_object= 7,
		object_type= "melon"
	},
		{
		text= "[center]ADA BERAPA BUAH?[/center]",
		opsi1= "8",
		opsi2= "1",
		opsi3= "4",
		jawaban_benar= 1,
		num_object= 8,
		object_type= "melon"
	},
		{
		text= "[center]ADA BERAPA BUAH?[/center]",
		opsi1= "1",
		opsi2= "3",
		opsi3= "2",
		jawaban_benar= 2,
		num_object= 3,
		object_type= "melon"
	},
		{
		text= "[center]ADA BERAPA BUAH?[/center]",
		opsi1= "5",
		opsi2= "7",
		opsi3= "2",
		jawaban_benar= 1,
		num_object= 5,
		object_type= "melon"
	},
		{
		text= "[center]ADA BERAPA BUAH?[/center]",
		opsi1= "9",
		opsi2= "4",
		opsi3= "1",
		jawaban_benar= 2,
		num_object= 4,
		object_type= "melon"
#	},
#		{
#		text= "[center]ADA BERAPA BUAH?[/center]",
#		opsi1= "1",
#		opsi2= "2",
#		opsi3= "10",
#		jawaban_benar= 3,
#		num_object= 10,
#		object_type= "melon"
	}
]

var pertanyaan_angka2: Array = [
	{
		text= "[center]ADA BERAPA BUAH?[/center]",
		opsi1= "5",
		opsi2= "2",
		opsi3= "4",
		jawaban_benar= 2,
		num_object1= 1,
		num_object2= 1,
		object_type= "apple"
	},
		{
		text= "[center]ADA BERAPA BUAH?[/center]",
		opsi1= "4",
		opsi2= "7",
		opsi3= "2",
		jawaban_benar= 1,
		num_object1= 1,
		num_object2= 3,
		object_type= "banana"
	},
		{
		text= "[center]ADA BERAPA BUAH?[/center] ",
		opsi1= "3",
		opsi2= "2",
		opsi3= "1",
		jawaban_benar= 1,
		num_object1= 2,
		num_object2= 1,
		object_type= "melon"
	}, 
		{
		text= "[center]ADA BERAPA BUAH?[/center]",
		opsi1= "6",
		opsi2= "1",
		opsi3= "5",
		jawaban_benar= 1,
		num_object1= 3,
		num_object2= 3,
		object_type= ""
	},
		{
		text= "[center]ADA BERAPA BUAH?[/center]",
		opsi1= "2",
		opsi2= "3",
		opsi3= "7",
		jawaban_benar= 3,
		num_object1= 4,
		num_object2= 3,
		object_type= "melon"
	},
		{
		text= "[center]ADA BERAPA BUAH?[/center]",
		opsi1= "8",
		opsi2= "1",
		opsi3= "4",
		jawaban_benar= 1,
		num_object1= 4,
		num_object2= 4,
		object_type= "melon"
	},
		{
		text= "[center]ADA BERAPA BUAH?[/center]",
		opsi1= "1",
		opsi2= "6",
		opsi3= "2",
		jawaban_benar= 2,
		num_object1= 4,
		num_object2= 2,
		object_type= "melon"
	},
		{
		text= "[center]ADA BERAPA BUAH?[/center]",
		opsi1= "5",
		opsi2= "7",
		opsi3= "2",
		jawaban_benar= 1,
		num_object1= 3,
		num_object2= 2,
		object_type= "melon"
	},
		{
		text= "[center]ADA BERAPA BUAH?[/center]",
		opsi1= "9",
		opsi2= "4",
		opsi3= "1",
		jawaban_benar= 1,
		num_object1= 6,
		num_object2= 3,
		object_type= "melon"
	},
		{
		text= "[center]ADA BERAPA BUAH?[/center]",
		opsi1= "1",
		opsi2= "2",
		opsi3= "10",
		jawaban_benar= 3,
		num_object1= 4,
		num_object2= 6,
		object_type= "melon"
	}
]

#list pertanyaan huruf
var pertanyaan_huruf: Array = [
	{
		text= "AY_M ",
		opsi1= "B",
		opsi2= "I",
		opsi3= "A",
		jawaban_benar= 3,
		texture= ayam
	},
		{
		text= "BE_EK",
		opsi1= "S",
		opsi2= "B",
		opsi3= "A",
		jawaban_benar= 2,
		texture= bebek
	},
		{
		text= "SA_I",
		opsi1= "P",
		opsi2= "S",
		opsi3= "A",
		jawaban_benar= 1,
		texture= sapi
	},
		{
		text= "I_AN",
		opsi1= "K",
		opsi2= "P",
		opsi3= "L",
		jawaban_benar= 1,
		texture= ikan
	},
		{
		text= "D_MBA",
		opsi1= "D",
		opsi2= "A",
		opsi3= "O",
		jawaban_benar= 3,
		texture= domba
	},
		{
		text= "KUCI_G",
		opsi1= "G",
		opsi2= "N",
		opsi3= "K",
		jawaban_benar= 2,
		texture= kucing
	},
		{
		text= "AN_ING",
		opsi1= "J",
		opsi2= "T",
		opsi3= "L",
		jawaban_benar= 1,
		texture= anjing
	},
		{
		text= "_INGA",
		opsi1= "Z",
		opsi2= "B",
		opsi3= "S",
		jawaban_benar= 3,
		texture= singa
	},
		{
		text= "KA_AK",
		opsi1= "A",
		opsi2= "T",
		opsi3= "L",
		jawaban_benar= 2,
		texture= katak
	},
		{
		text= "S_MUT",
		opsi1= "E",
		opsi2= "U",
		opsi3= "O",
		jawaban_benar= 1,
		texture= semut
	}
]

var pertanyaan_huruf2: Array = [
	{
		text1= "KUCING",
		text2= "MAKAN",
		text3= "????",
		
		opsi1= "RUMPUT",
		opsi2= "IKAN",
		opsi3= "KUCING",
		jawaban_benar= 2,
	},
		{
		text1= "REZA",
		text2= "????",
		text3= "BOLA",
		
		opsi1= "MAIN",
		opsi2= "TIDUR",
		opsi3= "PULANG",
		jawaban_benar= 1,
	},
#		{
#		text1= "IBU",
#		text2= "????",
#		text3= "LANTAI",
#
#		opsi1= "MEMBUAT",
#		opsi2= "AYAH",
#		opsi3= "MENYAPU",
#		jawaban_benar= 3,
#	},
		{
		text1= "????",
		text2= "MINUM",
		text3= "KOPI",
		
		opsi1= "AYAH",
		opsi2= "IKAN",
		opsi3= "APEL",
		jawaban_benar= 1,
	},
		{
		text1= "SAYA",
		text2= "MAKAN",
		text3= "????",
		
		opsi1= "RUMPUT",
		opsi2= "NASI",
		opsi3= "BOLA",
		jawaban_benar= 2,
	},
		{
		text1= "????",
		text2= "MAKAN",
		text3= "RUMPUT",
		
		opsi1= "AYAH",
		opsi2= "SINGA",
		opsi3= "SAPI",
		jawaban_benar= 3,
	},
		{
		text1= "IBU",
		text2= "????",
		text3= "ADIK",
		
		opsi1= "MAKAN",
		opsi2= "SAYANG",
		opsi3= "BENCI",
		jawaban_benar= 2,
	},
#		{
#		text1= "KAKEK",
#		text2= "????",
#		text3= "KORAN",
#
#		opsi1= "MENCUCI",
#		opsi2= "MAKAN",
#		opsi3= "MEMBACA",
#		jawaban_benar= 3,
#	},
		{
		text1= "BONEKA",
		text2= "AYU",
		text3= "????",
		
		opsi1= "TIDUR",
		opsi2= "LUCU",
		opsi3= "MALAM",
		jawaban_benar= 2,
	},
		{
		text1= "AYAH",
		text2= "SAYA",
		text3= "????",
		
		opsi1= "SATU",
		opsi2= "SAPI",
		opsi3= "DUA",
		jawaban_benar= 1,
	}
]
