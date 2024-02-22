

import '../network/api_provider.dart';
import '../network_response.dart';

class AgentRepository {
  Future<NetworkResponse> getAgents() async =>
      await ApiProvider.fetchAgents();
}