public class AnimalLocator {
    public static String getAnimalNameById(Integer idAsParam) {
        String retVal = null;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+idAsParam);
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            Map<string, object> animals = (map<string, object>) results.get('animal');
            System.debug('Received the following animals:' + animals );
            retVal = string.valueof(animals.get('name'));
            System.debug('strResp >>>>>>' + retVal);
        }
        return retVal;
    }
}