import Foundation

public enum RemoteAPIError: Error {
    case remoteError
}

public class BulletinRemoteAPI {

    public init() {
    }
    
    public func data(for path: String) async throws -> Data {
        guard let url = URL(string: "https://uyhlxbgjwqazkhajcecy.supabase.co/rest/v1/\(path)") else {
            throw RemoteAPIError.remoteError
        }

        let apiKey = ""

        var request = URLRequest(url: url)
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue(apiKey, forHTTPHeaderField: "apikey")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw RemoteAPIError.remoteError
        }
        return data
    }
    
}
