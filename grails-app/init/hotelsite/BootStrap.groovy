package hotelsite

class BootStrap {

    HotelsService hotelsService;
    CountriesService countriesService;
    def init = { servletContext ->
        Countries countryRussia = countriesService.save('Россия', 'Москва')
        Countries countryBritain = countriesService.save('Великобритания', 'Лондон')
        Countries countryIreland = countriesService.save('Ирландия', 'Дублин')
        Countries countryGermany = countriesService.save('Германия', 'Берлин')
        Countries countryNetherlands = countriesService.save('Нидерланды', 'Амстердам')
        Countries countryBelgium = countriesService.save('Бельгия', 'Брюссель')
        Countries countryLuxembourg = countriesService.save('Люксембург', 'Люксембург')
        Countries countryFrance = countriesService.save('Франция', 'Париж')
        Countries countryMonaco = countriesService.save('Монако', 'Монако')
        Countries countryAustria = countriesService.save('Австрия', 'Вена')
        Countries countrySwitzerland = countriesService.save('Швейцария', 'Берн')
        hotelsService.save('Россия', countryRussia, 5, 'https://rossiya-hotel.ru/')
        hotelsService.save('Золотая Гавань', countryRussia, 4, null)
        hotelsService.save('Городские Облака', countryRussia, 3, null)
        hotelsService.save('Светлые Сны', countryBritain, 2, 'https://rossiya-hotel.ru/')
        hotelsService.save('Лунный Приют', countryBritain, 1, 'https://rossiya-hotel.ru/')
        hotelsService.save('Звёздный Портал', countryGermany, 2, 'https://rossiya-hotel.ru/')
        hotelsService.save('Королевская Гавань', countryNetherlands, 2, null)
        hotelsService.save('Серебряный Ключ', countryBelgium, 3, 'https://rossiya-hotel.ru/')
        hotelsService.save('Тайный Уголок', countryLuxembourg, 4, 'https://rossiya-hotel.ru/')
        hotelsService.save('Сон на Рассвете', countryFrance, 4, null)
        hotelsService.save('Вечерний Замок', countryMonaco, 5, null)
        hotelsService.save('Шепот Рассвета', countryAustria, 5, 'https://rossiya-hotel.ru/')
    }
    def destroy = {
    }
}
