library googleapis.compute.v1.test;

import "dart:core" as core;
import "dart:collection" as collection;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:http/testing.dart' as http_testing;
import 'package:unittest/unittest.dart' as unittest;

import 'package:googleapis/compute/v1.dart' as api;

class HttpServerMock extends http.BaseClient {
  core.Function _callback;
  core.bool _expectJson;

  void register(core.Function callback, core.bool expectJson) {
    _callback = callback;
    _expectJson = expectJson;
  }

  async.Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (_expectJson) {
      return request.finalize()
          .transform(convert.UTF8.decoder)
          .join('')
          .then((core.String jsonString) {
        if (jsonString.isEmpty) {
          return _callback(request, null);
        } else {
          return _callback(request, convert.JSON.decode(jsonString));
        }
      });
    } else {
      var stream = request.finalize();
      if (stream == null) {
        return _callback(request, []);
      } else {
        return stream.toBytes().then((data) {
          return _callback(request, data);
        });
      }
    }
  }
}

http.StreamedResponse stringResponse(
    core.int status, core.Map headers, core.String body) {
  var stream = new async.Stream.fromIterable([convert.UTF8.encode(body)]);
  return new http.StreamedResponse(stream, status, headers: headers);
}

core.int buildCounterAccessConfig = 0;
buildAccessConfig() {
  var o = new api.AccessConfig();
  buildCounterAccessConfig++;
  if (buildCounterAccessConfig < 3) {
    o.kind = "foo";
    o.name = "foo";
    o.natIP = "foo";
    o.type = "foo";
  }
  buildCounterAccessConfig--;
  return o;
}

checkAccessConfig(api.AccessConfig o) {
  buildCounterAccessConfig++;
  if (buildCounterAccessConfig < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.natIP, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterAccessConfig--;
}

buildUnnamed2425() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2425(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterAddress = 0;
buildAddress() {
  var o = new api.Address();
  buildCounterAddress++;
  if (buildCounterAddress < 3) {
    o.address = "foo";
    o.creationTimestamp = "foo";
    o.description = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.region = "foo";
    o.selfLink = "foo";
    o.status = "foo";
    o.users = buildUnnamed2425();
  }
  buildCounterAddress--;
  return o;
}

checkAddress(api.Address o) {
  buildCounterAddress++;
  if (buildCounterAddress < 3) {
    unittest.expect(o.address, unittest.equals('foo'));
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.region, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
    unittest.expect(o.status, unittest.equals('foo'));
    checkUnnamed2425(o.users);
  }
  buildCounterAddress--;
}

buildUnnamed2426() {
  var o = new core.Map<core.String, api.AddressesScopedList>();
  o["x"] = buildAddressesScopedList();
  o["y"] = buildAddressesScopedList();
  return o;
}

checkUnnamed2426(core.Map<core.String, api.AddressesScopedList> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAddressesScopedList(o["x"]);
  checkAddressesScopedList(o["y"]);
}

core.int buildCounterAddressAggregatedList = 0;
buildAddressAggregatedList() {
  var o = new api.AddressAggregatedList();
  buildCounterAddressAggregatedList++;
  if (buildCounterAddressAggregatedList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2426();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterAddressAggregatedList--;
  return o;
}

checkAddressAggregatedList(api.AddressAggregatedList o) {
  buildCounterAddressAggregatedList++;
  if (buildCounterAddressAggregatedList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2426(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterAddressAggregatedList--;
}

buildUnnamed2427() {
  var o = new core.List<api.Address>();
  o.add(buildAddress());
  o.add(buildAddress());
  return o;
}

checkUnnamed2427(core.List<api.Address> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAddress(o[0]);
  checkAddress(o[1]);
}

core.int buildCounterAddressList = 0;
buildAddressList() {
  var o = new api.AddressList();
  buildCounterAddressList++;
  if (buildCounterAddressList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2427();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterAddressList--;
  return o;
}

checkAddressList(api.AddressList o) {
  buildCounterAddressList++;
  if (buildCounterAddressList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2427(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterAddressList--;
}

buildUnnamed2428() {
  var o = new core.List<api.Address>();
  o.add(buildAddress());
  o.add(buildAddress());
  return o;
}

checkUnnamed2428(core.List<api.Address> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAddress(o[0]);
  checkAddress(o[1]);
}

core.int buildCounterAddressesScopedListWarningData = 0;
buildAddressesScopedListWarningData() {
  var o = new api.AddressesScopedListWarningData();
  buildCounterAddressesScopedListWarningData++;
  if (buildCounterAddressesScopedListWarningData < 3) {
    o.key = "foo";
    o.value = "foo";
  }
  buildCounterAddressesScopedListWarningData--;
  return o;
}

checkAddressesScopedListWarningData(api.AddressesScopedListWarningData o) {
  buildCounterAddressesScopedListWarningData++;
  if (buildCounterAddressesScopedListWarningData < 3) {
    unittest.expect(o.key, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterAddressesScopedListWarningData--;
}

buildUnnamed2429() {
  var o = new core.List<api.AddressesScopedListWarningData>();
  o.add(buildAddressesScopedListWarningData());
  o.add(buildAddressesScopedListWarningData());
  return o;
}

checkUnnamed2429(core.List<api.AddressesScopedListWarningData> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAddressesScopedListWarningData(o[0]);
  checkAddressesScopedListWarningData(o[1]);
}

core.int buildCounterAddressesScopedListWarning = 0;
buildAddressesScopedListWarning() {
  var o = new api.AddressesScopedListWarning();
  buildCounterAddressesScopedListWarning++;
  if (buildCounterAddressesScopedListWarning < 3) {
    o.code = "foo";
    o.data = buildUnnamed2429();
    o.message = "foo";
  }
  buildCounterAddressesScopedListWarning--;
  return o;
}

checkAddressesScopedListWarning(api.AddressesScopedListWarning o) {
  buildCounterAddressesScopedListWarning++;
  if (buildCounterAddressesScopedListWarning < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    checkUnnamed2429(o.data);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterAddressesScopedListWarning--;
}

core.int buildCounterAddressesScopedList = 0;
buildAddressesScopedList() {
  var o = new api.AddressesScopedList();
  buildCounterAddressesScopedList++;
  if (buildCounterAddressesScopedList < 3) {
    o.addresses = buildUnnamed2428();
    o.warning = buildAddressesScopedListWarning();
  }
  buildCounterAddressesScopedList--;
  return o;
}

checkAddressesScopedList(api.AddressesScopedList o) {
  buildCounterAddressesScopedList++;
  if (buildCounterAddressesScopedList < 3) {
    checkUnnamed2428(o.addresses);
    checkAddressesScopedListWarning(o.warning);
  }
  buildCounterAddressesScopedList--;
}

buildUnnamed2430() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2430(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterAttachedDisk = 0;
buildAttachedDisk() {
  var o = new api.AttachedDisk();
  buildCounterAttachedDisk++;
  if (buildCounterAttachedDisk < 3) {
    o.autoDelete = true;
    o.boot = true;
    o.deviceName = "foo";
    o.diskEncryptionKey = buildCustomerEncryptionKey();
    o.index = 42;
    o.initializeParams = buildAttachedDiskInitializeParams();
    o.interface = "foo";
    o.kind = "foo";
    o.licenses = buildUnnamed2430();
    o.mode = "foo";
    o.source = "foo";
    o.type = "foo";
  }
  buildCounterAttachedDisk--;
  return o;
}

checkAttachedDisk(api.AttachedDisk o) {
  buildCounterAttachedDisk++;
  if (buildCounterAttachedDisk < 3) {
    unittest.expect(o.autoDelete, unittest.isTrue);
    unittest.expect(o.boot, unittest.isTrue);
    unittest.expect(o.deviceName, unittest.equals('foo'));
    checkCustomerEncryptionKey(o.diskEncryptionKey);
    unittest.expect(o.index, unittest.equals(42));
    checkAttachedDiskInitializeParams(o.initializeParams);
    unittest.expect(o.interface, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed2430(o.licenses);
    unittest.expect(o.mode, unittest.equals('foo'));
    unittest.expect(o.source, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
  }
  buildCounterAttachedDisk--;
}

core.int buildCounterAttachedDiskInitializeParams = 0;
buildAttachedDiskInitializeParams() {
  var o = new api.AttachedDiskInitializeParams();
  buildCounterAttachedDiskInitializeParams++;
  if (buildCounterAttachedDiskInitializeParams < 3) {
    o.diskName = "foo";
    o.diskSizeGb = "foo";
    o.diskType = "foo";
    o.sourceImage = "foo";
    o.sourceImageEncryptionKey = buildCustomerEncryptionKey();
  }
  buildCounterAttachedDiskInitializeParams--;
  return o;
}

checkAttachedDiskInitializeParams(api.AttachedDiskInitializeParams o) {
  buildCounterAttachedDiskInitializeParams++;
  if (buildCounterAttachedDiskInitializeParams < 3) {
    unittest.expect(o.diskName, unittest.equals('foo'));
    unittest.expect(o.diskSizeGb, unittest.equals('foo'));
    unittest.expect(o.diskType, unittest.equals('foo'));
    unittest.expect(o.sourceImage, unittest.equals('foo'));
    checkCustomerEncryptionKey(o.sourceImageEncryptionKey);
  }
  buildCounterAttachedDiskInitializeParams--;
}

core.int buildCounterAutoscaler = 0;
buildAutoscaler() {
  var o = new api.Autoscaler();
  buildCounterAutoscaler++;
  if (buildCounterAutoscaler < 3) {
    o.autoscalingPolicy = buildAutoscalingPolicy();
    o.creationTimestamp = "foo";
    o.description = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.selfLink = "foo";
    o.target = "foo";
    o.zone = "foo";
  }
  buildCounterAutoscaler--;
  return o;
}

checkAutoscaler(api.Autoscaler o) {
  buildCounterAutoscaler++;
  if (buildCounterAutoscaler < 3) {
    checkAutoscalingPolicy(o.autoscalingPolicy);
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
    unittest.expect(o.target, unittest.equals('foo'));
    unittest.expect(o.zone, unittest.equals('foo'));
  }
  buildCounterAutoscaler--;
}

buildUnnamed2431() {
  var o = new core.Map<core.String, api.AutoscalersScopedList>();
  o["x"] = buildAutoscalersScopedList();
  o["y"] = buildAutoscalersScopedList();
  return o;
}

checkUnnamed2431(core.Map<core.String, api.AutoscalersScopedList> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAutoscalersScopedList(o["x"]);
  checkAutoscalersScopedList(o["y"]);
}

core.int buildCounterAutoscalerAggregatedList = 0;
buildAutoscalerAggregatedList() {
  var o = new api.AutoscalerAggregatedList();
  buildCounterAutoscalerAggregatedList++;
  if (buildCounterAutoscalerAggregatedList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2431();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterAutoscalerAggregatedList--;
  return o;
}

checkAutoscalerAggregatedList(api.AutoscalerAggregatedList o) {
  buildCounterAutoscalerAggregatedList++;
  if (buildCounterAutoscalerAggregatedList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2431(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterAutoscalerAggregatedList--;
}

buildUnnamed2432() {
  var o = new core.List<api.Autoscaler>();
  o.add(buildAutoscaler());
  o.add(buildAutoscaler());
  return o;
}

checkUnnamed2432(core.List<api.Autoscaler> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAutoscaler(o[0]);
  checkAutoscaler(o[1]);
}

core.int buildCounterAutoscalerList = 0;
buildAutoscalerList() {
  var o = new api.AutoscalerList();
  buildCounterAutoscalerList++;
  if (buildCounterAutoscalerList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2432();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterAutoscalerList--;
  return o;
}

checkAutoscalerList(api.AutoscalerList o) {
  buildCounterAutoscalerList++;
  if (buildCounterAutoscalerList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2432(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterAutoscalerList--;
}

buildUnnamed2433() {
  var o = new core.List<api.Autoscaler>();
  o.add(buildAutoscaler());
  o.add(buildAutoscaler());
  return o;
}

checkUnnamed2433(core.List<api.Autoscaler> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAutoscaler(o[0]);
  checkAutoscaler(o[1]);
}

core.int buildCounterAutoscalersScopedListWarningData = 0;
buildAutoscalersScopedListWarningData() {
  var o = new api.AutoscalersScopedListWarningData();
  buildCounterAutoscalersScopedListWarningData++;
  if (buildCounterAutoscalersScopedListWarningData < 3) {
    o.key = "foo";
    o.value = "foo";
  }
  buildCounterAutoscalersScopedListWarningData--;
  return o;
}

checkAutoscalersScopedListWarningData(api.AutoscalersScopedListWarningData o) {
  buildCounterAutoscalersScopedListWarningData++;
  if (buildCounterAutoscalersScopedListWarningData < 3) {
    unittest.expect(o.key, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterAutoscalersScopedListWarningData--;
}

buildUnnamed2434() {
  var o = new core.List<api.AutoscalersScopedListWarningData>();
  o.add(buildAutoscalersScopedListWarningData());
  o.add(buildAutoscalersScopedListWarningData());
  return o;
}

checkUnnamed2434(core.List<api.AutoscalersScopedListWarningData> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAutoscalersScopedListWarningData(o[0]);
  checkAutoscalersScopedListWarningData(o[1]);
}

core.int buildCounterAutoscalersScopedListWarning = 0;
buildAutoscalersScopedListWarning() {
  var o = new api.AutoscalersScopedListWarning();
  buildCounterAutoscalersScopedListWarning++;
  if (buildCounterAutoscalersScopedListWarning < 3) {
    o.code = "foo";
    o.data = buildUnnamed2434();
    o.message = "foo";
  }
  buildCounterAutoscalersScopedListWarning--;
  return o;
}

checkAutoscalersScopedListWarning(api.AutoscalersScopedListWarning o) {
  buildCounterAutoscalersScopedListWarning++;
  if (buildCounterAutoscalersScopedListWarning < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    checkUnnamed2434(o.data);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterAutoscalersScopedListWarning--;
}

core.int buildCounterAutoscalersScopedList = 0;
buildAutoscalersScopedList() {
  var o = new api.AutoscalersScopedList();
  buildCounterAutoscalersScopedList++;
  if (buildCounterAutoscalersScopedList < 3) {
    o.autoscalers = buildUnnamed2433();
    o.warning = buildAutoscalersScopedListWarning();
  }
  buildCounterAutoscalersScopedList--;
  return o;
}

checkAutoscalersScopedList(api.AutoscalersScopedList o) {
  buildCounterAutoscalersScopedList++;
  if (buildCounterAutoscalersScopedList < 3) {
    checkUnnamed2433(o.autoscalers);
    checkAutoscalersScopedListWarning(o.warning);
  }
  buildCounterAutoscalersScopedList--;
}

buildUnnamed2435() {
  var o = new core.List<api.AutoscalingPolicyCustomMetricUtilization>();
  o.add(buildAutoscalingPolicyCustomMetricUtilization());
  o.add(buildAutoscalingPolicyCustomMetricUtilization());
  return o;
}

checkUnnamed2435(core.List<api.AutoscalingPolicyCustomMetricUtilization> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAutoscalingPolicyCustomMetricUtilization(o[0]);
  checkAutoscalingPolicyCustomMetricUtilization(o[1]);
}

core.int buildCounterAutoscalingPolicy = 0;
buildAutoscalingPolicy() {
  var o = new api.AutoscalingPolicy();
  buildCounterAutoscalingPolicy++;
  if (buildCounterAutoscalingPolicy < 3) {
    o.coolDownPeriodSec = 42;
    o.cpuUtilization = buildAutoscalingPolicyCpuUtilization();
    o.customMetricUtilizations = buildUnnamed2435();
    o.loadBalancingUtilization = buildAutoscalingPolicyLoadBalancingUtilization();
    o.maxNumReplicas = 42;
    o.minNumReplicas = 42;
  }
  buildCounterAutoscalingPolicy--;
  return o;
}

checkAutoscalingPolicy(api.AutoscalingPolicy o) {
  buildCounterAutoscalingPolicy++;
  if (buildCounterAutoscalingPolicy < 3) {
    unittest.expect(o.coolDownPeriodSec, unittest.equals(42));
    checkAutoscalingPolicyCpuUtilization(o.cpuUtilization);
    checkUnnamed2435(o.customMetricUtilizations);
    checkAutoscalingPolicyLoadBalancingUtilization(o.loadBalancingUtilization);
    unittest.expect(o.maxNumReplicas, unittest.equals(42));
    unittest.expect(o.minNumReplicas, unittest.equals(42));
  }
  buildCounterAutoscalingPolicy--;
}

core.int buildCounterAutoscalingPolicyCpuUtilization = 0;
buildAutoscalingPolicyCpuUtilization() {
  var o = new api.AutoscalingPolicyCpuUtilization();
  buildCounterAutoscalingPolicyCpuUtilization++;
  if (buildCounterAutoscalingPolicyCpuUtilization < 3) {
    o.utilizationTarget = 42.0;
  }
  buildCounterAutoscalingPolicyCpuUtilization--;
  return o;
}

checkAutoscalingPolicyCpuUtilization(api.AutoscalingPolicyCpuUtilization o) {
  buildCounterAutoscalingPolicyCpuUtilization++;
  if (buildCounterAutoscalingPolicyCpuUtilization < 3) {
    unittest.expect(o.utilizationTarget, unittest.equals(42.0));
  }
  buildCounterAutoscalingPolicyCpuUtilization--;
}

core.int buildCounterAutoscalingPolicyCustomMetricUtilization = 0;
buildAutoscalingPolicyCustomMetricUtilization() {
  var o = new api.AutoscalingPolicyCustomMetricUtilization();
  buildCounterAutoscalingPolicyCustomMetricUtilization++;
  if (buildCounterAutoscalingPolicyCustomMetricUtilization < 3) {
    o.metric = "foo";
    o.utilizationTarget = 42.0;
    o.utilizationTargetType = "foo";
  }
  buildCounterAutoscalingPolicyCustomMetricUtilization--;
  return o;
}

checkAutoscalingPolicyCustomMetricUtilization(api.AutoscalingPolicyCustomMetricUtilization o) {
  buildCounterAutoscalingPolicyCustomMetricUtilization++;
  if (buildCounterAutoscalingPolicyCustomMetricUtilization < 3) {
    unittest.expect(o.metric, unittest.equals('foo'));
    unittest.expect(o.utilizationTarget, unittest.equals(42.0));
    unittest.expect(o.utilizationTargetType, unittest.equals('foo'));
  }
  buildCounterAutoscalingPolicyCustomMetricUtilization--;
}

core.int buildCounterAutoscalingPolicyLoadBalancingUtilization = 0;
buildAutoscalingPolicyLoadBalancingUtilization() {
  var o = new api.AutoscalingPolicyLoadBalancingUtilization();
  buildCounterAutoscalingPolicyLoadBalancingUtilization++;
  if (buildCounterAutoscalingPolicyLoadBalancingUtilization < 3) {
    o.utilizationTarget = 42.0;
  }
  buildCounterAutoscalingPolicyLoadBalancingUtilization--;
  return o;
}

checkAutoscalingPolicyLoadBalancingUtilization(api.AutoscalingPolicyLoadBalancingUtilization o) {
  buildCounterAutoscalingPolicyLoadBalancingUtilization++;
  if (buildCounterAutoscalingPolicyLoadBalancingUtilization < 3) {
    unittest.expect(o.utilizationTarget, unittest.equals(42.0));
  }
  buildCounterAutoscalingPolicyLoadBalancingUtilization--;
}

core.int buildCounterBackend = 0;
buildBackend() {
  var o = new api.Backend();
  buildCounterBackend++;
  if (buildCounterBackend < 3) {
    o.balancingMode = "foo";
    o.capacityScaler = 42.0;
    o.description = "foo";
    o.group = "foo";
    o.maxRate = 42;
    o.maxRatePerInstance = 42.0;
    o.maxUtilization = 42.0;
  }
  buildCounterBackend--;
  return o;
}

checkBackend(api.Backend o) {
  buildCounterBackend++;
  if (buildCounterBackend < 3) {
    unittest.expect(o.balancingMode, unittest.equals('foo'));
    unittest.expect(o.capacityScaler, unittest.equals(42.0));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.group, unittest.equals('foo'));
    unittest.expect(o.maxRate, unittest.equals(42));
    unittest.expect(o.maxRatePerInstance, unittest.equals(42.0));
    unittest.expect(o.maxUtilization, unittest.equals(42.0));
  }
  buildCounterBackend--;
}

buildUnnamed2436() {
  var o = new core.List<api.Backend>();
  o.add(buildBackend());
  o.add(buildBackend());
  return o;
}

checkUnnamed2436(core.List<api.Backend> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkBackend(o[0]);
  checkBackend(o[1]);
}

buildUnnamed2437() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2437(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterBackendService = 0;
buildBackendService() {
  var o = new api.BackendService();
  buildCounterBackendService++;
  if (buildCounterBackendService < 3) {
    o.affinityCookieTtlSec = 42;
    o.backends = buildUnnamed2436();
    o.creationTimestamp = "foo";
    o.description = "foo";
    o.enableCDN = true;
    o.fingerprint = "foo";
    o.healthChecks = buildUnnamed2437();
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.port = 42;
    o.portName = "foo";
    o.protocol = "foo";
    o.region = "foo";
    o.selfLink = "foo";
    o.sessionAffinity = "foo";
    o.timeoutSec = 42;
  }
  buildCounterBackendService--;
  return o;
}

checkBackendService(api.BackendService o) {
  buildCounterBackendService++;
  if (buildCounterBackendService < 3) {
    unittest.expect(o.affinityCookieTtlSec, unittest.equals(42));
    checkUnnamed2436(o.backends);
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.enableCDN, unittest.isTrue);
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    checkUnnamed2437(o.healthChecks);
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.port, unittest.equals(42));
    unittest.expect(o.portName, unittest.equals('foo'));
    unittest.expect(o.protocol, unittest.equals('foo'));
    unittest.expect(o.region, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
    unittest.expect(o.sessionAffinity, unittest.equals('foo'));
    unittest.expect(o.timeoutSec, unittest.equals(42));
  }
  buildCounterBackendService--;
}

buildUnnamed2438() {
  var o = new core.List<api.HealthStatus>();
  o.add(buildHealthStatus());
  o.add(buildHealthStatus());
  return o;
}

checkUnnamed2438(core.List<api.HealthStatus> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkHealthStatus(o[0]);
  checkHealthStatus(o[1]);
}

core.int buildCounterBackendServiceGroupHealth = 0;
buildBackendServiceGroupHealth() {
  var o = new api.BackendServiceGroupHealth();
  buildCounterBackendServiceGroupHealth++;
  if (buildCounterBackendServiceGroupHealth < 3) {
    o.healthStatus = buildUnnamed2438();
    o.kind = "foo";
  }
  buildCounterBackendServiceGroupHealth--;
  return o;
}

checkBackendServiceGroupHealth(api.BackendServiceGroupHealth o) {
  buildCounterBackendServiceGroupHealth++;
  if (buildCounterBackendServiceGroupHealth < 3) {
    checkUnnamed2438(o.healthStatus);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterBackendServiceGroupHealth--;
}

buildUnnamed2439() {
  var o = new core.List<api.BackendService>();
  o.add(buildBackendService());
  o.add(buildBackendService());
  return o;
}

checkUnnamed2439(core.List<api.BackendService> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkBackendService(o[0]);
  checkBackendService(o[1]);
}

core.int buildCounterBackendServiceList = 0;
buildBackendServiceList() {
  var o = new api.BackendServiceList();
  buildCounterBackendServiceList++;
  if (buildCounterBackendServiceList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2439();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterBackendServiceList--;
  return o;
}

checkBackendServiceList(api.BackendServiceList o) {
  buildCounterBackendServiceList++;
  if (buildCounterBackendServiceList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2439(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterBackendServiceList--;
}

core.int buildCounterCacheInvalidationRule = 0;
buildCacheInvalidationRule() {
  var o = new api.CacheInvalidationRule();
  buildCounterCacheInvalidationRule++;
  if (buildCounterCacheInvalidationRule < 3) {
    o.path = "foo";
  }
  buildCounterCacheInvalidationRule--;
  return o;
}

checkCacheInvalidationRule(api.CacheInvalidationRule o) {
  buildCounterCacheInvalidationRule++;
  if (buildCounterCacheInvalidationRule < 3) {
    unittest.expect(o.path, unittest.equals('foo'));
  }
  buildCounterCacheInvalidationRule--;
}

core.int buildCounterCustomerEncryptionKey = 0;
buildCustomerEncryptionKey() {
  var o = new api.CustomerEncryptionKey();
  buildCounterCustomerEncryptionKey++;
  if (buildCounterCustomerEncryptionKey < 3) {
    o.rawKey = "foo";
    o.sha256 = "foo";
  }
  buildCounterCustomerEncryptionKey--;
  return o;
}

checkCustomerEncryptionKey(api.CustomerEncryptionKey o) {
  buildCounterCustomerEncryptionKey++;
  if (buildCounterCustomerEncryptionKey < 3) {
    unittest.expect(o.rawKey, unittest.equals('foo'));
    unittest.expect(o.sha256, unittest.equals('foo'));
  }
  buildCounterCustomerEncryptionKey--;
}

core.int buildCounterCustomerEncryptionKeyProtectedDisk = 0;
buildCustomerEncryptionKeyProtectedDisk() {
  var o = new api.CustomerEncryptionKeyProtectedDisk();
  buildCounterCustomerEncryptionKeyProtectedDisk++;
  if (buildCounterCustomerEncryptionKeyProtectedDisk < 3) {
    o.diskEncryptionKey = buildCustomerEncryptionKey();
    o.source = "foo";
  }
  buildCounterCustomerEncryptionKeyProtectedDisk--;
  return o;
}

checkCustomerEncryptionKeyProtectedDisk(api.CustomerEncryptionKeyProtectedDisk o) {
  buildCounterCustomerEncryptionKeyProtectedDisk++;
  if (buildCounterCustomerEncryptionKeyProtectedDisk < 3) {
    checkCustomerEncryptionKey(o.diskEncryptionKey);
    unittest.expect(o.source, unittest.equals('foo'));
  }
  buildCounterCustomerEncryptionKeyProtectedDisk--;
}

core.int buildCounterDeprecationStatus = 0;
buildDeprecationStatus() {
  var o = new api.DeprecationStatus();
  buildCounterDeprecationStatus++;
  if (buildCounterDeprecationStatus < 3) {
    o.deleted = "foo";
    o.deprecated = "foo";
    o.obsolete = "foo";
    o.replacement = "foo";
    o.state = "foo";
  }
  buildCounterDeprecationStatus--;
  return o;
}

checkDeprecationStatus(api.DeprecationStatus o) {
  buildCounterDeprecationStatus++;
  if (buildCounterDeprecationStatus < 3) {
    unittest.expect(o.deleted, unittest.equals('foo'));
    unittest.expect(o.deprecated, unittest.equals('foo'));
    unittest.expect(o.obsolete, unittest.equals('foo'));
    unittest.expect(o.replacement, unittest.equals('foo'));
    unittest.expect(o.state, unittest.equals('foo'));
  }
  buildCounterDeprecationStatus--;
}

buildUnnamed2440() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2440(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2441() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2441(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterDisk = 0;
buildDisk() {
  var o = new api.Disk();
  buildCounterDisk++;
  if (buildCounterDisk < 3) {
    o.creationTimestamp = "foo";
    o.description = "foo";
    o.diskEncryptionKey = buildCustomerEncryptionKey();
    o.id = "foo";
    o.kind = "foo";
    o.lastAttachTimestamp = "foo";
    o.lastDetachTimestamp = "foo";
    o.licenses = buildUnnamed2440();
    o.name = "foo";
    o.options = "foo";
    o.selfLink = "foo";
    o.sizeGb = "foo";
    o.sourceImage = "foo";
    o.sourceImageEncryptionKey = buildCustomerEncryptionKey();
    o.sourceImageId = "foo";
    o.sourceSnapshot = "foo";
    o.sourceSnapshotEncryptionKey = buildCustomerEncryptionKey();
    o.sourceSnapshotId = "foo";
    o.status = "foo";
    o.type = "foo";
    o.users = buildUnnamed2441();
    o.zone = "foo";
  }
  buildCounterDisk--;
  return o;
}

checkDisk(api.Disk o) {
  buildCounterDisk++;
  if (buildCounterDisk < 3) {
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    checkCustomerEncryptionKey(o.diskEncryptionKey);
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.lastAttachTimestamp, unittest.equals('foo'));
    unittest.expect(o.lastDetachTimestamp, unittest.equals('foo'));
    checkUnnamed2440(o.licenses);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.options, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
    unittest.expect(o.sizeGb, unittest.equals('foo'));
    unittest.expect(o.sourceImage, unittest.equals('foo'));
    checkCustomerEncryptionKey(o.sourceImageEncryptionKey);
    unittest.expect(o.sourceImageId, unittest.equals('foo'));
    unittest.expect(o.sourceSnapshot, unittest.equals('foo'));
    checkCustomerEncryptionKey(o.sourceSnapshotEncryptionKey);
    unittest.expect(o.sourceSnapshotId, unittest.equals('foo'));
    unittest.expect(o.status, unittest.equals('foo'));
    unittest.expect(o.type, unittest.equals('foo'));
    checkUnnamed2441(o.users);
    unittest.expect(o.zone, unittest.equals('foo'));
  }
  buildCounterDisk--;
}

buildUnnamed2442() {
  var o = new core.Map<core.String, api.DisksScopedList>();
  o["x"] = buildDisksScopedList();
  o["y"] = buildDisksScopedList();
  return o;
}

checkUnnamed2442(core.Map<core.String, api.DisksScopedList> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDisksScopedList(o["x"]);
  checkDisksScopedList(o["y"]);
}

core.int buildCounterDiskAggregatedList = 0;
buildDiskAggregatedList() {
  var o = new api.DiskAggregatedList();
  buildCounterDiskAggregatedList++;
  if (buildCounterDiskAggregatedList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2442();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterDiskAggregatedList--;
  return o;
}

checkDiskAggregatedList(api.DiskAggregatedList o) {
  buildCounterDiskAggregatedList++;
  if (buildCounterDiskAggregatedList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2442(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterDiskAggregatedList--;
}

buildUnnamed2443() {
  var o = new core.List<api.Disk>();
  o.add(buildDisk());
  o.add(buildDisk());
  return o;
}

checkUnnamed2443(core.List<api.Disk> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDisk(o[0]);
  checkDisk(o[1]);
}

core.int buildCounterDiskList = 0;
buildDiskList() {
  var o = new api.DiskList();
  buildCounterDiskList++;
  if (buildCounterDiskList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2443();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterDiskList--;
  return o;
}

checkDiskList(api.DiskList o) {
  buildCounterDiskList++;
  if (buildCounterDiskList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2443(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterDiskList--;
}

core.int buildCounterDiskMoveRequest = 0;
buildDiskMoveRequest() {
  var o = new api.DiskMoveRequest();
  buildCounterDiskMoveRequest++;
  if (buildCounterDiskMoveRequest < 3) {
    o.destinationZone = "foo";
    o.targetDisk = "foo";
  }
  buildCounterDiskMoveRequest--;
  return o;
}

checkDiskMoveRequest(api.DiskMoveRequest o) {
  buildCounterDiskMoveRequest++;
  if (buildCounterDiskMoveRequest < 3) {
    unittest.expect(o.destinationZone, unittest.equals('foo'));
    unittest.expect(o.targetDisk, unittest.equals('foo'));
  }
  buildCounterDiskMoveRequest--;
}

core.int buildCounterDiskType = 0;
buildDiskType() {
  var o = new api.DiskType();
  buildCounterDiskType++;
  if (buildCounterDiskType < 3) {
    o.creationTimestamp = "foo";
    o.defaultDiskSizeGb = "foo";
    o.deprecated = buildDeprecationStatus();
    o.description = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.selfLink = "foo";
    o.validDiskSize = "foo";
    o.zone = "foo";
  }
  buildCounterDiskType--;
  return o;
}

checkDiskType(api.DiskType o) {
  buildCounterDiskType++;
  if (buildCounterDiskType < 3) {
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.defaultDiskSizeGb, unittest.equals('foo'));
    checkDeprecationStatus(o.deprecated);
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
    unittest.expect(o.validDiskSize, unittest.equals('foo'));
    unittest.expect(o.zone, unittest.equals('foo'));
  }
  buildCounterDiskType--;
}

buildUnnamed2444() {
  var o = new core.Map<core.String, api.DiskTypesScopedList>();
  o["x"] = buildDiskTypesScopedList();
  o["y"] = buildDiskTypesScopedList();
  return o;
}

checkUnnamed2444(core.Map<core.String, api.DiskTypesScopedList> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDiskTypesScopedList(o["x"]);
  checkDiskTypesScopedList(o["y"]);
}

core.int buildCounterDiskTypeAggregatedList = 0;
buildDiskTypeAggregatedList() {
  var o = new api.DiskTypeAggregatedList();
  buildCounterDiskTypeAggregatedList++;
  if (buildCounterDiskTypeAggregatedList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2444();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterDiskTypeAggregatedList--;
  return o;
}

checkDiskTypeAggregatedList(api.DiskTypeAggregatedList o) {
  buildCounterDiskTypeAggregatedList++;
  if (buildCounterDiskTypeAggregatedList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2444(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterDiskTypeAggregatedList--;
}

buildUnnamed2445() {
  var o = new core.List<api.DiskType>();
  o.add(buildDiskType());
  o.add(buildDiskType());
  return o;
}

checkUnnamed2445(core.List<api.DiskType> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDiskType(o[0]);
  checkDiskType(o[1]);
}

core.int buildCounterDiskTypeList = 0;
buildDiskTypeList() {
  var o = new api.DiskTypeList();
  buildCounterDiskTypeList++;
  if (buildCounterDiskTypeList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2445();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterDiskTypeList--;
  return o;
}

checkDiskTypeList(api.DiskTypeList o) {
  buildCounterDiskTypeList++;
  if (buildCounterDiskTypeList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2445(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterDiskTypeList--;
}

buildUnnamed2446() {
  var o = new core.List<api.DiskType>();
  o.add(buildDiskType());
  o.add(buildDiskType());
  return o;
}

checkUnnamed2446(core.List<api.DiskType> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDiskType(o[0]);
  checkDiskType(o[1]);
}

core.int buildCounterDiskTypesScopedListWarningData = 0;
buildDiskTypesScopedListWarningData() {
  var o = new api.DiskTypesScopedListWarningData();
  buildCounterDiskTypesScopedListWarningData++;
  if (buildCounterDiskTypesScopedListWarningData < 3) {
    o.key = "foo";
    o.value = "foo";
  }
  buildCounterDiskTypesScopedListWarningData--;
  return o;
}

checkDiskTypesScopedListWarningData(api.DiskTypesScopedListWarningData o) {
  buildCounterDiskTypesScopedListWarningData++;
  if (buildCounterDiskTypesScopedListWarningData < 3) {
    unittest.expect(o.key, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterDiskTypesScopedListWarningData--;
}

buildUnnamed2447() {
  var o = new core.List<api.DiskTypesScopedListWarningData>();
  o.add(buildDiskTypesScopedListWarningData());
  o.add(buildDiskTypesScopedListWarningData());
  return o;
}

checkUnnamed2447(core.List<api.DiskTypesScopedListWarningData> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDiskTypesScopedListWarningData(o[0]);
  checkDiskTypesScopedListWarningData(o[1]);
}

core.int buildCounterDiskTypesScopedListWarning = 0;
buildDiskTypesScopedListWarning() {
  var o = new api.DiskTypesScopedListWarning();
  buildCounterDiskTypesScopedListWarning++;
  if (buildCounterDiskTypesScopedListWarning < 3) {
    o.code = "foo";
    o.data = buildUnnamed2447();
    o.message = "foo";
  }
  buildCounterDiskTypesScopedListWarning--;
  return o;
}

checkDiskTypesScopedListWarning(api.DiskTypesScopedListWarning o) {
  buildCounterDiskTypesScopedListWarning++;
  if (buildCounterDiskTypesScopedListWarning < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    checkUnnamed2447(o.data);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterDiskTypesScopedListWarning--;
}

core.int buildCounterDiskTypesScopedList = 0;
buildDiskTypesScopedList() {
  var o = new api.DiskTypesScopedList();
  buildCounterDiskTypesScopedList++;
  if (buildCounterDiskTypesScopedList < 3) {
    o.diskTypes = buildUnnamed2446();
    o.warning = buildDiskTypesScopedListWarning();
  }
  buildCounterDiskTypesScopedList--;
  return o;
}

checkDiskTypesScopedList(api.DiskTypesScopedList o) {
  buildCounterDiskTypesScopedList++;
  if (buildCounterDiskTypesScopedList < 3) {
    checkUnnamed2446(o.diskTypes);
    checkDiskTypesScopedListWarning(o.warning);
  }
  buildCounterDiskTypesScopedList--;
}

core.int buildCounterDisksResizeRequest = 0;
buildDisksResizeRequest() {
  var o = new api.DisksResizeRequest();
  buildCounterDisksResizeRequest++;
  if (buildCounterDisksResizeRequest < 3) {
    o.sizeGb = "foo";
  }
  buildCounterDisksResizeRequest--;
  return o;
}

checkDisksResizeRequest(api.DisksResizeRequest o) {
  buildCounterDisksResizeRequest++;
  if (buildCounterDisksResizeRequest < 3) {
    unittest.expect(o.sizeGb, unittest.equals('foo'));
  }
  buildCounterDisksResizeRequest--;
}

buildUnnamed2448() {
  var o = new core.List<api.Disk>();
  o.add(buildDisk());
  o.add(buildDisk());
  return o;
}

checkUnnamed2448(core.List<api.Disk> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDisk(o[0]);
  checkDisk(o[1]);
}

core.int buildCounterDisksScopedListWarningData = 0;
buildDisksScopedListWarningData() {
  var o = new api.DisksScopedListWarningData();
  buildCounterDisksScopedListWarningData++;
  if (buildCounterDisksScopedListWarningData < 3) {
    o.key = "foo";
    o.value = "foo";
  }
  buildCounterDisksScopedListWarningData--;
  return o;
}

checkDisksScopedListWarningData(api.DisksScopedListWarningData o) {
  buildCounterDisksScopedListWarningData++;
  if (buildCounterDisksScopedListWarningData < 3) {
    unittest.expect(o.key, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterDisksScopedListWarningData--;
}

buildUnnamed2449() {
  var o = new core.List<api.DisksScopedListWarningData>();
  o.add(buildDisksScopedListWarningData());
  o.add(buildDisksScopedListWarningData());
  return o;
}

checkUnnamed2449(core.List<api.DisksScopedListWarningData> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkDisksScopedListWarningData(o[0]);
  checkDisksScopedListWarningData(o[1]);
}

core.int buildCounterDisksScopedListWarning = 0;
buildDisksScopedListWarning() {
  var o = new api.DisksScopedListWarning();
  buildCounterDisksScopedListWarning++;
  if (buildCounterDisksScopedListWarning < 3) {
    o.code = "foo";
    o.data = buildUnnamed2449();
    o.message = "foo";
  }
  buildCounterDisksScopedListWarning--;
  return o;
}

checkDisksScopedListWarning(api.DisksScopedListWarning o) {
  buildCounterDisksScopedListWarning++;
  if (buildCounterDisksScopedListWarning < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    checkUnnamed2449(o.data);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterDisksScopedListWarning--;
}

core.int buildCounterDisksScopedList = 0;
buildDisksScopedList() {
  var o = new api.DisksScopedList();
  buildCounterDisksScopedList++;
  if (buildCounterDisksScopedList < 3) {
    o.disks = buildUnnamed2448();
    o.warning = buildDisksScopedListWarning();
  }
  buildCounterDisksScopedList--;
  return o;
}

checkDisksScopedList(api.DisksScopedList o) {
  buildCounterDisksScopedList++;
  if (buildCounterDisksScopedList < 3) {
    checkUnnamed2448(o.disks);
    checkDisksScopedListWarning(o.warning);
  }
  buildCounterDisksScopedList--;
}

buildUnnamed2450() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2450(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterFirewallAllowed = 0;
buildFirewallAllowed() {
  var o = new api.FirewallAllowed();
  buildCounterFirewallAllowed++;
  if (buildCounterFirewallAllowed < 3) {
    o.IPProtocol = "foo";
    o.ports = buildUnnamed2450();
  }
  buildCounterFirewallAllowed--;
  return o;
}

checkFirewallAllowed(api.FirewallAllowed o) {
  buildCounterFirewallAllowed++;
  if (buildCounterFirewallAllowed < 3) {
    unittest.expect(o.IPProtocol, unittest.equals('foo'));
    checkUnnamed2450(o.ports);
  }
  buildCounterFirewallAllowed--;
}

buildUnnamed2451() {
  var o = new core.List<api.FirewallAllowed>();
  o.add(buildFirewallAllowed());
  o.add(buildFirewallAllowed());
  return o;
}

checkUnnamed2451(core.List<api.FirewallAllowed> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFirewallAllowed(o[0]);
  checkFirewallAllowed(o[1]);
}

buildUnnamed2452() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2452(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2453() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2453(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2454() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2454(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterFirewall = 0;
buildFirewall() {
  var o = new api.Firewall();
  buildCounterFirewall++;
  if (buildCounterFirewall < 3) {
    o.allowed = buildUnnamed2451();
    o.creationTimestamp = "foo";
    o.description = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.network = "foo";
    o.selfLink = "foo";
    o.sourceRanges = buildUnnamed2452();
    o.sourceTags = buildUnnamed2453();
    o.targetTags = buildUnnamed2454();
  }
  buildCounterFirewall--;
  return o;
}

checkFirewall(api.Firewall o) {
  buildCounterFirewall++;
  if (buildCounterFirewall < 3) {
    checkUnnamed2451(o.allowed);
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.network, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
    checkUnnamed2452(o.sourceRanges);
    checkUnnamed2453(o.sourceTags);
    checkUnnamed2454(o.targetTags);
  }
  buildCounterFirewall--;
}

buildUnnamed2455() {
  var o = new core.List<api.Firewall>();
  o.add(buildFirewall());
  o.add(buildFirewall());
  return o;
}

checkUnnamed2455(core.List<api.Firewall> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkFirewall(o[0]);
  checkFirewall(o[1]);
}

core.int buildCounterFirewallList = 0;
buildFirewallList() {
  var o = new api.FirewallList();
  buildCounterFirewallList++;
  if (buildCounterFirewallList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2455();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterFirewallList--;
  return o;
}

checkFirewallList(api.FirewallList o) {
  buildCounterFirewallList++;
  if (buildCounterFirewallList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2455(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterFirewallList--;
}

core.int buildCounterForwardingRule = 0;
buildForwardingRule() {
  var o = new api.ForwardingRule();
  buildCounterForwardingRule++;
  if (buildCounterForwardingRule < 3) {
    o.IPAddress = "foo";
    o.IPProtocol = "foo";
    o.creationTimestamp = "foo";
    o.description = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.portRange = "foo";
    o.region = "foo";
    o.selfLink = "foo";
    o.target = "foo";
  }
  buildCounterForwardingRule--;
  return o;
}

checkForwardingRule(api.ForwardingRule o) {
  buildCounterForwardingRule++;
  if (buildCounterForwardingRule < 3) {
    unittest.expect(o.IPAddress, unittest.equals('foo'));
    unittest.expect(o.IPProtocol, unittest.equals('foo'));
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.portRange, unittest.equals('foo'));
    unittest.expect(o.region, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
    unittest.expect(o.target, unittest.equals('foo'));
  }
  buildCounterForwardingRule--;
}

buildUnnamed2456() {
  var o = new core.Map<core.String, api.ForwardingRulesScopedList>();
  o["x"] = buildForwardingRulesScopedList();
  o["y"] = buildForwardingRulesScopedList();
  return o;
}

checkUnnamed2456(core.Map<core.String, api.ForwardingRulesScopedList> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkForwardingRulesScopedList(o["x"]);
  checkForwardingRulesScopedList(o["y"]);
}

core.int buildCounterForwardingRuleAggregatedList = 0;
buildForwardingRuleAggregatedList() {
  var o = new api.ForwardingRuleAggregatedList();
  buildCounterForwardingRuleAggregatedList++;
  if (buildCounterForwardingRuleAggregatedList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2456();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterForwardingRuleAggregatedList--;
  return o;
}

checkForwardingRuleAggregatedList(api.ForwardingRuleAggregatedList o) {
  buildCounterForwardingRuleAggregatedList++;
  if (buildCounterForwardingRuleAggregatedList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2456(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterForwardingRuleAggregatedList--;
}

buildUnnamed2457() {
  var o = new core.List<api.ForwardingRule>();
  o.add(buildForwardingRule());
  o.add(buildForwardingRule());
  return o;
}

checkUnnamed2457(core.List<api.ForwardingRule> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkForwardingRule(o[0]);
  checkForwardingRule(o[1]);
}

core.int buildCounterForwardingRuleList = 0;
buildForwardingRuleList() {
  var o = new api.ForwardingRuleList();
  buildCounterForwardingRuleList++;
  if (buildCounterForwardingRuleList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2457();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterForwardingRuleList--;
  return o;
}

checkForwardingRuleList(api.ForwardingRuleList o) {
  buildCounterForwardingRuleList++;
  if (buildCounterForwardingRuleList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2457(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterForwardingRuleList--;
}

buildUnnamed2458() {
  var o = new core.List<api.ForwardingRule>();
  o.add(buildForwardingRule());
  o.add(buildForwardingRule());
  return o;
}

checkUnnamed2458(core.List<api.ForwardingRule> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkForwardingRule(o[0]);
  checkForwardingRule(o[1]);
}

core.int buildCounterForwardingRulesScopedListWarningData = 0;
buildForwardingRulesScopedListWarningData() {
  var o = new api.ForwardingRulesScopedListWarningData();
  buildCounterForwardingRulesScopedListWarningData++;
  if (buildCounterForwardingRulesScopedListWarningData < 3) {
    o.key = "foo";
    o.value = "foo";
  }
  buildCounterForwardingRulesScopedListWarningData--;
  return o;
}

checkForwardingRulesScopedListWarningData(api.ForwardingRulesScopedListWarningData o) {
  buildCounterForwardingRulesScopedListWarningData++;
  if (buildCounterForwardingRulesScopedListWarningData < 3) {
    unittest.expect(o.key, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterForwardingRulesScopedListWarningData--;
}

buildUnnamed2459() {
  var o = new core.List<api.ForwardingRulesScopedListWarningData>();
  o.add(buildForwardingRulesScopedListWarningData());
  o.add(buildForwardingRulesScopedListWarningData());
  return o;
}

checkUnnamed2459(core.List<api.ForwardingRulesScopedListWarningData> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkForwardingRulesScopedListWarningData(o[0]);
  checkForwardingRulesScopedListWarningData(o[1]);
}

core.int buildCounterForwardingRulesScopedListWarning = 0;
buildForwardingRulesScopedListWarning() {
  var o = new api.ForwardingRulesScopedListWarning();
  buildCounterForwardingRulesScopedListWarning++;
  if (buildCounterForwardingRulesScopedListWarning < 3) {
    o.code = "foo";
    o.data = buildUnnamed2459();
    o.message = "foo";
  }
  buildCounterForwardingRulesScopedListWarning--;
  return o;
}

checkForwardingRulesScopedListWarning(api.ForwardingRulesScopedListWarning o) {
  buildCounterForwardingRulesScopedListWarning++;
  if (buildCounterForwardingRulesScopedListWarning < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    checkUnnamed2459(o.data);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterForwardingRulesScopedListWarning--;
}

core.int buildCounterForwardingRulesScopedList = 0;
buildForwardingRulesScopedList() {
  var o = new api.ForwardingRulesScopedList();
  buildCounterForwardingRulesScopedList++;
  if (buildCounterForwardingRulesScopedList < 3) {
    o.forwardingRules = buildUnnamed2458();
    o.warning = buildForwardingRulesScopedListWarning();
  }
  buildCounterForwardingRulesScopedList--;
  return o;
}

checkForwardingRulesScopedList(api.ForwardingRulesScopedList o) {
  buildCounterForwardingRulesScopedList++;
  if (buildCounterForwardingRulesScopedList < 3) {
    checkUnnamed2458(o.forwardingRules);
    checkForwardingRulesScopedListWarning(o.warning);
  }
  buildCounterForwardingRulesScopedList--;
}

core.int buildCounterHealthCheckReference = 0;
buildHealthCheckReference() {
  var o = new api.HealthCheckReference();
  buildCounterHealthCheckReference++;
  if (buildCounterHealthCheckReference < 3) {
    o.healthCheck = "foo";
  }
  buildCounterHealthCheckReference--;
  return o;
}

checkHealthCheckReference(api.HealthCheckReference o) {
  buildCounterHealthCheckReference++;
  if (buildCounterHealthCheckReference < 3) {
    unittest.expect(o.healthCheck, unittest.equals('foo'));
  }
  buildCounterHealthCheckReference--;
}

core.int buildCounterHealthStatus = 0;
buildHealthStatus() {
  var o = new api.HealthStatus();
  buildCounterHealthStatus++;
  if (buildCounterHealthStatus < 3) {
    o.healthState = "foo";
    o.instance = "foo";
    o.ipAddress = "foo";
    o.port = 42;
  }
  buildCounterHealthStatus--;
  return o;
}

checkHealthStatus(api.HealthStatus o) {
  buildCounterHealthStatus++;
  if (buildCounterHealthStatus < 3) {
    unittest.expect(o.healthState, unittest.equals('foo'));
    unittest.expect(o.instance, unittest.equals('foo'));
    unittest.expect(o.ipAddress, unittest.equals('foo'));
    unittest.expect(o.port, unittest.equals(42));
  }
  buildCounterHealthStatus--;
}

buildUnnamed2460() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2460(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterHostRule = 0;
buildHostRule() {
  var o = new api.HostRule();
  buildCounterHostRule++;
  if (buildCounterHostRule < 3) {
    o.description = "foo";
    o.hosts = buildUnnamed2460();
    o.pathMatcher = "foo";
  }
  buildCounterHostRule--;
  return o;
}

checkHostRule(api.HostRule o) {
  buildCounterHostRule++;
  if (buildCounterHostRule < 3) {
    unittest.expect(o.description, unittest.equals('foo'));
    checkUnnamed2460(o.hosts);
    unittest.expect(o.pathMatcher, unittest.equals('foo'));
  }
  buildCounterHostRule--;
}

core.int buildCounterHttpHealthCheck = 0;
buildHttpHealthCheck() {
  var o = new api.HttpHealthCheck();
  buildCounterHttpHealthCheck++;
  if (buildCounterHttpHealthCheck < 3) {
    o.checkIntervalSec = 42;
    o.creationTimestamp = "foo";
    o.description = "foo";
    o.healthyThreshold = 42;
    o.host = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.port = 42;
    o.requestPath = "foo";
    o.selfLink = "foo";
    o.timeoutSec = 42;
    o.unhealthyThreshold = 42;
  }
  buildCounterHttpHealthCheck--;
  return o;
}

checkHttpHealthCheck(api.HttpHealthCheck o) {
  buildCounterHttpHealthCheck++;
  if (buildCounterHttpHealthCheck < 3) {
    unittest.expect(o.checkIntervalSec, unittest.equals(42));
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.healthyThreshold, unittest.equals(42));
    unittest.expect(o.host, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.port, unittest.equals(42));
    unittest.expect(o.requestPath, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
    unittest.expect(o.timeoutSec, unittest.equals(42));
    unittest.expect(o.unhealthyThreshold, unittest.equals(42));
  }
  buildCounterHttpHealthCheck--;
}

buildUnnamed2461() {
  var o = new core.List<api.HttpHealthCheck>();
  o.add(buildHttpHealthCheck());
  o.add(buildHttpHealthCheck());
  return o;
}

checkUnnamed2461(core.List<api.HttpHealthCheck> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkHttpHealthCheck(o[0]);
  checkHttpHealthCheck(o[1]);
}

core.int buildCounterHttpHealthCheckList = 0;
buildHttpHealthCheckList() {
  var o = new api.HttpHealthCheckList();
  buildCounterHttpHealthCheckList++;
  if (buildCounterHttpHealthCheckList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2461();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterHttpHealthCheckList--;
  return o;
}

checkHttpHealthCheckList(api.HttpHealthCheckList o) {
  buildCounterHttpHealthCheckList++;
  if (buildCounterHttpHealthCheckList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2461(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterHttpHealthCheckList--;
}

core.int buildCounterHttpsHealthCheck = 0;
buildHttpsHealthCheck() {
  var o = new api.HttpsHealthCheck();
  buildCounterHttpsHealthCheck++;
  if (buildCounterHttpsHealthCheck < 3) {
    o.checkIntervalSec = 42;
    o.creationTimestamp = "foo";
    o.description = "foo";
    o.healthyThreshold = 42;
    o.host = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.port = 42;
    o.requestPath = "foo";
    o.selfLink = "foo";
    o.timeoutSec = 42;
    o.unhealthyThreshold = 42;
  }
  buildCounterHttpsHealthCheck--;
  return o;
}

checkHttpsHealthCheck(api.HttpsHealthCheck o) {
  buildCounterHttpsHealthCheck++;
  if (buildCounterHttpsHealthCheck < 3) {
    unittest.expect(o.checkIntervalSec, unittest.equals(42));
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.healthyThreshold, unittest.equals(42));
    unittest.expect(o.host, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.port, unittest.equals(42));
    unittest.expect(o.requestPath, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
    unittest.expect(o.timeoutSec, unittest.equals(42));
    unittest.expect(o.unhealthyThreshold, unittest.equals(42));
  }
  buildCounterHttpsHealthCheck--;
}

buildUnnamed2462() {
  var o = new core.List<api.HttpsHealthCheck>();
  o.add(buildHttpsHealthCheck());
  o.add(buildHttpsHealthCheck());
  return o;
}

checkUnnamed2462(core.List<api.HttpsHealthCheck> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkHttpsHealthCheck(o[0]);
  checkHttpsHealthCheck(o[1]);
}

core.int buildCounterHttpsHealthCheckList = 0;
buildHttpsHealthCheckList() {
  var o = new api.HttpsHealthCheckList();
  buildCounterHttpsHealthCheckList++;
  if (buildCounterHttpsHealthCheckList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2462();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterHttpsHealthCheckList--;
  return o;
}

checkHttpsHealthCheckList(api.HttpsHealthCheckList o) {
  buildCounterHttpsHealthCheckList++;
  if (buildCounterHttpsHealthCheckList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2462(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterHttpsHealthCheckList--;
}

buildUnnamed2463() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2463(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterImageRawDisk = 0;
buildImageRawDisk() {
  var o = new api.ImageRawDisk();
  buildCounterImageRawDisk++;
  if (buildCounterImageRawDisk < 3) {
    o.containerType = "foo";
    o.sha1Checksum = "foo";
    o.source = "foo";
  }
  buildCounterImageRawDisk--;
  return o;
}

checkImageRawDisk(api.ImageRawDisk o) {
  buildCounterImageRawDisk++;
  if (buildCounterImageRawDisk < 3) {
    unittest.expect(o.containerType, unittest.equals('foo'));
    unittest.expect(o.sha1Checksum, unittest.equals('foo'));
    unittest.expect(o.source, unittest.equals('foo'));
  }
  buildCounterImageRawDisk--;
}

core.int buildCounterImage = 0;
buildImage() {
  var o = new api.Image();
  buildCounterImage++;
  if (buildCounterImage < 3) {
    o.archiveSizeBytes = "foo";
    o.creationTimestamp = "foo";
    o.deprecated = buildDeprecationStatus();
    o.description = "foo";
    o.diskSizeGb = "foo";
    o.family = "foo";
    o.id = "foo";
    o.imageEncryptionKey = buildCustomerEncryptionKey();
    o.kind = "foo";
    o.licenses = buildUnnamed2463();
    o.name = "foo";
    o.rawDisk = buildImageRawDisk();
    o.selfLink = "foo";
    o.sourceDisk = "foo";
    o.sourceDiskEncryptionKey = buildCustomerEncryptionKey();
    o.sourceDiskId = "foo";
    o.sourceType = "foo";
    o.status = "foo";
  }
  buildCounterImage--;
  return o;
}

checkImage(api.Image o) {
  buildCounterImage++;
  if (buildCounterImage < 3) {
    unittest.expect(o.archiveSizeBytes, unittest.equals('foo'));
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    checkDeprecationStatus(o.deprecated);
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.diskSizeGb, unittest.equals('foo'));
    unittest.expect(o.family, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    checkCustomerEncryptionKey(o.imageEncryptionKey);
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed2463(o.licenses);
    unittest.expect(o.name, unittest.equals('foo'));
    checkImageRawDisk(o.rawDisk);
    unittest.expect(o.selfLink, unittest.equals('foo'));
    unittest.expect(o.sourceDisk, unittest.equals('foo'));
    checkCustomerEncryptionKey(o.sourceDiskEncryptionKey);
    unittest.expect(o.sourceDiskId, unittest.equals('foo'));
    unittest.expect(o.sourceType, unittest.equals('foo'));
    unittest.expect(o.status, unittest.equals('foo'));
  }
  buildCounterImage--;
}

buildUnnamed2464() {
  var o = new core.List<api.Image>();
  o.add(buildImage());
  o.add(buildImage());
  return o;
}

checkUnnamed2464(core.List<api.Image> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkImage(o[0]);
  checkImage(o[1]);
}

core.int buildCounterImageList = 0;
buildImageList() {
  var o = new api.ImageList();
  buildCounterImageList++;
  if (buildCounterImageList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2464();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterImageList--;
  return o;
}

checkImageList(api.ImageList o) {
  buildCounterImageList++;
  if (buildCounterImageList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2464(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterImageList--;
}

buildUnnamed2465() {
  var o = new core.List<api.AttachedDisk>();
  o.add(buildAttachedDisk());
  o.add(buildAttachedDisk());
  return o;
}

checkUnnamed2465(core.List<api.AttachedDisk> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAttachedDisk(o[0]);
  checkAttachedDisk(o[1]);
}

buildUnnamed2466() {
  var o = new core.List<api.NetworkInterface>();
  o.add(buildNetworkInterface());
  o.add(buildNetworkInterface());
  return o;
}

checkUnnamed2466(core.List<api.NetworkInterface> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkNetworkInterface(o[0]);
  checkNetworkInterface(o[1]);
}

buildUnnamed2467() {
  var o = new core.List<api.ServiceAccount>();
  o.add(buildServiceAccount());
  o.add(buildServiceAccount());
  return o;
}

checkUnnamed2467(core.List<api.ServiceAccount> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkServiceAccount(o[0]);
  checkServiceAccount(o[1]);
}

core.int buildCounterInstance = 0;
buildInstance() {
  var o = new api.Instance();
  buildCounterInstance++;
  if (buildCounterInstance < 3) {
    o.canIpForward = true;
    o.cpuPlatform = "foo";
    o.creationTimestamp = "foo";
    o.description = "foo";
    o.disks = buildUnnamed2465();
    o.id = "foo";
    o.kind = "foo";
    o.machineType = "foo";
    o.metadata = buildMetadata();
    o.name = "foo";
    o.networkInterfaces = buildUnnamed2466();
    o.scheduling = buildScheduling();
    o.selfLink = "foo";
    o.serviceAccounts = buildUnnamed2467();
    o.status = "foo";
    o.statusMessage = "foo";
    o.tags = buildTags();
    o.zone = "foo";
  }
  buildCounterInstance--;
  return o;
}

checkInstance(api.Instance o) {
  buildCounterInstance++;
  if (buildCounterInstance < 3) {
    unittest.expect(o.canIpForward, unittest.isTrue);
    unittest.expect(o.cpuPlatform, unittest.equals('foo'));
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    checkUnnamed2465(o.disks);
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.machineType, unittest.equals('foo'));
    checkMetadata(o.metadata);
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed2466(o.networkInterfaces);
    checkScheduling(o.scheduling);
    unittest.expect(o.selfLink, unittest.equals('foo'));
    checkUnnamed2467(o.serviceAccounts);
    unittest.expect(o.status, unittest.equals('foo'));
    unittest.expect(o.statusMessage, unittest.equals('foo'));
    checkTags(o.tags);
    unittest.expect(o.zone, unittest.equals('foo'));
  }
  buildCounterInstance--;
}

buildUnnamed2468() {
  var o = new core.Map<core.String, api.InstancesScopedList>();
  o["x"] = buildInstancesScopedList();
  o["y"] = buildInstancesScopedList();
  return o;
}

checkUnnamed2468(core.Map<core.String, api.InstancesScopedList> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInstancesScopedList(o["x"]);
  checkInstancesScopedList(o["y"]);
}

core.int buildCounterInstanceAggregatedList = 0;
buildInstanceAggregatedList() {
  var o = new api.InstanceAggregatedList();
  buildCounterInstanceAggregatedList++;
  if (buildCounterInstanceAggregatedList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2468();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterInstanceAggregatedList--;
  return o;
}

checkInstanceAggregatedList(api.InstanceAggregatedList o) {
  buildCounterInstanceAggregatedList++;
  if (buildCounterInstanceAggregatedList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2468(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterInstanceAggregatedList--;
}

buildUnnamed2469() {
  var o = new core.List<api.NamedPort>();
  o.add(buildNamedPort());
  o.add(buildNamedPort());
  return o;
}

checkUnnamed2469(core.List<api.NamedPort> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkNamedPort(o[0]);
  checkNamedPort(o[1]);
}

core.int buildCounterInstanceGroup = 0;
buildInstanceGroup() {
  var o = new api.InstanceGroup();
  buildCounterInstanceGroup++;
  if (buildCounterInstanceGroup < 3) {
    o.creationTimestamp = "foo";
    o.description = "foo";
    o.fingerprint = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.namedPorts = buildUnnamed2469();
    o.network = "foo";
    o.selfLink = "foo";
    o.size = 42;
    o.subnetwork = "foo";
    o.zone = "foo";
  }
  buildCounterInstanceGroup--;
  return o;
}

checkInstanceGroup(api.InstanceGroup o) {
  buildCounterInstanceGroup++;
  if (buildCounterInstanceGroup < 3) {
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed2469(o.namedPorts);
    unittest.expect(o.network, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
    unittest.expect(o.size, unittest.equals(42));
    unittest.expect(o.subnetwork, unittest.equals('foo'));
    unittest.expect(o.zone, unittest.equals('foo'));
  }
  buildCounterInstanceGroup--;
}

buildUnnamed2470() {
  var o = new core.Map<core.String, api.InstanceGroupsScopedList>();
  o["x"] = buildInstanceGroupsScopedList();
  o["y"] = buildInstanceGroupsScopedList();
  return o;
}

checkUnnamed2470(core.Map<core.String, api.InstanceGroupsScopedList> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInstanceGroupsScopedList(o["x"]);
  checkInstanceGroupsScopedList(o["y"]);
}

core.int buildCounterInstanceGroupAggregatedList = 0;
buildInstanceGroupAggregatedList() {
  var o = new api.InstanceGroupAggregatedList();
  buildCounterInstanceGroupAggregatedList++;
  if (buildCounterInstanceGroupAggregatedList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2470();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterInstanceGroupAggregatedList--;
  return o;
}

checkInstanceGroupAggregatedList(api.InstanceGroupAggregatedList o) {
  buildCounterInstanceGroupAggregatedList++;
  if (buildCounterInstanceGroupAggregatedList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2470(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterInstanceGroupAggregatedList--;
}

buildUnnamed2471() {
  var o = new core.List<api.InstanceGroup>();
  o.add(buildInstanceGroup());
  o.add(buildInstanceGroup());
  return o;
}

checkUnnamed2471(core.List<api.InstanceGroup> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInstanceGroup(o[0]);
  checkInstanceGroup(o[1]);
}

core.int buildCounterInstanceGroupList = 0;
buildInstanceGroupList() {
  var o = new api.InstanceGroupList();
  buildCounterInstanceGroupList++;
  if (buildCounterInstanceGroupList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2471();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterInstanceGroupList--;
  return o;
}

checkInstanceGroupList(api.InstanceGroupList o) {
  buildCounterInstanceGroupList++;
  if (buildCounterInstanceGroupList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2471(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterInstanceGroupList--;
}

buildUnnamed2472() {
  var o = new core.List<api.NamedPort>();
  o.add(buildNamedPort());
  o.add(buildNamedPort());
  return o;
}

checkUnnamed2472(core.List<api.NamedPort> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkNamedPort(o[0]);
  checkNamedPort(o[1]);
}

buildUnnamed2473() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2473(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterInstanceGroupManager = 0;
buildInstanceGroupManager() {
  var o = new api.InstanceGroupManager();
  buildCounterInstanceGroupManager++;
  if (buildCounterInstanceGroupManager < 3) {
    o.baseInstanceName = "foo";
    o.creationTimestamp = "foo";
    o.currentActions = buildInstanceGroupManagerActionsSummary();
    o.description = "foo";
    o.fingerprint = "foo";
    o.id = "foo";
    o.instanceGroup = "foo";
    o.instanceTemplate = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.namedPorts = buildUnnamed2472();
    o.selfLink = "foo";
    o.targetPools = buildUnnamed2473();
    o.targetSize = 42;
    o.zone = "foo";
  }
  buildCounterInstanceGroupManager--;
  return o;
}

checkInstanceGroupManager(api.InstanceGroupManager o) {
  buildCounterInstanceGroupManager++;
  if (buildCounterInstanceGroupManager < 3) {
    unittest.expect(o.baseInstanceName, unittest.equals('foo'));
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    checkInstanceGroupManagerActionsSummary(o.currentActions);
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.instanceGroup, unittest.equals('foo'));
    unittest.expect(o.instanceTemplate, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed2472(o.namedPorts);
    unittest.expect(o.selfLink, unittest.equals('foo'));
    checkUnnamed2473(o.targetPools);
    unittest.expect(o.targetSize, unittest.equals(42));
    unittest.expect(o.zone, unittest.equals('foo'));
  }
  buildCounterInstanceGroupManager--;
}

core.int buildCounterInstanceGroupManagerActionsSummary = 0;
buildInstanceGroupManagerActionsSummary() {
  var o = new api.InstanceGroupManagerActionsSummary();
  buildCounterInstanceGroupManagerActionsSummary++;
  if (buildCounterInstanceGroupManagerActionsSummary < 3) {
    o.abandoning = 42;
    o.creating = 42;
    o.creatingWithoutRetries = 42;
    o.deleting = 42;
    o.none = 42;
    o.recreating = 42;
    o.refreshing = 42;
    o.restarting = 42;
  }
  buildCounterInstanceGroupManagerActionsSummary--;
  return o;
}

checkInstanceGroupManagerActionsSummary(api.InstanceGroupManagerActionsSummary o) {
  buildCounterInstanceGroupManagerActionsSummary++;
  if (buildCounterInstanceGroupManagerActionsSummary < 3) {
    unittest.expect(o.abandoning, unittest.equals(42));
    unittest.expect(o.creating, unittest.equals(42));
    unittest.expect(o.creatingWithoutRetries, unittest.equals(42));
    unittest.expect(o.deleting, unittest.equals(42));
    unittest.expect(o.none, unittest.equals(42));
    unittest.expect(o.recreating, unittest.equals(42));
    unittest.expect(o.refreshing, unittest.equals(42));
    unittest.expect(o.restarting, unittest.equals(42));
  }
  buildCounterInstanceGroupManagerActionsSummary--;
}

buildUnnamed2474() {
  var o = new core.Map<core.String, api.InstanceGroupManagersScopedList>();
  o["x"] = buildInstanceGroupManagersScopedList();
  o["y"] = buildInstanceGroupManagersScopedList();
  return o;
}

checkUnnamed2474(core.Map<core.String, api.InstanceGroupManagersScopedList> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInstanceGroupManagersScopedList(o["x"]);
  checkInstanceGroupManagersScopedList(o["y"]);
}

core.int buildCounterInstanceGroupManagerAggregatedList = 0;
buildInstanceGroupManagerAggregatedList() {
  var o = new api.InstanceGroupManagerAggregatedList();
  buildCounterInstanceGroupManagerAggregatedList++;
  if (buildCounterInstanceGroupManagerAggregatedList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2474();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterInstanceGroupManagerAggregatedList--;
  return o;
}

checkInstanceGroupManagerAggregatedList(api.InstanceGroupManagerAggregatedList o) {
  buildCounterInstanceGroupManagerAggregatedList++;
  if (buildCounterInstanceGroupManagerAggregatedList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2474(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterInstanceGroupManagerAggregatedList--;
}

buildUnnamed2475() {
  var o = new core.List<api.InstanceGroupManager>();
  o.add(buildInstanceGroupManager());
  o.add(buildInstanceGroupManager());
  return o;
}

checkUnnamed2475(core.List<api.InstanceGroupManager> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInstanceGroupManager(o[0]);
  checkInstanceGroupManager(o[1]);
}

core.int buildCounterInstanceGroupManagerList = 0;
buildInstanceGroupManagerList() {
  var o = new api.InstanceGroupManagerList();
  buildCounterInstanceGroupManagerList++;
  if (buildCounterInstanceGroupManagerList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2475();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterInstanceGroupManagerList--;
  return o;
}

checkInstanceGroupManagerList(api.InstanceGroupManagerList o) {
  buildCounterInstanceGroupManagerList++;
  if (buildCounterInstanceGroupManagerList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2475(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterInstanceGroupManagerList--;
}

buildUnnamed2476() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2476(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterInstanceGroupManagersAbandonInstancesRequest = 0;
buildInstanceGroupManagersAbandonInstancesRequest() {
  var o = new api.InstanceGroupManagersAbandonInstancesRequest();
  buildCounterInstanceGroupManagersAbandonInstancesRequest++;
  if (buildCounterInstanceGroupManagersAbandonInstancesRequest < 3) {
    o.instances = buildUnnamed2476();
  }
  buildCounterInstanceGroupManagersAbandonInstancesRequest--;
  return o;
}

checkInstanceGroupManagersAbandonInstancesRequest(api.InstanceGroupManagersAbandonInstancesRequest o) {
  buildCounterInstanceGroupManagersAbandonInstancesRequest++;
  if (buildCounterInstanceGroupManagersAbandonInstancesRequest < 3) {
    checkUnnamed2476(o.instances);
  }
  buildCounterInstanceGroupManagersAbandonInstancesRequest--;
}

buildUnnamed2477() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2477(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterInstanceGroupManagersDeleteInstancesRequest = 0;
buildInstanceGroupManagersDeleteInstancesRequest() {
  var o = new api.InstanceGroupManagersDeleteInstancesRequest();
  buildCounterInstanceGroupManagersDeleteInstancesRequest++;
  if (buildCounterInstanceGroupManagersDeleteInstancesRequest < 3) {
    o.instances = buildUnnamed2477();
  }
  buildCounterInstanceGroupManagersDeleteInstancesRequest--;
  return o;
}

checkInstanceGroupManagersDeleteInstancesRequest(api.InstanceGroupManagersDeleteInstancesRequest o) {
  buildCounterInstanceGroupManagersDeleteInstancesRequest++;
  if (buildCounterInstanceGroupManagersDeleteInstancesRequest < 3) {
    checkUnnamed2477(o.instances);
  }
  buildCounterInstanceGroupManagersDeleteInstancesRequest--;
}

buildUnnamed2478() {
  var o = new core.List<api.ManagedInstance>();
  o.add(buildManagedInstance());
  o.add(buildManagedInstance());
  return o;
}

checkUnnamed2478(core.List<api.ManagedInstance> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkManagedInstance(o[0]);
  checkManagedInstance(o[1]);
}

core.int buildCounterInstanceGroupManagersListManagedInstancesResponse = 0;
buildInstanceGroupManagersListManagedInstancesResponse() {
  var o = new api.InstanceGroupManagersListManagedInstancesResponse();
  buildCounterInstanceGroupManagersListManagedInstancesResponse++;
  if (buildCounterInstanceGroupManagersListManagedInstancesResponse < 3) {
    o.managedInstances = buildUnnamed2478();
  }
  buildCounterInstanceGroupManagersListManagedInstancesResponse--;
  return o;
}

checkInstanceGroupManagersListManagedInstancesResponse(api.InstanceGroupManagersListManagedInstancesResponse o) {
  buildCounterInstanceGroupManagersListManagedInstancesResponse++;
  if (buildCounterInstanceGroupManagersListManagedInstancesResponse < 3) {
    checkUnnamed2478(o.managedInstances);
  }
  buildCounterInstanceGroupManagersListManagedInstancesResponse--;
}

buildUnnamed2479() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2479(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterInstanceGroupManagersRecreateInstancesRequest = 0;
buildInstanceGroupManagersRecreateInstancesRequest() {
  var o = new api.InstanceGroupManagersRecreateInstancesRequest();
  buildCounterInstanceGroupManagersRecreateInstancesRequest++;
  if (buildCounterInstanceGroupManagersRecreateInstancesRequest < 3) {
    o.instances = buildUnnamed2479();
  }
  buildCounterInstanceGroupManagersRecreateInstancesRequest--;
  return o;
}

checkInstanceGroupManagersRecreateInstancesRequest(api.InstanceGroupManagersRecreateInstancesRequest o) {
  buildCounterInstanceGroupManagersRecreateInstancesRequest++;
  if (buildCounterInstanceGroupManagersRecreateInstancesRequest < 3) {
    checkUnnamed2479(o.instances);
  }
  buildCounterInstanceGroupManagersRecreateInstancesRequest--;
}

buildUnnamed2480() {
  var o = new core.List<api.InstanceGroupManager>();
  o.add(buildInstanceGroupManager());
  o.add(buildInstanceGroupManager());
  return o;
}

checkUnnamed2480(core.List<api.InstanceGroupManager> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInstanceGroupManager(o[0]);
  checkInstanceGroupManager(o[1]);
}

core.int buildCounterInstanceGroupManagersScopedListWarningData = 0;
buildInstanceGroupManagersScopedListWarningData() {
  var o = new api.InstanceGroupManagersScopedListWarningData();
  buildCounterInstanceGroupManagersScopedListWarningData++;
  if (buildCounterInstanceGroupManagersScopedListWarningData < 3) {
    o.key = "foo";
    o.value = "foo";
  }
  buildCounterInstanceGroupManagersScopedListWarningData--;
  return o;
}

checkInstanceGroupManagersScopedListWarningData(api.InstanceGroupManagersScopedListWarningData o) {
  buildCounterInstanceGroupManagersScopedListWarningData++;
  if (buildCounterInstanceGroupManagersScopedListWarningData < 3) {
    unittest.expect(o.key, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterInstanceGroupManagersScopedListWarningData--;
}

buildUnnamed2481() {
  var o = new core.List<api.InstanceGroupManagersScopedListWarningData>();
  o.add(buildInstanceGroupManagersScopedListWarningData());
  o.add(buildInstanceGroupManagersScopedListWarningData());
  return o;
}

checkUnnamed2481(core.List<api.InstanceGroupManagersScopedListWarningData> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInstanceGroupManagersScopedListWarningData(o[0]);
  checkInstanceGroupManagersScopedListWarningData(o[1]);
}

core.int buildCounterInstanceGroupManagersScopedListWarning = 0;
buildInstanceGroupManagersScopedListWarning() {
  var o = new api.InstanceGroupManagersScopedListWarning();
  buildCounterInstanceGroupManagersScopedListWarning++;
  if (buildCounterInstanceGroupManagersScopedListWarning < 3) {
    o.code = "foo";
    o.data = buildUnnamed2481();
    o.message = "foo";
  }
  buildCounterInstanceGroupManagersScopedListWarning--;
  return o;
}

checkInstanceGroupManagersScopedListWarning(api.InstanceGroupManagersScopedListWarning o) {
  buildCounterInstanceGroupManagersScopedListWarning++;
  if (buildCounterInstanceGroupManagersScopedListWarning < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    checkUnnamed2481(o.data);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterInstanceGroupManagersScopedListWarning--;
}

core.int buildCounterInstanceGroupManagersScopedList = 0;
buildInstanceGroupManagersScopedList() {
  var o = new api.InstanceGroupManagersScopedList();
  buildCounterInstanceGroupManagersScopedList++;
  if (buildCounterInstanceGroupManagersScopedList < 3) {
    o.instanceGroupManagers = buildUnnamed2480();
    o.warning = buildInstanceGroupManagersScopedListWarning();
  }
  buildCounterInstanceGroupManagersScopedList--;
  return o;
}

checkInstanceGroupManagersScopedList(api.InstanceGroupManagersScopedList o) {
  buildCounterInstanceGroupManagersScopedList++;
  if (buildCounterInstanceGroupManagersScopedList < 3) {
    checkUnnamed2480(o.instanceGroupManagers);
    checkInstanceGroupManagersScopedListWarning(o.warning);
  }
  buildCounterInstanceGroupManagersScopedList--;
}

core.int buildCounterInstanceGroupManagersSetInstanceTemplateRequest = 0;
buildInstanceGroupManagersSetInstanceTemplateRequest() {
  var o = new api.InstanceGroupManagersSetInstanceTemplateRequest();
  buildCounterInstanceGroupManagersSetInstanceTemplateRequest++;
  if (buildCounterInstanceGroupManagersSetInstanceTemplateRequest < 3) {
    o.instanceTemplate = "foo";
  }
  buildCounterInstanceGroupManagersSetInstanceTemplateRequest--;
  return o;
}

checkInstanceGroupManagersSetInstanceTemplateRequest(api.InstanceGroupManagersSetInstanceTemplateRequest o) {
  buildCounterInstanceGroupManagersSetInstanceTemplateRequest++;
  if (buildCounterInstanceGroupManagersSetInstanceTemplateRequest < 3) {
    unittest.expect(o.instanceTemplate, unittest.equals('foo'));
  }
  buildCounterInstanceGroupManagersSetInstanceTemplateRequest--;
}

buildUnnamed2482() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2482(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterInstanceGroupManagersSetTargetPoolsRequest = 0;
buildInstanceGroupManagersSetTargetPoolsRequest() {
  var o = new api.InstanceGroupManagersSetTargetPoolsRequest();
  buildCounterInstanceGroupManagersSetTargetPoolsRequest++;
  if (buildCounterInstanceGroupManagersSetTargetPoolsRequest < 3) {
    o.fingerprint = "foo";
    o.targetPools = buildUnnamed2482();
  }
  buildCounterInstanceGroupManagersSetTargetPoolsRequest--;
  return o;
}

checkInstanceGroupManagersSetTargetPoolsRequest(api.InstanceGroupManagersSetTargetPoolsRequest o) {
  buildCounterInstanceGroupManagersSetTargetPoolsRequest++;
  if (buildCounterInstanceGroupManagersSetTargetPoolsRequest < 3) {
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    checkUnnamed2482(o.targetPools);
  }
  buildCounterInstanceGroupManagersSetTargetPoolsRequest--;
}

buildUnnamed2483() {
  var o = new core.List<api.InstanceReference>();
  o.add(buildInstanceReference());
  o.add(buildInstanceReference());
  return o;
}

checkUnnamed2483(core.List<api.InstanceReference> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInstanceReference(o[0]);
  checkInstanceReference(o[1]);
}

core.int buildCounterInstanceGroupsAddInstancesRequest = 0;
buildInstanceGroupsAddInstancesRequest() {
  var o = new api.InstanceGroupsAddInstancesRequest();
  buildCounterInstanceGroupsAddInstancesRequest++;
  if (buildCounterInstanceGroupsAddInstancesRequest < 3) {
    o.instances = buildUnnamed2483();
  }
  buildCounterInstanceGroupsAddInstancesRequest--;
  return o;
}

checkInstanceGroupsAddInstancesRequest(api.InstanceGroupsAddInstancesRequest o) {
  buildCounterInstanceGroupsAddInstancesRequest++;
  if (buildCounterInstanceGroupsAddInstancesRequest < 3) {
    checkUnnamed2483(o.instances);
  }
  buildCounterInstanceGroupsAddInstancesRequest--;
}

buildUnnamed2484() {
  var o = new core.List<api.InstanceWithNamedPorts>();
  o.add(buildInstanceWithNamedPorts());
  o.add(buildInstanceWithNamedPorts());
  return o;
}

checkUnnamed2484(core.List<api.InstanceWithNamedPorts> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInstanceWithNamedPorts(o[0]);
  checkInstanceWithNamedPorts(o[1]);
}

core.int buildCounterInstanceGroupsListInstances = 0;
buildInstanceGroupsListInstances() {
  var o = new api.InstanceGroupsListInstances();
  buildCounterInstanceGroupsListInstances++;
  if (buildCounterInstanceGroupsListInstances < 3) {
    o.id = "foo";
    o.items = buildUnnamed2484();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterInstanceGroupsListInstances--;
  return o;
}

checkInstanceGroupsListInstances(api.InstanceGroupsListInstances o) {
  buildCounterInstanceGroupsListInstances++;
  if (buildCounterInstanceGroupsListInstances < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2484(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterInstanceGroupsListInstances--;
}

core.int buildCounterInstanceGroupsListInstancesRequest = 0;
buildInstanceGroupsListInstancesRequest() {
  var o = new api.InstanceGroupsListInstancesRequest();
  buildCounterInstanceGroupsListInstancesRequest++;
  if (buildCounterInstanceGroupsListInstancesRequest < 3) {
    o.instanceState = "foo";
  }
  buildCounterInstanceGroupsListInstancesRequest--;
  return o;
}

checkInstanceGroupsListInstancesRequest(api.InstanceGroupsListInstancesRequest o) {
  buildCounterInstanceGroupsListInstancesRequest++;
  if (buildCounterInstanceGroupsListInstancesRequest < 3) {
    unittest.expect(o.instanceState, unittest.equals('foo'));
  }
  buildCounterInstanceGroupsListInstancesRequest--;
}

buildUnnamed2485() {
  var o = new core.List<api.InstanceReference>();
  o.add(buildInstanceReference());
  o.add(buildInstanceReference());
  return o;
}

checkUnnamed2485(core.List<api.InstanceReference> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInstanceReference(o[0]);
  checkInstanceReference(o[1]);
}

core.int buildCounterInstanceGroupsRemoveInstancesRequest = 0;
buildInstanceGroupsRemoveInstancesRequest() {
  var o = new api.InstanceGroupsRemoveInstancesRequest();
  buildCounterInstanceGroupsRemoveInstancesRequest++;
  if (buildCounterInstanceGroupsRemoveInstancesRequest < 3) {
    o.instances = buildUnnamed2485();
  }
  buildCounterInstanceGroupsRemoveInstancesRequest--;
  return o;
}

checkInstanceGroupsRemoveInstancesRequest(api.InstanceGroupsRemoveInstancesRequest o) {
  buildCounterInstanceGroupsRemoveInstancesRequest++;
  if (buildCounterInstanceGroupsRemoveInstancesRequest < 3) {
    checkUnnamed2485(o.instances);
  }
  buildCounterInstanceGroupsRemoveInstancesRequest--;
}

buildUnnamed2486() {
  var o = new core.List<api.InstanceGroup>();
  o.add(buildInstanceGroup());
  o.add(buildInstanceGroup());
  return o;
}

checkUnnamed2486(core.List<api.InstanceGroup> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInstanceGroup(o[0]);
  checkInstanceGroup(o[1]);
}

core.int buildCounterInstanceGroupsScopedListWarningData = 0;
buildInstanceGroupsScopedListWarningData() {
  var o = new api.InstanceGroupsScopedListWarningData();
  buildCounterInstanceGroupsScopedListWarningData++;
  if (buildCounterInstanceGroupsScopedListWarningData < 3) {
    o.key = "foo";
    o.value = "foo";
  }
  buildCounterInstanceGroupsScopedListWarningData--;
  return o;
}

checkInstanceGroupsScopedListWarningData(api.InstanceGroupsScopedListWarningData o) {
  buildCounterInstanceGroupsScopedListWarningData++;
  if (buildCounterInstanceGroupsScopedListWarningData < 3) {
    unittest.expect(o.key, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterInstanceGroupsScopedListWarningData--;
}

buildUnnamed2487() {
  var o = new core.List<api.InstanceGroupsScopedListWarningData>();
  o.add(buildInstanceGroupsScopedListWarningData());
  o.add(buildInstanceGroupsScopedListWarningData());
  return o;
}

checkUnnamed2487(core.List<api.InstanceGroupsScopedListWarningData> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInstanceGroupsScopedListWarningData(o[0]);
  checkInstanceGroupsScopedListWarningData(o[1]);
}

core.int buildCounterInstanceGroupsScopedListWarning = 0;
buildInstanceGroupsScopedListWarning() {
  var o = new api.InstanceGroupsScopedListWarning();
  buildCounterInstanceGroupsScopedListWarning++;
  if (buildCounterInstanceGroupsScopedListWarning < 3) {
    o.code = "foo";
    o.data = buildUnnamed2487();
    o.message = "foo";
  }
  buildCounterInstanceGroupsScopedListWarning--;
  return o;
}

checkInstanceGroupsScopedListWarning(api.InstanceGroupsScopedListWarning o) {
  buildCounterInstanceGroupsScopedListWarning++;
  if (buildCounterInstanceGroupsScopedListWarning < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    checkUnnamed2487(o.data);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterInstanceGroupsScopedListWarning--;
}

core.int buildCounterInstanceGroupsScopedList = 0;
buildInstanceGroupsScopedList() {
  var o = new api.InstanceGroupsScopedList();
  buildCounterInstanceGroupsScopedList++;
  if (buildCounterInstanceGroupsScopedList < 3) {
    o.instanceGroups = buildUnnamed2486();
    o.warning = buildInstanceGroupsScopedListWarning();
  }
  buildCounterInstanceGroupsScopedList--;
  return o;
}

checkInstanceGroupsScopedList(api.InstanceGroupsScopedList o) {
  buildCounterInstanceGroupsScopedList++;
  if (buildCounterInstanceGroupsScopedList < 3) {
    checkUnnamed2486(o.instanceGroups);
    checkInstanceGroupsScopedListWarning(o.warning);
  }
  buildCounterInstanceGroupsScopedList--;
}

buildUnnamed2488() {
  var o = new core.List<api.NamedPort>();
  o.add(buildNamedPort());
  o.add(buildNamedPort());
  return o;
}

checkUnnamed2488(core.List<api.NamedPort> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkNamedPort(o[0]);
  checkNamedPort(o[1]);
}

core.int buildCounterInstanceGroupsSetNamedPortsRequest = 0;
buildInstanceGroupsSetNamedPortsRequest() {
  var o = new api.InstanceGroupsSetNamedPortsRequest();
  buildCounterInstanceGroupsSetNamedPortsRequest++;
  if (buildCounterInstanceGroupsSetNamedPortsRequest < 3) {
    o.fingerprint = "foo";
    o.namedPorts = buildUnnamed2488();
  }
  buildCounterInstanceGroupsSetNamedPortsRequest--;
  return o;
}

checkInstanceGroupsSetNamedPortsRequest(api.InstanceGroupsSetNamedPortsRequest o) {
  buildCounterInstanceGroupsSetNamedPortsRequest++;
  if (buildCounterInstanceGroupsSetNamedPortsRequest < 3) {
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    checkUnnamed2488(o.namedPorts);
  }
  buildCounterInstanceGroupsSetNamedPortsRequest--;
}

buildUnnamed2489() {
  var o = new core.List<api.Instance>();
  o.add(buildInstance());
  o.add(buildInstance());
  return o;
}

checkUnnamed2489(core.List<api.Instance> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInstance(o[0]);
  checkInstance(o[1]);
}

core.int buildCounterInstanceList = 0;
buildInstanceList() {
  var o = new api.InstanceList();
  buildCounterInstanceList++;
  if (buildCounterInstanceList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2489();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterInstanceList--;
  return o;
}

checkInstanceList(api.InstanceList o) {
  buildCounterInstanceList++;
  if (buildCounterInstanceList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2489(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterInstanceList--;
}

core.int buildCounterInstanceMoveRequest = 0;
buildInstanceMoveRequest() {
  var o = new api.InstanceMoveRequest();
  buildCounterInstanceMoveRequest++;
  if (buildCounterInstanceMoveRequest < 3) {
    o.destinationZone = "foo";
    o.targetInstance = "foo";
  }
  buildCounterInstanceMoveRequest--;
  return o;
}

checkInstanceMoveRequest(api.InstanceMoveRequest o) {
  buildCounterInstanceMoveRequest++;
  if (buildCounterInstanceMoveRequest < 3) {
    unittest.expect(o.destinationZone, unittest.equals('foo'));
    unittest.expect(o.targetInstance, unittest.equals('foo'));
  }
  buildCounterInstanceMoveRequest--;
}

buildUnnamed2490() {
  var o = new core.List<api.AttachedDisk>();
  o.add(buildAttachedDisk());
  o.add(buildAttachedDisk());
  return o;
}

checkUnnamed2490(core.List<api.AttachedDisk> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAttachedDisk(o[0]);
  checkAttachedDisk(o[1]);
}

buildUnnamed2491() {
  var o = new core.List<api.NetworkInterface>();
  o.add(buildNetworkInterface());
  o.add(buildNetworkInterface());
  return o;
}

checkUnnamed2491(core.List<api.NetworkInterface> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkNetworkInterface(o[0]);
  checkNetworkInterface(o[1]);
}

buildUnnamed2492() {
  var o = new core.List<api.ServiceAccount>();
  o.add(buildServiceAccount());
  o.add(buildServiceAccount());
  return o;
}

checkUnnamed2492(core.List<api.ServiceAccount> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkServiceAccount(o[0]);
  checkServiceAccount(o[1]);
}

core.int buildCounterInstanceProperties = 0;
buildInstanceProperties() {
  var o = new api.InstanceProperties();
  buildCounterInstanceProperties++;
  if (buildCounterInstanceProperties < 3) {
    o.canIpForward = true;
    o.description = "foo";
    o.disks = buildUnnamed2490();
    o.machineType = "foo";
    o.metadata = buildMetadata();
    o.networkInterfaces = buildUnnamed2491();
    o.scheduling = buildScheduling();
    o.serviceAccounts = buildUnnamed2492();
    o.tags = buildTags();
  }
  buildCounterInstanceProperties--;
  return o;
}

checkInstanceProperties(api.InstanceProperties o) {
  buildCounterInstanceProperties++;
  if (buildCounterInstanceProperties < 3) {
    unittest.expect(o.canIpForward, unittest.isTrue);
    unittest.expect(o.description, unittest.equals('foo'));
    checkUnnamed2490(o.disks);
    unittest.expect(o.machineType, unittest.equals('foo'));
    checkMetadata(o.metadata);
    checkUnnamed2491(o.networkInterfaces);
    checkScheduling(o.scheduling);
    checkUnnamed2492(o.serviceAccounts);
    checkTags(o.tags);
  }
  buildCounterInstanceProperties--;
}

core.int buildCounterInstanceReference = 0;
buildInstanceReference() {
  var o = new api.InstanceReference();
  buildCounterInstanceReference++;
  if (buildCounterInstanceReference < 3) {
    o.instance = "foo";
  }
  buildCounterInstanceReference--;
  return o;
}

checkInstanceReference(api.InstanceReference o) {
  buildCounterInstanceReference++;
  if (buildCounterInstanceReference < 3) {
    unittest.expect(o.instance, unittest.equals('foo'));
  }
  buildCounterInstanceReference--;
}

core.int buildCounterInstanceTemplate = 0;
buildInstanceTemplate() {
  var o = new api.InstanceTemplate();
  buildCounterInstanceTemplate++;
  if (buildCounterInstanceTemplate < 3) {
    o.creationTimestamp = "foo";
    o.description = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.properties = buildInstanceProperties();
    o.selfLink = "foo";
  }
  buildCounterInstanceTemplate--;
  return o;
}

checkInstanceTemplate(api.InstanceTemplate o) {
  buildCounterInstanceTemplate++;
  if (buildCounterInstanceTemplate < 3) {
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    checkInstanceProperties(o.properties);
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterInstanceTemplate--;
}

buildUnnamed2493() {
  var o = new core.List<api.InstanceTemplate>();
  o.add(buildInstanceTemplate());
  o.add(buildInstanceTemplate());
  return o;
}

checkUnnamed2493(core.List<api.InstanceTemplate> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInstanceTemplate(o[0]);
  checkInstanceTemplate(o[1]);
}

core.int buildCounterInstanceTemplateList = 0;
buildInstanceTemplateList() {
  var o = new api.InstanceTemplateList();
  buildCounterInstanceTemplateList++;
  if (buildCounterInstanceTemplateList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2493();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterInstanceTemplateList--;
  return o;
}

checkInstanceTemplateList(api.InstanceTemplateList o) {
  buildCounterInstanceTemplateList++;
  if (buildCounterInstanceTemplateList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2493(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterInstanceTemplateList--;
}

buildUnnamed2494() {
  var o = new core.List<api.NamedPort>();
  o.add(buildNamedPort());
  o.add(buildNamedPort());
  return o;
}

checkUnnamed2494(core.List<api.NamedPort> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkNamedPort(o[0]);
  checkNamedPort(o[1]);
}

core.int buildCounterInstanceWithNamedPorts = 0;
buildInstanceWithNamedPorts() {
  var o = new api.InstanceWithNamedPorts();
  buildCounterInstanceWithNamedPorts++;
  if (buildCounterInstanceWithNamedPorts < 3) {
    o.instance = "foo";
    o.namedPorts = buildUnnamed2494();
    o.status = "foo";
  }
  buildCounterInstanceWithNamedPorts--;
  return o;
}

checkInstanceWithNamedPorts(api.InstanceWithNamedPorts o) {
  buildCounterInstanceWithNamedPorts++;
  if (buildCounterInstanceWithNamedPorts < 3) {
    unittest.expect(o.instance, unittest.equals('foo'));
    checkUnnamed2494(o.namedPorts);
    unittest.expect(o.status, unittest.equals('foo'));
  }
  buildCounterInstanceWithNamedPorts--;
}

buildUnnamed2495() {
  var o = new core.List<api.Instance>();
  o.add(buildInstance());
  o.add(buildInstance());
  return o;
}

checkUnnamed2495(core.List<api.Instance> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInstance(o[0]);
  checkInstance(o[1]);
}

core.int buildCounterInstancesScopedListWarningData = 0;
buildInstancesScopedListWarningData() {
  var o = new api.InstancesScopedListWarningData();
  buildCounterInstancesScopedListWarningData++;
  if (buildCounterInstancesScopedListWarningData < 3) {
    o.key = "foo";
    o.value = "foo";
  }
  buildCounterInstancesScopedListWarningData--;
  return o;
}

checkInstancesScopedListWarningData(api.InstancesScopedListWarningData o) {
  buildCounterInstancesScopedListWarningData++;
  if (buildCounterInstancesScopedListWarningData < 3) {
    unittest.expect(o.key, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterInstancesScopedListWarningData--;
}

buildUnnamed2496() {
  var o = new core.List<api.InstancesScopedListWarningData>();
  o.add(buildInstancesScopedListWarningData());
  o.add(buildInstancesScopedListWarningData());
  return o;
}

checkUnnamed2496(core.List<api.InstancesScopedListWarningData> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInstancesScopedListWarningData(o[0]);
  checkInstancesScopedListWarningData(o[1]);
}

core.int buildCounterInstancesScopedListWarning = 0;
buildInstancesScopedListWarning() {
  var o = new api.InstancesScopedListWarning();
  buildCounterInstancesScopedListWarning++;
  if (buildCounterInstancesScopedListWarning < 3) {
    o.code = "foo";
    o.data = buildUnnamed2496();
    o.message = "foo";
  }
  buildCounterInstancesScopedListWarning--;
  return o;
}

checkInstancesScopedListWarning(api.InstancesScopedListWarning o) {
  buildCounterInstancesScopedListWarning++;
  if (buildCounterInstancesScopedListWarning < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    checkUnnamed2496(o.data);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterInstancesScopedListWarning--;
}

core.int buildCounterInstancesScopedList = 0;
buildInstancesScopedList() {
  var o = new api.InstancesScopedList();
  buildCounterInstancesScopedList++;
  if (buildCounterInstancesScopedList < 3) {
    o.instances = buildUnnamed2495();
    o.warning = buildInstancesScopedListWarning();
  }
  buildCounterInstancesScopedList--;
  return o;
}

checkInstancesScopedList(api.InstancesScopedList o) {
  buildCounterInstancesScopedList++;
  if (buildCounterInstancesScopedList < 3) {
    checkUnnamed2495(o.instances);
    checkInstancesScopedListWarning(o.warning);
  }
  buildCounterInstancesScopedList--;
}

core.int buildCounterInstancesSetMachineTypeRequest = 0;
buildInstancesSetMachineTypeRequest() {
  var o = new api.InstancesSetMachineTypeRequest();
  buildCounterInstancesSetMachineTypeRequest++;
  if (buildCounterInstancesSetMachineTypeRequest < 3) {
    o.machineType = "foo";
  }
  buildCounterInstancesSetMachineTypeRequest--;
  return o;
}

checkInstancesSetMachineTypeRequest(api.InstancesSetMachineTypeRequest o) {
  buildCounterInstancesSetMachineTypeRequest++;
  if (buildCounterInstancesSetMachineTypeRequest < 3) {
    unittest.expect(o.machineType, unittest.equals('foo'));
  }
  buildCounterInstancesSetMachineTypeRequest--;
}

buildUnnamed2497() {
  var o = new core.List<api.CustomerEncryptionKeyProtectedDisk>();
  o.add(buildCustomerEncryptionKeyProtectedDisk());
  o.add(buildCustomerEncryptionKeyProtectedDisk());
  return o;
}

checkUnnamed2497(core.List<api.CustomerEncryptionKeyProtectedDisk> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkCustomerEncryptionKeyProtectedDisk(o[0]);
  checkCustomerEncryptionKeyProtectedDisk(o[1]);
}

core.int buildCounterInstancesStartWithEncryptionKeyRequest = 0;
buildInstancesStartWithEncryptionKeyRequest() {
  var o = new api.InstancesStartWithEncryptionKeyRequest();
  buildCounterInstancesStartWithEncryptionKeyRequest++;
  if (buildCounterInstancesStartWithEncryptionKeyRequest < 3) {
    o.disks = buildUnnamed2497();
  }
  buildCounterInstancesStartWithEncryptionKeyRequest--;
  return o;
}

checkInstancesStartWithEncryptionKeyRequest(api.InstancesStartWithEncryptionKeyRequest o) {
  buildCounterInstancesStartWithEncryptionKeyRequest++;
  if (buildCounterInstancesStartWithEncryptionKeyRequest < 3) {
    checkUnnamed2497(o.disks);
  }
  buildCounterInstancesStartWithEncryptionKeyRequest--;
}

core.int buildCounterLicense = 0;
buildLicense() {
  var o = new api.License();
  buildCounterLicense++;
  if (buildCounterLicense < 3) {
    o.chargesUseFee = true;
    o.kind = "foo";
    o.name = "foo";
    o.selfLink = "foo";
  }
  buildCounterLicense--;
  return o;
}

checkLicense(api.License o) {
  buildCounterLicense++;
  if (buildCounterLicense < 3) {
    unittest.expect(o.chargesUseFee, unittest.isTrue);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterLicense--;
}

core.int buildCounterMachineTypeScratchDisks = 0;
buildMachineTypeScratchDisks() {
  var o = new api.MachineTypeScratchDisks();
  buildCounterMachineTypeScratchDisks++;
  if (buildCounterMachineTypeScratchDisks < 3) {
    o.diskGb = 42;
  }
  buildCounterMachineTypeScratchDisks--;
  return o;
}

checkMachineTypeScratchDisks(api.MachineTypeScratchDisks o) {
  buildCounterMachineTypeScratchDisks++;
  if (buildCounterMachineTypeScratchDisks < 3) {
    unittest.expect(o.diskGb, unittest.equals(42));
  }
  buildCounterMachineTypeScratchDisks--;
}

buildUnnamed2498() {
  var o = new core.List<api.MachineTypeScratchDisks>();
  o.add(buildMachineTypeScratchDisks());
  o.add(buildMachineTypeScratchDisks());
  return o;
}

checkUnnamed2498(core.List<api.MachineTypeScratchDisks> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMachineTypeScratchDisks(o[0]);
  checkMachineTypeScratchDisks(o[1]);
}

core.int buildCounterMachineType = 0;
buildMachineType() {
  var o = new api.MachineType();
  buildCounterMachineType++;
  if (buildCounterMachineType < 3) {
    o.creationTimestamp = "foo";
    o.deprecated = buildDeprecationStatus();
    o.description = "foo";
    o.guestCpus = 42;
    o.id = "foo";
    o.imageSpaceGb = 42;
    o.isSharedCpu = true;
    o.kind = "foo";
    o.maximumPersistentDisks = 42;
    o.maximumPersistentDisksSizeGb = "foo";
    o.memoryMb = 42;
    o.name = "foo";
    o.scratchDisks = buildUnnamed2498();
    o.selfLink = "foo";
    o.zone = "foo";
  }
  buildCounterMachineType--;
  return o;
}

checkMachineType(api.MachineType o) {
  buildCounterMachineType++;
  if (buildCounterMachineType < 3) {
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    checkDeprecationStatus(o.deprecated);
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.guestCpus, unittest.equals(42));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.imageSpaceGb, unittest.equals(42));
    unittest.expect(o.isSharedCpu, unittest.isTrue);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.maximumPersistentDisks, unittest.equals(42));
    unittest.expect(o.maximumPersistentDisksSizeGb, unittest.equals('foo'));
    unittest.expect(o.memoryMb, unittest.equals(42));
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed2498(o.scratchDisks);
    unittest.expect(o.selfLink, unittest.equals('foo'));
    unittest.expect(o.zone, unittest.equals('foo'));
  }
  buildCounterMachineType--;
}

buildUnnamed2499() {
  var o = new core.Map<core.String, api.MachineTypesScopedList>();
  o["x"] = buildMachineTypesScopedList();
  o["y"] = buildMachineTypesScopedList();
  return o;
}

checkUnnamed2499(core.Map<core.String, api.MachineTypesScopedList> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMachineTypesScopedList(o["x"]);
  checkMachineTypesScopedList(o["y"]);
}

core.int buildCounterMachineTypeAggregatedList = 0;
buildMachineTypeAggregatedList() {
  var o = new api.MachineTypeAggregatedList();
  buildCounterMachineTypeAggregatedList++;
  if (buildCounterMachineTypeAggregatedList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2499();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterMachineTypeAggregatedList--;
  return o;
}

checkMachineTypeAggregatedList(api.MachineTypeAggregatedList o) {
  buildCounterMachineTypeAggregatedList++;
  if (buildCounterMachineTypeAggregatedList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2499(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterMachineTypeAggregatedList--;
}

buildUnnamed2500() {
  var o = new core.List<api.MachineType>();
  o.add(buildMachineType());
  o.add(buildMachineType());
  return o;
}

checkUnnamed2500(core.List<api.MachineType> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMachineType(o[0]);
  checkMachineType(o[1]);
}

core.int buildCounterMachineTypeList = 0;
buildMachineTypeList() {
  var o = new api.MachineTypeList();
  buildCounterMachineTypeList++;
  if (buildCounterMachineTypeList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2500();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterMachineTypeList--;
  return o;
}

checkMachineTypeList(api.MachineTypeList o) {
  buildCounterMachineTypeList++;
  if (buildCounterMachineTypeList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2500(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterMachineTypeList--;
}

buildUnnamed2501() {
  var o = new core.List<api.MachineType>();
  o.add(buildMachineType());
  o.add(buildMachineType());
  return o;
}

checkUnnamed2501(core.List<api.MachineType> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMachineType(o[0]);
  checkMachineType(o[1]);
}

core.int buildCounterMachineTypesScopedListWarningData = 0;
buildMachineTypesScopedListWarningData() {
  var o = new api.MachineTypesScopedListWarningData();
  buildCounterMachineTypesScopedListWarningData++;
  if (buildCounterMachineTypesScopedListWarningData < 3) {
    o.key = "foo";
    o.value = "foo";
  }
  buildCounterMachineTypesScopedListWarningData--;
  return o;
}

checkMachineTypesScopedListWarningData(api.MachineTypesScopedListWarningData o) {
  buildCounterMachineTypesScopedListWarningData++;
  if (buildCounterMachineTypesScopedListWarningData < 3) {
    unittest.expect(o.key, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterMachineTypesScopedListWarningData--;
}

buildUnnamed2502() {
  var o = new core.List<api.MachineTypesScopedListWarningData>();
  o.add(buildMachineTypesScopedListWarningData());
  o.add(buildMachineTypesScopedListWarningData());
  return o;
}

checkUnnamed2502(core.List<api.MachineTypesScopedListWarningData> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMachineTypesScopedListWarningData(o[0]);
  checkMachineTypesScopedListWarningData(o[1]);
}

core.int buildCounterMachineTypesScopedListWarning = 0;
buildMachineTypesScopedListWarning() {
  var o = new api.MachineTypesScopedListWarning();
  buildCounterMachineTypesScopedListWarning++;
  if (buildCounterMachineTypesScopedListWarning < 3) {
    o.code = "foo";
    o.data = buildUnnamed2502();
    o.message = "foo";
  }
  buildCounterMachineTypesScopedListWarning--;
  return o;
}

checkMachineTypesScopedListWarning(api.MachineTypesScopedListWarning o) {
  buildCounterMachineTypesScopedListWarning++;
  if (buildCounterMachineTypesScopedListWarning < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    checkUnnamed2502(o.data);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterMachineTypesScopedListWarning--;
}

core.int buildCounterMachineTypesScopedList = 0;
buildMachineTypesScopedList() {
  var o = new api.MachineTypesScopedList();
  buildCounterMachineTypesScopedList++;
  if (buildCounterMachineTypesScopedList < 3) {
    o.machineTypes = buildUnnamed2501();
    o.warning = buildMachineTypesScopedListWarning();
  }
  buildCounterMachineTypesScopedList--;
  return o;
}

checkMachineTypesScopedList(api.MachineTypesScopedList o) {
  buildCounterMachineTypesScopedList++;
  if (buildCounterMachineTypesScopedList < 3) {
    checkUnnamed2501(o.machineTypes);
    checkMachineTypesScopedListWarning(o.warning);
  }
  buildCounterMachineTypesScopedList--;
}

core.int buildCounterManagedInstance = 0;
buildManagedInstance() {
  var o = new api.ManagedInstance();
  buildCounterManagedInstance++;
  if (buildCounterManagedInstance < 3) {
    o.currentAction = "foo";
    o.id = "foo";
    o.instance = "foo";
    o.instanceStatus = "foo";
    o.lastAttempt = buildManagedInstanceLastAttempt();
  }
  buildCounterManagedInstance--;
  return o;
}

checkManagedInstance(api.ManagedInstance o) {
  buildCounterManagedInstance++;
  if (buildCounterManagedInstance < 3) {
    unittest.expect(o.currentAction, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.instance, unittest.equals('foo'));
    unittest.expect(o.instanceStatus, unittest.equals('foo'));
    checkManagedInstanceLastAttempt(o.lastAttempt);
  }
  buildCounterManagedInstance--;
}

core.int buildCounterManagedInstanceLastAttemptErrorsErrors = 0;
buildManagedInstanceLastAttemptErrorsErrors() {
  var o = new api.ManagedInstanceLastAttemptErrorsErrors();
  buildCounterManagedInstanceLastAttemptErrorsErrors++;
  if (buildCounterManagedInstanceLastAttemptErrorsErrors < 3) {
    o.code = "foo";
    o.location = "foo";
    o.message = "foo";
  }
  buildCounterManagedInstanceLastAttemptErrorsErrors--;
  return o;
}

checkManagedInstanceLastAttemptErrorsErrors(api.ManagedInstanceLastAttemptErrorsErrors o) {
  buildCounterManagedInstanceLastAttemptErrorsErrors++;
  if (buildCounterManagedInstanceLastAttemptErrorsErrors < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    unittest.expect(o.location, unittest.equals('foo'));
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterManagedInstanceLastAttemptErrorsErrors--;
}

buildUnnamed2503() {
  var o = new core.List<api.ManagedInstanceLastAttemptErrorsErrors>();
  o.add(buildManagedInstanceLastAttemptErrorsErrors());
  o.add(buildManagedInstanceLastAttemptErrorsErrors());
  return o;
}

checkUnnamed2503(core.List<api.ManagedInstanceLastAttemptErrorsErrors> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkManagedInstanceLastAttemptErrorsErrors(o[0]);
  checkManagedInstanceLastAttemptErrorsErrors(o[1]);
}

core.int buildCounterManagedInstanceLastAttemptErrors = 0;
buildManagedInstanceLastAttemptErrors() {
  var o = new api.ManagedInstanceLastAttemptErrors();
  buildCounterManagedInstanceLastAttemptErrors++;
  if (buildCounterManagedInstanceLastAttemptErrors < 3) {
    o.errors = buildUnnamed2503();
  }
  buildCounterManagedInstanceLastAttemptErrors--;
  return o;
}

checkManagedInstanceLastAttemptErrors(api.ManagedInstanceLastAttemptErrors o) {
  buildCounterManagedInstanceLastAttemptErrors++;
  if (buildCounterManagedInstanceLastAttemptErrors < 3) {
    checkUnnamed2503(o.errors);
  }
  buildCounterManagedInstanceLastAttemptErrors--;
}

core.int buildCounterManagedInstanceLastAttempt = 0;
buildManagedInstanceLastAttempt() {
  var o = new api.ManagedInstanceLastAttempt();
  buildCounterManagedInstanceLastAttempt++;
  if (buildCounterManagedInstanceLastAttempt < 3) {
    o.errors = buildManagedInstanceLastAttemptErrors();
  }
  buildCounterManagedInstanceLastAttempt--;
  return o;
}

checkManagedInstanceLastAttempt(api.ManagedInstanceLastAttempt o) {
  buildCounterManagedInstanceLastAttempt++;
  if (buildCounterManagedInstanceLastAttempt < 3) {
    checkManagedInstanceLastAttemptErrors(o.errors);
  }
  buildCounterManagedInstanceLastAttempt--;
}

core.int buildCounterMetadataItems = 0;
buildMetadataItems() {
  var o = new api.MetadataItems();
  buildCounterMetadataItems++;
  if (buildCounterMetadataItems < 3) {
    o.key = "foo";
    o.value = "foo";
  }
  buildCounterMetadataItems--;
  return o;
}

checkMetadataItems(api.MetadataItems o) {
  buildCounterMetadataItems++;
  if (buildCounterMetadataItems < 3) {
    unittest.expect(o.key, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterMetadataItems--;
}

buildUnnamed2504() {
  var o = new core.List<api.MetadataItems>();
  o.add(buildMetadataItems());
  o.add(buildMetadataItems());
  return o;
}

checkUnnamed2504(core.List<api.MetadataItems> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkMetadataItems(o[0]);
  checkMetadataItems(o[1]);
}

core.int buildCounterMetadata = 0;
buildMetadata() {
  var o = new api.Metadata();
  buildCounterMetadata++;
  if (buildCounterMetadata < 3) {
    o.fingerprint = "foo";
    o.items = buildUnnamed2504();
    o.kind = "foo";
  }
  buildCounterMetadata--;
  return o;
}

checkMetadata(api.Metadata o) {
  buildCounterMetadata++;
  if (buildCounterMetadata < 3) {
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    checkUnnamed2504(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterMetadata--;
}

core.int buildCounterNamedPort = 0;
buildNamedPort() {
  var o = new api.NamedPort();
  buildCounterNamedPort++;
  if (buildCounterNamedPort < 3) {
    o.name = "foo";
    o.port = 42;
  }
  buildCounterNamedPort--;
  return o;
}

checkNamedPort(api.NamedPort o) {
  buildCounterNamedPort++;
  if (buildCounterNamedPort < 3) {
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.port, unittest.equals(42));
  }
  buildCounterNamedPort--;
}

buildUnnamed2505() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2505(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterNetwork = 0;
buildNetwork() {
  var o = new api.Network();
  buildCounterNetwork++;
  if (buildCounterNetwork < 3) {
    o.IPv4Range = "foo";
    o.autoCreateSubnetworks = true;
    o.creationTimestamp = "foo";
    o.description = "foo";
    o.gatewayIPv4 = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.selfLink = "foo";
    o.subnetworks = buildUnnamed2505();
  }
  buildCounterNetwork--;
  return o;
}

checkNetwork(api.Network o) {
  buildCounterNetwork++;
  if (buildCounterNetwork < 3) {
    unittest.expect(o.IPv4Range, unittest.equals('foo'));
    unittest.expect(o.autoCreateSubnetworks, unittest.isTrue);
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.gatewayIPv4, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
    checkUnnamed2505(o.subnetworks);
  }
  buildCounterNetwork--;
}

buildUnnamed2506() {
  var o = new core.List<api.AccessConfig>();
  o.add(buildAccessConfig());
  o.add(buildAccessConfig());
  return o;
}

checkUnnamed2506(core.List<api.AccessConfig> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAccessConfig(o[0]);
  checkAccessConfig(o[1]);
}

core.int buildCounterNetworkInterface = 0;
buildNetworkInterface() {
  var o = new api.NetworkInterface();
  buildCounterNetworkInterface++;
  if (buildCounterNetworkInterface < 3) {
    o.accessConfigs = buildUnnamed2506();
    o.name = "foo";
    o.network = "foo";
    o.networkIP = "foo";
    o.subnetwork = "foo";
  }
  buildCounterNetworkInterface--;
  return o;
}

checkNetworkInterface(api.NetworkInterface o) {
  buildCounterNetworkInterface++;
  if (buildCounterNetworkInterface < 3) {
    checkUnnamed2506(o.accessConfigs);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.network, unittest.equals('foo'));
    unittest.expect(o.networkIP, unittest.equals('foo'));
    unittest.expect(o.subnetwork, unittest.equals('foo'));
  }
  buildCounterNetworkInterface--;
}

buildUnnamed2507() {
  var o = new core.List<api.Network>();
  o.add(buildNetwork());
  o.add(buildNetwork());
  return o;
}

checkUnnamed2507(core.List<api.Network> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkNetwork(o[0]);
  checkNetwork(o[1]);
}

core.int buildCounterNetworkList = 0;
buildNetworkList() {
  var o = new api.NetworkList();
  buildCounterNetworkList++;
  if (buildCounterNetworkList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2507();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterNetworkList--;
  return o;
}

checkNetworkList(api.NetworkList o) {
  buildCounterNetworkList++;
  if (buildCounterNetworkList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2507(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterNetworkList--;
}

core.int buildCounterOperationErrorErrors = 0;
buildOperationErrorErrors() {
  var o = new api.OperationErrorErrors();
  buildCounterOperationErrorErrors++;
  if (buildCounterOperationErrorErrors < 3) {
    o.code = "foo";
    o.location = "foo";
    o.message = "foo";
  }
  buildCounterOperationErrorErrors--;
  return o;
}

checkOperationErrorErrors(api.OperationErrorErrors o) {
  buildCounterOperationErrorErrors++;
  if (buildCounterOperationErrorErrors < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    unittest.expect(o.location, unittest.equals('foo'));
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterOperationErrorErrors--;
}

buildUnnamed2508() {
  var o = new core.List<api.OperationErrorErrors>();
  o.add(buildOperationErrorErrors());
  o.add(buildOperationErrorErrors());
  return o;
}

checkUnnamed2508(core.List<api.OperationErrorErrors> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOperationErrorErrors(o[0]);
  checkOperationErrorErrors(o[1]);
}

core.int buildCounterOperationError = 0;
buildOperationError() {
  var o = new api.OperationError();
  buildCounterOperationError++;
  if (buildCounterOperationError < 3) {
    o.errors = buildUnnamed2508();
  }
  buildCounterOperationError--;
  return o;
}

checkOperationError(api.OperationError o) {
  buildCounterOperationError++;
  if (buildCounterOperationError < 3) {
    checkUnnamed2508(o.errors);
  }
  buildCounterOperationError--;
}

core.int buildCounterOperationWarningsData = 0;
buildOperationWarningsData() {
  var o = new api.OperationWarningsData();
  buildCounterOperationWarningsData++;
  if (buildCounterOperationWarningsData < 3) {
    o.key = "foo";
    o.value = "foo";
  }
  buildCounterOperationWarningsData--;
  return o;
}

checkOperationWarningsData(api.OperationWarningsData o) {
  buildCounterOperationWarningsData++;
  if (buildCounterOperationWarningsData < 3) {
    unittest.expect(o.key, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterOperationWarningsData--;
}

buildUnnamed2509() {
  var o = new core.List<api.OperationWarningsData>();
  o.add(buildOperationWarningsData());
  o.add(buildOperationWarningsData());
  return o;
}

checkUnnamed2509(core.List<api.OperationWarningsData> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOperationWarningsData(o[0]);
  checkOperationWarningsData(o[1]);
}

core.int buildCounterOperationWarnings = 0;
buildOperationWarnings() {
  var o = new api.OperationWarnings();
  buildCounterOperationWarnings++;
  if (buildCounterOperationWarnings < 3) {
    o.code = "foo";
    o.data = buildUnnamed2509();
    o.message = "foo";
  }
  buildCounterOperationWarnings--;
  return o;
}

checkOperationWarnings(api.OperationWarnings o) {
  buildCounterOperationWarnings++;
  if (buildCounterOperationWarnings < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    checkUnnamed2509(o.data);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterOperationWarnings--;
}

buildUnnamed2510() {
  var o = new core.List<api.OperationWarnings>();
  o.add(buildOperationWarnings());
  o.add(buildOperationWarnings());
  return o;
}

checkUnnamed2510(core.List<api.OperationWarnings> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOperationWarnings(o[0]);
  checkOperationWarnings(o[1]);
}

core.int buildCounterOperation = 0;
buildOperation() {
  var o = new api.Operation();
  buildCounterOperation++;
  if (buildCounterOperation < 3) {
    o.clientOperationId = "foo";
    o.creationTimestamp = "foo";
    o.description = "foo";
    o.endTime = "foo";
    o.error = buildOperationError();
    o.httpErrorMessage = "foo";
    o.httpErrorStatusCode = 42;
    o.id = "foo";
    o.insertTime = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.operationType = "foo";
    o.progress = 42;
    o.region = "foo";
    o.selfLink = "foo";
    o.startTime = "foo";
    o.status = "foo";
    o.statusMessage = "foo";
    o.targetId = "foo";
    o.targetLink = "foo";
    o.user = "foo";
    o.warnings = buildUnnamed2510();
    o.zone = "foo";
  }
  buildCounterOperation--;
  return o;
}

checkOperation(api.Operation o) {
  buildCounterOperation++;
  if (buildCounterOperation < 3) {
    unittest.expect(o.clientOperationId, unittest.equals('foo'));
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.endTime, unittest.equals('foo'));
    checkOperationError(o.error);
    unittest.expect(o.httpErrorMessage, unittest.equals('foo'));
    unittest.expect(o.httpErrorStatusCode, unittest.equals(42));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.insertTime, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.operationType, unittest.equals('foo'));
    unittest.expect(o.progress, unittest.equals(42));
    unittest.expect(o.region, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
    unittest.expect(o.startTime, unittest.equals('foo'));
    unittest.expect(o.status, unittest.equals('foo'));
    unittest.expect(o.statusMessage, unittest.equals('foo'));
    unittest.expect(o.targetId, unittest.equals('foo'));
    unittest.expect(o.targetLink, unittest.equals('foo'));
    unittest.expect(o.user, unittest.equals('foo'));
    checkUnnamed2510(o.warnings);
    unittest.expect(o.zone, unittest.equals('foo'));
  }
  buildCounterOperation--;
}

buildUnnamed2511() {
  var o = new core.Map<core.String, api.OperationsScopedList>();
  o["x"] = buildOperationsScopedList();
  o["y"] = buildOperationsScopedList();
  return o;
}

checkUnnamed2511(core.Map<core.String, api.OperationsScopedList> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOperationsScopedList(o["x"]);
  checkOperationsScopedList(o["y"]);
}

core.int buildCounterOperationAggregatedList = 0;
buildOperationAggregatedList() {
  var o = new api.OperationAggregatedList();
  buildCounterOperationAggregatedList++;
  if (buildCounterOperationAggregatedList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2511();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterOperationAggregatedList--;
  return o;
}

checkOperationAggregatedList(api.OperationAggregatedList o) {
  buildCounterOperationAggregatedList++;
  if (buildCounterOperationAggregatedList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2511(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterOperationAggregatedList--;
}

buildUnnamed2512() {
  var o = new core.List<api.Operation>();
  o.add(buildOperation());
  o.add(buildOperation());
  return o;
}

checkUnnamed2512(core.List<api.Operation> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOperation(o[0]);
  checkOperation(o[1]);
}

core.int buildCounterOperationList = 0;
buildOperationList() {
  var o = new api.OperationList();
  buildCounterOperationList++;
  if (buildCounterOperationList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2512();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterOperationList--;
  return o;
}

checkOperationList(api.OperationList o) {
  buildCounterOperationList++;
  if (buildCounterOperationList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2512(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterOperationList--;
}

buildUnnamed2513() {
  var o = new core.List<api.Operation>();
  o.add(buildOperation());
  o.add(buildOperation());
  return o;
}

checkUnnamed2513(core.List<api.Operation> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOperation(o[0]);
  checkOperation(o[1]);
}

core.int buildCounterOperationsScopedListWarningData = 0;
buildOperationsScopedListWarningData() {
  var o = new api.OperationsScopedListWarningData();
  buildCounterOperationsScopedListWarningData++;
  if (buildCounterOperationsScopedListWarningData < 3) {
    o.key = "foo";
    o.value = "foo";
  }
  buildCounterOperationsScopedListWarningData--;
  return o;
}

checkOperationsScopedListWarningData(api.OperationsScopedListWarningData o) {
  buildCounterOperationsScopedListWarningData++;
  if (buildCounterOperationsScopedListWarningData < 3) {
    unittest.expect(o.key, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterOperationsScopedListWarningData--;
}

buildUnnamed2514() {
  var o = new core.List<api.OperationsScopedListWarningData>();
  o.add(buildOperationsScopedListWarningData());
  o.add(buildOperationsScopedListWarningData());
  return o;
}

checkUnnamed2514(core.List<api.OperationsScopedListWarningData> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkOperationsScopedListWarningData(o[0]);
  checkOperationsScopedListWarningData(o[1]);
}

core.int buildCounterOperationsScopedListWarning = 0;
buildOperationsScopedListWarning() {
  var o = new api.OperationsScopedListWarning();
  buildCounterOperationsScopedListWarning++;
  if (buildCounterOperationsScopedListWarning < 3) {
    o.code = "foo";
    o.data = buildUnnamed2514();
    o.message = "foo";
  }
  buildCounterOperationsScopedListWarning--;
  return o;
}

checkOperationsScopedListWarning(api.OperationsScopedListWarning o) {
  buildCounterOperationsScopedListWarning++;
  if (buildCounterOperationsScopedListWarning < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    checkUnnamed2514(o.data);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterOperationsScopedListWarning--;
}

core.int buildCounterOperationsScopedList = 0;
buildOperationsScopedList() {
  var o = new api.OperationsScopedList();
  buildCounterOperationsScopedList++;
  if (buildCounterOperationsScopedList < 3) {
    o.operations = buildUnnamed2513();
    o.warning = buildOperationsScopedListWarning();
  }
  buildCounterOperationsScopedList--;
  return o;
}

checkOperationsScopedList(api.OperationsScopedList o) {
  buildCounterOperationsScopedList++;
  if (buildCounterOperationsScopedList < 3) {
    checkUnnamed2513(o.operations);
    checkOperationsScopedListWarning(o.warning);
  }
  buildCounterOperationsScopedList--;
}

buildUnnamed2515() {
  var o = new core.List<api.PathRule>();
  o.add(buildPathRule());
  o.add(buildPathRule());
  return o;
}

checkUnnamed2515(core.List<api.PathRule> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPathRule(o[0]);
  checkPathRule(o[1]);
}

core.int buildCounterPathMatcher = 0;
buildPathMatcher() {
  var o = new api.PathMatcher();
  buildCounterPathMatcher++;
  if (buildCounterPathMatcher < 3) {
    o.defaultService = "foo";
    o.description = "foo";
    o.name = "foo";
    o.pathRules = buildUnnamed2515();
  }
  buildCounterPathMatcher--;
  return o;
}

checkPathMatcher(api.PathMatcher o) {
  buildCounterPathMatcher++;
  if (buildCounterPathMatcher < 3) {
    unittest.expect(o.defaultService, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed2515(o.pathRules);
  }
  buildCounterPathMatcher--;
}

buildUnnamed2516() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2516(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterPathRule = 0;
buildPathRule() {
  var o = new api.PathRule();
  buildCounterPathRule++;
  if (buildCounterPathRule < 3) {
    o.paths = buildUnnamed2516();
    o.service = "foo";
  }
  buildCounterPathRule--;
  return o;
}

checkPathRule(api.PathRule o) {
  buildCounterPathRule++;
  if (buildCounterPathRule < 3) {
    checkUnnamed2516(o.paths);
    unittest.expect(o.service, unittest.equals('foo'));
  }
  buildCounterPathRule--;
}

buildUnnamed2517() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2517(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2518() {
  var o = new core.List<api.Quota>();
  o.add(buildQuota());
  o.add(buildQuota());
  return o;
}

checkUnnamed2518(core.List<api.Quota> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkQuota(o[0]);
  checkQuota(o[1]);
}

core.int buildCounterProject = 0;
buildProject() {
  var o = new api.Project();
  buildCounterProject++;
  if (buildCounterProject < 3) {
    o.commonInstanceMetadata = buildMetadata();
    o.creationTimestamp = "foo";
    o.defaultServiceAccount = "foo";
    o.description = "foo";
    o.enabledFeatures = buildUnnamed2517();
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.quotas = buildUnnamed2518();
    o.selfLink = "foo";
    o.usageExportLocation = buildUsageExportLocation();
  }
  buildCounterProject--;
  return o;
}

checkProject(api.Project o) {
  buildCounterProject++;
  if (buildCounterProject < 3) {
    checkMetadata(o.commonInstanceMetadata);
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.defaultServiceAccount, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    checkUnnamed2517(o.enabledFeatures);
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed2518(o.quotas);
    unittest.expect(o.selfLink, unittest.equals('foo'));
    checkUsageExportLocation(o.usageExportLocation);
  }
  buildCounterProject--;
}

core.int buildCounterQuota = 0;
buildQuota() {
  var o = new api.Quota();
  buildCounterQuota++;
  if (buildCounterQuota < 3) {
    o.limit = 42.0;
    o.metric = "foo";
    o.usage = 42.0;
  }
  buildCounterQuota--;
  return o;
}

checkQuota(api.Quota o) {
  buildCounterQuota++;
  if (buildCounterQuota < 3) {
    unittest.expect(o.limit, unittest.equals(42.0));
    unittest.expect(o.metric, unittest.equals('foo'));
    unittest.expect(o.usage, unittest.equals(42.0));
  }
  buildCounterQuota--;
}

buildUnnamed2519() {
  var o = new core.List<api.Quota>();
  o.add(buildQuota());
  o.add(buildQuota());
  return o;
}

checkUnnamed2519(core.List<api.Quota> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkQuota(o[0]);
  checkQuota(o[1]);
}

buildUnnamed2520() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2520(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterRegion = 0;
buildRegion() {
  var o = new api.Region();
  buildCounterRegion++;
  if (buildCounterRegion < 3) {
    o.creationTimestamp = "foo";
    o.deprecated = buildDeprecationStatus();
    o.description = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.quotas = buildUnnamed2519();
    o.selfLink = "foo";
    o.status = "foo";
    o.zones = buildUnnamed2520();
  }
  buildCounterRegion--;
  return o;
}

checkRegion(api.Region o) {
  buildCounterRegion++;
  if (buildCounterRegion < 3) {
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    checkDeprecationStatus(o.deprecated);
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed2519(o.quotas);
    unittest.expect(o.selfLink, unittest.equals('foo'));
    unittest.expect(o.status, unittest.equals('foo'));
    checkUnnamed2520(o.zones);
  }
  buildCounterRegion--;
}

buildUnnamed2521() {
  var o = new core.List<api.Region>();
  o.add(buildRegion());
  o.add(buildRegion());
  return o;
}

checkUnnamed2521(core.List<api.Region> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRegion(o[0]);
  checkRegion(o[1]);
}

core.int buildCounterRegionList = 0;
buildRegionList() {
  var o = new api.RegionList();
  buildCounterRegionList++;
  if (buildCounterRegionList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2521();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterRegionList--;
  return o;
}

checkRegionList(api.RegionList o) {
  buildCounterRegionList++;
  if (buildCounterRegionList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2521(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterRegionList--;
}

core.int buildCounterResourceGroupReference = 0;
buildResourceGroupReference() {
  var o = new api.ResourceGroupReference();
  buildCounterResourceGroupReference++;
  if (buildCounterResourceGroupReference < 3) {
    o.group = "foo";
  }
  buildCounterResourceGroupReference--;
  return o;
}

checkResourceGroupReference(api.ResourceGroupReference o) {
  buildCounterResourceGroupReference++;
  if (buildCounterResourceGroupReference < 3) {
    unittest.expect(o.group, unittest.equals('foo'));
  }
  buildCounterResourceGroupReference--;
}

buildUnnamed2522() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2522(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterRouteWarningsData = 0;
buildRouteWarningsData() {
  var o = new api.RouteWarningsData();
  buildCounterRouteWarningsData++;
  if (buildCounterRouteWarningsData < 3) {
    o.key = "foo";
    o.value = "foo";
  }
  buildCounterRouteWarningsData--;
  return o;
}

checkRouteWarningsData(api.RouteWarningsData o) {
  buildCounterRouteWarningsData++;
  if (buildCounterRouteWarningsData < 3) {
    unittest.expect(o.key, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterRouteWarningsData--;
}

buildUnnamed2523() {
  var o = new core.List<api.RouteWarningsData>();
  o.add(buildRouteWarningsData());
  o.add(buildRouteWarningsData());
  return o;
}

checkUnnamed2523(core.List<api.RouteWarningsData> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRouteWarningsData(o[0]);
  checkRouteWarningsData(o[1]);
}

core.int buildCounterRouteWarnings = 0;
buildRouteWarnings() {
  var o = new api.RouteWarnings();
  buildCounterRouteWarnings++;
  if (buildCounterRouteWarnings < 3) {
    o.code = "foo";
    o.data = buildUnnamed2523();
    o.message = "foo";
  }
  buildCounterRouteWarnings--;
  return o;
}

checkRouteWarnings(api.RouteWarnings o) {
  buildCounterRouteWarnings++;
  if (buildCounterRouteWarnings < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    checkUnnamed2523(o.data);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterRouteWarnings--;
}

buildUnnamed2524() {
  var o = new core.List<api.RouteWarnings>();
  o.add(buildRouteWarnings());
  o.add(buildRouteWarnings());
  return o;
}

checkUnnamed2524(core.List<api.RouteWarnings> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRouteWarnings(o[0]);
  checkRouteWarnings(o[1]);
}

core.int buildCounterRoute = 0;
buildRoute() {
  var o = new api.Route();
  buildCounterRoute++;
  if (buildCounterRoute < 3) {
    o.creationTimestamp = "foo";
    o.description = "foo";
    o.destRange = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.network = "foo";
    o.nextHopGateway = "foo";
    o.nextHopInstance = "foo";
    o.nextHopIp = "foo";
    o.nextHopNetwork = "foo";
    o.nextHopVpnTunnel = "foo";
    o.priority = 42;
    o.selfLink = "foo";
    o.tags = buildUnnamed2522();
    o.warnings = buildUnnamed2524();
  }
  buildCounterRoute--;
  return o;
}

checkRoute(api.Route o) {
  buildCounterRoute++;
  if (buildCounterRoute < 3) {
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.destRange, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.network, unittest.equals('foo'));
    unittest.expect(o.nextHopGateway, unittest.equals('foo'));
    unittest.expect(o.nextHopInstance, unittest.equals('foo'));
    unittest.expect(o.nextHopIp, unittest.equals('foo'));
    unittest.expect(o.nextHopNetwork, unittest.equals('foo'));
    unittest.expect(o.nextHopVpnTunnel, unittest.equals('foo'));
    unittest.expect(o.priority, unittest.equals(42));
    unittest.expect(o.selfLink, unittest.equals('foo'));
    checkUnnamed2522(o.tags);
    checkUnnamed2524(o.warnings);
  }
  buildCounterRoute--;
}

buildUnnamed2525() {
  var o = new core.List<api.Route>();
  o.add(buildRoute());
  o.add(buildRoute());
  return o;
}

checkUnnamed2525(core.List<api.Route> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRoute(o[0]);
  checkRoute(o[1]);
}

core.int buildCounterRouteList = 0;
buildRouteList() {
  var o = new api.RouteList();
  buildCounterRouteList++;
  if (buildCounterRouteList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2525();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterRouteList--;
  return o;
}

checkRouteList(api.RouteList o) {
  buildCounterRouteList++;
  if (buildCounterRouteList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2525(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterRouteList--;
}

buildUnnamed2526() {
  var o = new core.List<api.RouterBgpPeer>();
  o.add(buildRouterBgpPeer());
  o.add(buildRouterBgpPeer());
  return o;
}

checkUnnamed2526(core.List<api.RouterBgpPeer> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRouterBgpPeer(o[0]);
  checkRouterBgpPeer(o[1]);
}

buildUnnamed2527() {
  var o = new core.List<api.RouterInterface>();
  o.add(buildRouterInterface());
  o.add(buildRouterInterface());
  return o;
}

checkUnnamed2527(core.List<api.RouterInterface> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRouterInterface(o[0]);
  checkRouterInterface(o[1]);
}

core.int buildCounterRouter = 0;
buildRouter() {
  var o = new api.Router();
  buildCounterRouter++;
  if (buildCounterRouter < 3) {
    o.bgp = buildRouterBgp();
    o.bgpPeers = buildUnnamed2526();
    o.creationTimestamp = "foo";
    o.description = "foo";
    o.id = "foo";
    o.interfaces = buildUnnamed2527();
    o.kind = "foo";
    o.name = "foo";
    o.network = "foo";
    o.region = "foo";
    o.selfLink = "foo";
  }
  buildCounterRouter--;
  return o;
}

checkRouter(api.Router o) {
  buildCounterRouter++;
  if (buildCounterRouter < 3) {
    checkRouterBgp(o.bgp);
    checkUnnamed2526(o.bgpPeers);
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2527(o.interfaces);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.network, unittest.equals('foo'));
    unittest.expect(o.region, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterRouter--;
}

buildUnnamed2528() {
  var o = new core.Map<core.String, api.RoutersScopedList>();
  o["x"] = buildRoutersScopedList();
  o["y"] = buildRoutersScopedList();
  return o;
}

checkUnnamed2528(core.Map<core.String, api.RoutersScopedList> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRoutersScopedList(o["x"]);
  checkRoutersScopedList(o["y"]);
}

core.int buildCounterRouterAggregatedList = 0;
buildRouterAggregatedList() {
  var o = new api.RouterAggregatedList();
  buildCounterRouterAggregatedList++;
  if (buildCounterRouterAggregatedList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2528();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterRouterAggregatedList--;
  return o;
}

checkRouterAggregatedList(api.RouterAggregatedList o) {
  buildCounterRouterAggregatedList++;
  if (buildCounterRouterAggregatedList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2528(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterRouterAggregatedList--;
}

core.int buildCounterRouterBgp = 0;
buildRouterBgp() {
  var o = new api.RouterBgp();
  buildCounterRouterBgp++;
  if (buildCounterRouterBgp < 3) {
    o.asn = 42;
  }
  buildCounterRouterBgp--;
  return o;
}

checkRouterBgp(api.RouterBgp o) {
  buildCounterRouterBgp++;
  if (buildCounterRouterBgp < 3) {
    unittest.expect(o.asn, unittest.equals(42));
  }
  buildCounterRouterBgp--;
}

core.int buildCounterRouterBgpPeer = 0;
buildRouterBgpPeer() {
  var o = new api.RouterBgpPeer();
  buildCounterRouterBgpPeer++;
  if (buildCounterRouterBgpPeer < 3) {
    o.advertisedRoutePriority = 42;
    o.interfaceName = "foo";
    o.ipAddress = "foo";
    o.name = "foo";
    o.peerAsn = 42;
    o.peerIpAddress = "foo";
  }
  buildCounterRouterBgpPeer--;
  return o;
}

checkRouterBgpPeer(api.RouterBgpPeer o) {
  buildCounterRouterBgpPeer++;
  if (buildCounterRouterBgpPeer < 3) {
    unittest.expect(o.advertisedRoutePriority, unittest.equals(42));
    unittest.expect(o.interfaceName, unittest.equals('foo'));
    unittest.expect(o.ipAddress, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.peerAsn, unittest.equals(42));
    unittest.expect(o.peerIpAddress, unittest.equals('foo'));
  }
  buildCounterRouterBgpPeer--;
}

core.int buildCounterRouterInterface = 0;
buildRouterInterface() {
  var o = new api.RouterInterface();
  buildCounterRouterInterface++;
  if (buildCounterRouterInterface < 3) {
    o.ipRange = "foo";
    o.linkedVpnTunnel = "foo";
    o.name = "foo";
  }
  buildCounterRouterInterface--;
  return o;
}

checkRouterInterface(api.RouterInterface o) {
  buildCounterRouterInterface++;
  if (buildCounterRouterInterface < 3) {
    unittest.expect(o.ipRange, unittest.equals('foo'));
    unittest.expect(o.linkedVpnTunnel, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
  }
  buildCounterRouterInterface--;
}

buildUnnamed2529() {
  var o = new core.List<api.Router>();
  o.add(buildRouter());
  o.add(buildRouter());
  return o;
}

checkUnnamed2529(core.List<api.Router> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRouter(o[0]);
  checkRouter(o[1]);
}

core.int buildCounterRouterList = 0;
buildRouterList() {
  var o = new api.RouterList();
  buildCounterRouterList++;
  if (buildCounterRouterList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2529();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterRouterList--;
  return o;
}

checkRouterList(api.RouterList o) {
  buildCounterRouterList++;
  if (buildCounterRouterList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2529(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterRouterList--;
}

buildUnnamed2530() {
  var o = new core.List<api.Route>();
  o.add(buildRoute());
  o.add(buildRoute());
  return o;
}

checkUnnamed2530(core.List<api.Route> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRoute(o[0]);
  checkRoute(o[1]);
}

buildUnnamed2531() {
  var o = new core.List<api.RouterStatusBgpPeerStatus>();
  o.add(buildRouterStatusBgpPeerStatus());
  o.add(buildRouterStatusBgpPeerStatus());
  return o;
}

checkUnnamed2531(core.List<api.RouterStatusBgpPeerStatus> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRouterStatusBgpPeerStatus(o[0]);
  checkRouterStatusBgpPeerStatus(o[1]);
}

core.int buildCounterRouterStatus = 0;
buildRouterStatus() {
  var o = new api.RouterStatus();
  buildCounterRouterStatus++;
  if (buildCounterRouterStatus < 3) {
    o.bestRoutes = buildUnnamed2530();
    o.bgpPeerStatus = buildUnnamed2531();
    o.network = "foo";
  }
  buildCounterRouterStatus--;
  return o;
}

checkRouterStatus(api.RouterStatus o) {
  buildCounterRouterStatus++;
  if (buildCounterRouterStatus < 3) {
    checkUnnamed2530(o.bestRoutes);
    checkUnnamed2531(o.bgpPeerStatus);
    unittest.expect(o.network, unittest.equals('foo'));
  }
  buildCounterRouterStatus--;
}

buildUnnamed2532() {
  var o = new core.List<api.Route>();
  o.add(buildRoute());
  o.add(buildRoute());
  return o;
}

checkUnnamed2532(core.List<api.Route> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRoute(o[0]);
  checkRoute(o[1]);
}

core.int buildCounterRouterStatusBgpPeerStatus = 0;
buildRouterStatusBgpPeerStatus() {
  var o = new api.RouterStatusBgpPeerStatus();
  buildCounterRouterStatusBgpPeerStatus++;
  if (buildCounterRouterStatusBgpPeerStatus < 3) {
    o.advertisedRoutes = buildUnnamed2532();
    o.ipAddress = "foo";
    o.linkedVpnTunnel = "foo";
    o.name = "foo";
    o.numLearnedRoutes = 42;
    o.peerIpAddress = "foo";
    o.state = "foo";
    o.status = "foo";
    o.uptime = "foo";
    o.uptimeSeconds = "foo";
  }
  buildCounterRouterStatusBgpPeerStatus--;
  return o;
}

checkRouterStatusBgpPeerStatus(api.RouterStatusBgpPeerStatus o) {
  buildCounterRouterStatusBgpPeerStatus++;
  if (buildCounterRouterStatusBgpPeerStatus < 3) {
    checkUnnamed2532(o.advertisedRoutes);
    unittest.expect(o.ipAddress, unittest.equals('foo'));
    unittest.expect(o.linkedVpnTunnel, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.numLearnedRoutes, unittest.equals(42));
    unittest.expect(o.peerIpAddress, unittest.equals('foo'));
    unittest.expect(o.state, unittest.equals('foo'));
    unittest.expect(o.status, unittest.equals('foo'));
    unittest.expect(o.uptime, unittest.equals('foo'));
    unittest.expect(o.uptimeSeconds, unittest.equals('foo'));
  }
  buildCounterRouterStatusBgpPeerStatus--;
}

core.int buildCounterRouterStatusResponse = 0;
buildRouterStatusResponse() {
  var o = new api.RouterStatusResponse();
  buildCounterRouterStatusResponse++;
  if (buildCounterRouterStatusResponse < 3) {
    o.kind = "foo";
    o.result = buildRouterStatus();
  }
  buildCounterRouterStatusResponse--;
  return o;
}

checkRouterStatusResponse(api.RouterStatusResponse o) {
  buildCounterRouterStatusResponse++;
  if (buildCounterRouterStatusResponse < 3) {
    unittest.expect(o.kind, unittest.equals('foo'));
    checkRouterStatus(o.result);
  }
  buildCounterRouterStatusResponse--;
}

core.int buildCounterRoutersPreviewResponse = 0;
buildRoutersPreviewResponse() {
  var o = new api.RoutersPreviewResponse();
  buildCounterRoutersPreviewResponse++;
  if (buildCounterRoutersPreviewResponse < 3) {
    o.resource = buildRouter();
  }
  buildCounterRoutersPreviewResponse--;
  return o;
}

checkRoutersPreviewResponse(api.RoutersPreviewResponse o) {
  buildCounterRoutersPreviewResponse++;
  if (buildCounterRoutersPreviewResponse < 3) {
    checkRouter(o.resource);
  }
  buildCounterRoutersPreviewResponse--;
}

buildUnnamed2533() {
  var o = new core.List<api.Router>();
  o.add(buildRouter());
  o.add(buildRouter());
  return o;
}

checkUnnamed2533(core.List<api.Router> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRouter(o[0]);
  checkRouter(o[1]);
}

core.int buildCounterRoutersScopedListWarningData = 0;
buildRoutersScopedListWarningData() {
  var o = new api.RoutersScopedListWarningData();
  buildCounterRoutersScopedListWarningData++;
  if (buildCounterRoutersScopedListWarningData < 3) {
    o.key = "foo";
    o.value = "foo";
  }
  buildCounterRoutersScopedListWarningData--;
  return o;
}

checkRoutersScopedListWarningData(api.RoutersScopedListWarningData o) {
  buildCounterRoutersScopedListWarningData++;
  if (buildCounterRoutersScopedListWarningData < 3) {
    unittest.expect(o.key, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterRoutersScopedListWarningData--;
}

buildUnnamed2534() {
  var o = new core.List<api.RoutersScopedListWarningData>();
  o.add(buildRoutersScopedListWarningData());
  o.add(buildRoutersScopedListWarningData());
  return o;
}

checkUnnamed2534(core.List<api.RoutersScopedListWarningData> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkRoutersScopedListWarningData(o[0]);
  checkRoutersScopedListWarningData(o[1]);
}

core.int buildCounterRoutersScopedListWarning = 0;
buildRoutersScopedListWarning() {
  var o = new api.RoutersScopedListWarning();
  buildCounterRoutersScopedListWarning++;
  if (buildCounterRoutersScopedListWarning < 3) {
    o.code = "foo";
    o.data = buildUnnamed2534();
    o.message = "foo";
  }
  buildCounterRoutersScopedListWarning--;
  return o;
}

checkRoutersScopedListWarning(api.RoutersScopedListWarning o) {
  buildCounterRoutersScopedListWarning++;
  if (buildCounterRoutersScopedListWarning < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    checkUnnamed2534(o.data);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterRoutersScopedListWarning--;
}

core.int buildCounterRoutersScopedList = 0;
buildRoutersScopedList() {
  var o = new api.RoutersScopedList();
  buildCounterRoutersScopedList++;
  if (buildCounterRoutersScopedList < 3) {
    o.routers = buildUnnamed2533();
    o.warning = buildRoutersScopedListWarning();
  }
  buildCounterRoutersScopedList--;
  return o;
}

checkRoutersScopedList(api.RoutersScopedList o) {
  buildCounterRoutersScopedList++;
  if (buildCounterRoutersScopedList < 3) {
    checkUnnamed2533(o.routers);
    checkRoutersScopedListWarning(o.warning);
  }
  buildCounterRoutersScopedList--;
}

core.int buildCounterScheduling = 0;
buildScheduling() {
  var o = new api.Scheduling();
  buildCounterScheduling++;
  if (buildCounterScheduling < 3) {
    o.automaticRestart = true;
    o.onHostMaintenance = "foo";
    o.preemptible = true;
  }
  buildCounterScheduling--;
  return o;
}

checkScheduling(api.Scheduling o) {
  buildCounterScheduling++;
  if (buildCounterScheduling < 3) {
    unittest.expect(o.automaticRestart, unittest.isTrue);
    unittest.expect(o.onHostMaintenance, unittest.equals('foo'));
    unittest.expect(o.preemptible, unittest.isTrue);
  }
  buildCounterScheduling--;
}

core.int buildCounterSerialPortOutput = 0;
buildSerialPortOutput() {
  var o = new api.SerialPortOutput();
  buildCounterSerialPortOutput++;
  if (buildCounterSerialPortOutput < 3) {
    o.contents = "foo";
    o.kind = "foo";
    o.selfLink = "foo";
  }
  buildCounterSerialPortOutput--;
  return o;
}

checkSerialPortOutput(api.SerialPortOutput o) {
  buildCounterSerialPortOutput++;
  if (buildCounterSerialPortOutput < 3) {
    unittest.expect(o.contents, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterSerialPortOutput--;
}

buildUnnamed2535() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2535(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterServiceAccount = 0;
buildServiceAccount() {
  var o = new api.ServiceAccount();
  buildCounterServiceAccount++;
  if (buildCounterServiceAccount < 3) {
    o.email = "foo";
    o.scopes = buildUnnamed2535();
  }
  buildCounterServiceAccount--;
  return o;
}

checkServiceAccount(api.ServiceAccount o) {
  buildCounterServiceAccount++;
  if (buildCounterServiceAccount < 3) {
    unittest.expect(o.email, unittest.equals('foo'));
    checkUnnamed2535(o.scopes);
  }
  buildCounterServiceAccount--;
}

buildUnnamed2536() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2536(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterSnapshot = 0;
buildSnapshot() {
  var o = new api.Snapshot();
  buildCounterSnapshot++;
  if (buildCounterSnapshot < 3) {
    o.creationTimestamp = "foo";
    o.description = "foo";
    o.diskSizeGb = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.licenses = buildUnnamed2536();
    o.name = "foo";
    o.selfLink = "foo";
    o.snapshotEncryptionKey = buildCustomerEncryptionKey();
    o.sourceDisk = "foo";
    o.sourceDiskEncryptionKey = buildCustomerEncryptionKey();
    o.sourceDiskId = "foo";
    o.status = "foo";
    o.storageBytes = "foo";
    o.storageBytesStatus = "foo";
  }
  buildCounterSnapshot--;
  return o;
}

checkSnapshot(api.Snapshot o) {
  buildCounterSnapshot++;
  if (buildCounterSnapshot < 3) {
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.diskSizeGb, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed2536(o.licenses);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
    checkCustomerEncryptionKey(o.snapshotEncryptionKey);
    unittest.expect(o.sourceDisk, unittest.equals('foo'));
    checkCustomerEncryptionKey(o.sourceDiskEncryptionKey);
    unittest.expect(o.sourceDiskId, unittest.equals('foo'));
    unittest.expect(o.status, unittest.equals('foo'));
    unittest.expect(o.storageBytes, unittest.equals('foo'));
    unittest.expect(o.storageBytesStatus, unittest.equals('foo'));
  }
  buildCounterSnapshot--;
}

buildUnnamed2537() {
  var o = new core.List<api.Snapshot>();
  o.add(buildSnapshot());
  o.add(buildSnapshot());
  return o;
}

checkUnnamed2537(core.List<api.Snapshot> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSnapshot(o[0]);
  checkSnapshot(o[1]);
}

core.int buildCounterSnapshotList = 0;
buildSnapshotList() {
  var o = new api.SnapshotList();
  buildCounterSnapshotList++;
  if (buildCounterSnapshotList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2537();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterSnapshotList--;
  return o;
}

checkSnapshotList(api.SnapshotList o) {
  buildCounterSnapshotList++;
  if (buildCounterSnapshotList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2537(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterSnapshotList--;
}

core.int buildCounterSslCertificate = 0;
buildSslCertificate() {
  var o = new api.SslCertificate();
  buildCounterSslCertificate++;
  if (buildCounterSslCertificate < 3) {
    o.certificate = "foo";
    o.creationTimestamp = "foo";
    o.description = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.privateKey = "foo";
    o.selfLink = "foo";
  }
  buildCounterSslCertificate--;
  return o;
}

checkSslCertificate(api.SslCertificate o) {
  buildCounterSslCertificate++;
  if (buildCounterSslCertificate < 3) {
    unittest.expect(o.certificate, unittest.equals('foo'));
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.privateKey, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterSslCertificate--;
}

buildUnnamed2538() {
  var o = new core.List<api.SslCertificate>();
  o.add(buildSslCertificate());
  o.add(buildSslCertificate());
  return o;
}

checkUnnamed2538(core.List<api.SslCertificate> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSslCertificate(o[0]);
  checkSslCertificate(o[1]);
}

core.int buildCounterSslCertificateList = 0;
buildSslCertificateList() {
  var o = new api.SslCertificateList();
  buildCounterSslCertificateList++;
  if (buildCounterSslCertificateList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2538();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterSslCertificateList--;
  return o;
}

checkSslCertificateList(api.SslCertificateList o) {
  buildCounterSslCertificateList++;
  if (buildCounterSslCertificateList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2538(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterSslCertificateList--;
}

core.int buildCounterSubnetwork = 0;
buildSubnetwork() {
  var o = new api.Subnetwork();
  buildCounterSubnetwork++;
  if (buildCounterSubnetwork < 3) {
    o.creationTimestamp = "foo";
    o.description = "foo";
    o.gatewayAddress = "foo";
    o.id = "foo";
    o.ipCidrRange = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.network = "foo";
    o.region = "foo";
    o.selfLink = "foo";
  }
  buildCounterSubnetwork--;
  return o;
}

checkSubnetwork(api.Subnetwork o) {
  buildCounterSubnetwork++;
  if (buildCounterSubnetwork < 3) {
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.gatewayAddress, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.ipCidrRange, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.network, unittest.equals('foo'));
    unittest.expect(o.region, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterSubnetwork--;
}

buildUnnamed2539() {
  var o = new core.Map<core.String, api.SubnetworksScopedList>();
  o["x"] = buildSubnetworksScopedList();
  o["y"] = buildSubnetworksScopedList();
  return o;
}

checkUnnamed2539(core.Map<core.String, api.SubnetworksScopedList> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSubnetworksScopedList(o["x"]);
  checkSubnetworksScopedList(o["y"]);
}

core.int buildCounterSubnetworkAggregatedList = 0;
buildSubnetworkAggregatedList() {
  var o = new api.SubnetworkAggregatedList();
  buildCounterSubnetworkAggregatedList++;
  if (buildCounterSubnetworkAggregatedList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2539();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterSubnetworkAggregatedList--;
  return o;
}

checkSubnetworkAggregatedList(api.SubnetworkAggregatedList o) {
  buildCounterSubnetworkAggregatedList++;
  if (buildCounterSubnetworkAggregatedList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2539(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterSubnetworkAggregatedList--;
}

buildUnnamed2540() {
  var o = new core.List<api.Subnetwork>();
  o.add(buildSubnetwork());
  o.add(buildSubnetwork());
  return o;
}

checkUnnamed2540(core.List<api.Subnetwork> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSubnetwork(o[0]);
  checkSubnetwork(o[1]);
}

core.int buildCounterSubnetworkList = 0;
buildSubnetworkList() {
  var o = new api.SubnetworkList();
  buildCounterSubnetworkList++;
  if (buildCounterSubnetworkList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2540();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterSubnetworkList--;
  return o;
}

checkSubnetworkList(api.SubnetworkList o) {
  buildCounterSubnetworkList++;
  if (buildCounterSubnetworkList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2540(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterSubnetworkList--;
}

buildUnnamed2541() {
  var o = new core.List<api.Subnetwork>();
  o.add(buildSubnetwork());
  o.add(buildSubnetwork());
  return o;
}

checkUnnamed2541(core.List<api.Subnetwork> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSubnetwork(o[0]);
  checkSubnetwork(o[1]);
}

core.int buildCounterSubnetworksScopedListWarningData = 0;
buildSubnetworksScopedListWarningData() {
  var o = new api.SubnetworksScopedListWarningData();
  buildCounterSubnetworksScopedListWarningData++;
  if (buildCounterSubnetworksScopedListWarningData < 3) {
    o.key = "foo";
    o.value = "foo";
  }
  buildCounterSubnetworksScopedListWarningData--;
  return o;
}

checkSubnetworksScopedListWarningData(api.SubnetworksScopedListWarningData o) {
  buildCounterSubnetworksScopedListWarningData++;
  if (buildCounterSubnetworksScopedListWarningData < 3) {
    unittest.expect(o.key, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterSubnetworksScopedListWarningData--;
}

buildUnnamed2542() {
  var o = new core.List<api.SubnetworksScopedListWarningData>();
  o.add(buildSubnetworksScopedListWarningData());
  o.add(buildSubnetworksScopedListWarningData());
  return o;
}

checkUnnamed2542(core.List<api.SubnetworksScopedListWarningData> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkSubnetworksScopedListWarningData(o[0]);
  checkSubnetworksScopedListWarningData(o[1]);
}

core.int buildCounterSubnetworksScopedListWarning = 0;
buildSubnetworksScopedListWarning() {
  var o = new api.SubnetworksScopedListWarning();
  buildCounterSubnetworksScopedListWarning++;
  if (buildCounterSubnetworksScopedListWarning < 3) {
    o.code = "foo";
    o.data = buildUnnamed2542();
    o.message = "foo";
  }
  buildCounterSubnetworksScopedListWarning--;
  return o;
}

checkSubnetworksScopedListWarning(api.SubnetworksScopedListWarning o) {
  buildCounterSubnetworksScopedListWarning++;
  if (buildCounterSubnetworksScopedListWarning < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    checkUnnamed2542(o.data);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterSubnetworksScopedListWarning--;
}

core.int buildCounterSubnetworksScopedList = 0;
buildSubnetworksScopedList() {
  var o = new api.SubnetworksScopedList();
  buildCounterSubnetworksScopedList++;
  if (buildCounterSubnetworksScopedList < 3) {
    o.subnetworks = buildUnnamed2541();
    o.warning = buildSubnetworksScopedListWarning();
  }
  buildCounterSubnetworksScopedList--;
  return o;
}

checkSubnetworksScopedList(api.SubnetworksScopedList o) {
  buildCounterSubnetworksScopedList++;
  if (buildCounterSubnetworksScopedList < 3) {
    checkUnnamed2541(o.subnetworks);
    checkSubnetworksScopedListWarning(o.warning);
  }
  buildCounterSubnetworksScopedList--;
}

buildUnnamed2543() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2543(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterTags = 0;
buildTags() {
  var o = new api.Tags();
  buildCounterTags++;
  if (buildCounterTags < 3) {
    o.fingerprint = "foo";
    o.items = buildUnnamed2543();
  }
  buildCounterTags--;
  return o;
}

checkTags(api.Tags o) {
  buildCounterTags++;
  if (buildCounterTags < 3) {
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    checkUnnamed2543(o.items);
  }
  buildCounterTags--;
}

core.int buildCounterTargetHttpProxy = 0;
buildTargetHttpProxy() {
  var o = new api.TargetHttpProxy();
  buildCounterTargetHttpProxy++;
  if (buildCounterTargetHttpProxy < 3) {
    o.creationTimestamp = "foo";
    o.description = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.selfLink = "foo";
    o.urlMap = "foo";
  }
  buildCounterTargetHttpProxy--;
  return o;
}

checkTargetHttpProxy(api.TargetHttpProxy o) {
  buildCounterTargetHttpProxy++;
  if (buildCounterTargetHttpProxy < 3) {
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
    unittest.expect(o.urlMap, unittest.equals('foo'));
  }
  buildCounterTargetHttpProxy--;
}

buildUnnamed2544() {
  var o = new core.List<api.TargetHttpProxy>();
  o.add(buildTargetHttpProxy());
  o.add(buildTargetHttpProxy());
  return o;
}

checkUnnamed2544(core.List<api.TargetHttpProxy> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTargetHttpProxy(o[0]);
  checkTargetHttpProxy(o[1]);
}

core.int buildCounterTargetHttpProxyList = 0;
buildTargetHttpProxyList() {
  var o = new api.TargetHttpProxyList();
  buildCounterTargetHttpProxyList++;
  if (buildCounterTargetHttpProxyList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2544();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterTargetHttpProxyList--;
  return o;
}

checkTargetHttpProxyList(api.TargetHttpProxyList o) {
  buildCounterTargetHttpProxyList++;
  if (buildCounterTargetHttpProxyList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2544(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterTargetHttpProxyList--;
}

buildUnnamed2545() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2545(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterTargetHttpsProxiesSetSslCertificatesRequest = 0;
buildTargetHttpsProxiesSetSslCertificatesRequest() {
  var o = new api.TargetHttpsProxiesSetSslCertificatesRequest();
  buildCounterTargetHttpsProxiesSetSslCertificatesRequest++;
  if (buildCounterTargetHttpsProxiesSetSslCertificatesRequest < 3) {
    o.sslCertificates = buildUnnamed2545();
  }
  buildCounterTargetHttpsProxiesSetSslCertificatesRequest--;
  return o;
}

checkTargetHttpsProxiesSetSslCertificatesRequest(api.TargetHttpsProxiesSetSslCertificatesRequest o) {
  buildCounterTargetHttpsProxiesSetSslCertificatesRequest++;
  if (buildCounterTargetHttpsProxiesSetSslCertificatesRequest < 3) {
    checkUnnamed2545(o.sslCertificates);
  }
  buildCounterTargetHttpsProxiesSetSslCertificatesRequest--;
}

buildUnnamed2546() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2546(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterTargetHttpsProxy = 0;
buildTargetHttpsProxy() {
  var o = new api.TargetHttpsProxy();
  buildCounterTargetHttpsProxy++;
  if (buildCounterTargetHttpsProxy < 3) {
    o.creationTimestamp = "foo";
    o.description = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.selfLink = "foo";
    o.sslCertificates = buildUnnamed2546();
    o.urlMap = "foo";
  }
  buildCounterTargetHttpsProxy--;
  return o;
}

checkTargetHttpsProxy(api.TargetHttpsProxy o) {
  buildCounterTargetHttpsProxy++;
  if (buildCounterTargetHttpsProxy < 3) {
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
    checkUnnamed2546(o.sslCertificates);
    unittest.expect(o.urlMap, unittest.equals('foo'));
  }
  buildCounterTargetHttpsProxy--;
}

buildUnnamed2547() {
  var o = new core.List<api.TargetHttpsProxy>();
  o.add(buildTargetHttpsProxy());
  o.add(buildTargetHttpsProxy());
  return o;
}

checkUnnamed2547(core.List<api.TargetHttpsProxy> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTargetHttpsProxy(o[0]);
  checkTargetHttpsProxy(o[1]);
}

core.int buildCounterTargetHttpsProxyList = 0;
buildTargetHttpsProxyList() {
  var o = new api.TargetHttpsProxyList();
  buildCounterTargetHttpsProxyList++;
  if (buildCounterTargetHttpsProxyList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2547();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterTargetHttpsProxyList--;
  return o;
}

checkTargetHttpsProxyList(api.TargetHttpsProxyList o) {
  buildCounterTargetHttpsProxyList++;
  if (buildCounterTargetHttpsProxyList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2547(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterTargetHttpsProxyList--;
}

core.int buildCounterTargetInstance = 0;
buildTargetInstance() {
  var o = new api.TargetInstance();
  buildCounterTargetInstance++;
  if (buildCounterTargetInstance < 3) {
    o.creationTimestamp = "foo";
    o.description = "foo";
    o.id = "foo";
    o.instance = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.natPolicy = "foo";
    o.selfLink = "foo";
    o.zone = "foo";
  }
  buildCounterTargetInstance--;
  return o;
}

checkTargetInstance(api.TargetInstance o) {
  buildCounterTargetInstance++;
  if (buildCounterTargetInstance < 3) {
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.instance, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.natPolicy, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
    unittest.expect(o.zone, unittest.equals('foo'));
  }
  buildCounterTargetInstance--;
}

buildUnnamed2548() {
  var o = new core.Map<core.String, api.TargetInstancesScopedList>();
  o["x"] = buildTargetInstancesScopedList();
  o["y"] = buildTargetInstancesScopedList();
  return o;
}

checkUnnamed2548(core.Map<core.String, api.TargetInstancesScopedList> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTargetInstancesScopedList(o["x"]);
  checkTargetInstancesScopedList(o["y"]);
}

core.int buildCounterTargetInstanceAggregatedList = 0;
buildTargetInstanceAggregatedList() {
  var o = new api.TargetInstanceAggregatedList();
  buildCounterTargetInstanceAggregatedList++;
  if (buildCounterTargetInstanceAggregatedList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2548();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterTargetInstanceAggregatedList--;
  return o;
}

checkTargetInstanceAggregatedList(api.TargetInstanceAggregatedList o) {
  buildCounterTargetInstanceAggregatedList++;
  if (buildCounterTargetInstanceAggregatedList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2548(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterTargetInstanceAggregatedList--;
}

buildUnnamed2549() {
  var o = new core.List<api.TargetInstance>();
  o.add(buildTargetInstance());
  o.add(buildTargetInstance());
  return o;
}

checkUnnamed2549(core.List<api.TargetInstance> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTargetInstance(o[0]);
  checkTargetInstance(o[1]);
}

core.int buildCounterTargetInstanceList = 0;
buildTargetInstanceList() {
  var o = new api.TargetInstanceList();
  buildCounterTargetInstanceList++;
  if (buildCounterTargetInstanceList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2549();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterTargetInstanceList--;
  return o;
}

checkTargetInstanceList(api.TargetInstanceList o) {
  buildCounterTargetInstanceList++;
  if (buildCounterTargetInstanceList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2549(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterTargetInstanceList--;
}

buildUnnamed2550() {
  var o = new core.List<api.TargetInstance>();
  o.add(buildTargetInstance());
  o.add(buildTargetInstance());
  return o;
}

checkUnnamed2550(core.List<api.TargetInstance> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTargetInstance(o[0]);
  checkTargetInstance(o[1]);
}

core.int buildCounterTargetInstancesScopedListWarningData = 0;
buildTargetInstancesScopedListWarningData() {
  var o = new api.TargetInstancesScopedListWarningData();
  buildCounterTargetInstancesScopedListWarningData++;
  if (buildCounterTargetInstancesScopedListWarningData < 3) {
    o.key = "foo";
    o.value = "foo";
  }
  buildCounterTargetInstancesScopedListWarningData--;
  return o;
}

checkTargetInstancesScopedListWarningData(api.TargetInstancesScopedListWarningData o) {
  buildCounterTargetInstancesScopedListWarningData++;
  if (buildCounterTargetInstancesScopedListWarningData < 3) {
    unittest.expect(o.key, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterTargetInstancesScopedListWarningData--;
}

buildUnnamed2551() {
  var o = new core.List<api.TargetInstancesScopedListWarningData>();
  o.add(buildTargetInstancesScopedListWarningData());
  o.add(buildTargetInstancesScopedListWarningData());
  return o;
}

checkUnnamed2551(core.List<api.TargetInstancesScopedListWarningData> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTargetInstancesScopedListWarningData(o[0]);
  checkTargetInstancesScopedListWarningData(o[1]);
}

core.int buildCounterTargetInstancesScopedListWarning = 0;
buildTargetInstancesScopedListWarning() {
  var o = new api.TargetInstancesScopedListWarning();
  buildCounterTargetInstancesScopedListWarning++;
  if (buildCounterTargetInstancesScopedListWarning < 3) {
    o.code = "foo";
    o.data = buildUnnamed2551();
    o.message = "foo";
  }
  buildCounterTargetInstancesScopedListWarning--;
  return o;
}

checkTargetInstancesScopedListWarning(api.TargetInstancesScopedListWarning o) {
  buildCounterTargetInstancesScopedListWarning++;
  if (buildCounterTargetInstancesScopedListWarning < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    checkUnnamed2551(o.data);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterTargetInstancesScopedListWarning--;
}

core.int buildCounterTargetInstancesScopedList = 0;
buildTargetInstancesScopedList() {
  var o = new api.TargetInstancesScopedList();
  buildCounterTargetInstancesScopedList++;
  if (buildCounterTargetInstancesScopedList < 3) {
    o.targetInstances = buildUnnamed2550();
    o.warning = buildTargetInstancesScopedListWarning();
  }
  buildCounterTargetInstancesScopedList--;
  return o;
}

checkTargetInstancesScopedList(api.TargetInstancesScopedList o) {
  buildCounterTargetInstancesScopedList++;
  if (buildCounterTargetInstancesScopedList < 3) {
    checkUnnamed2550(o.targetInstances);
    checkTargetInstancesScopedListWarning(o.warning);
  }
  buildCounterTargetInstancesScopedList--;
}

buildUnnamed2552() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2552(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2553() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2553(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterTargetPool = 0;
buildTargetPool() {
  var o = new api.TargetPool();
  buildCounterTargetPool++;
  if (buildCounterTargetPool < 3) {
    o.backupPool = "foo";
    o.creationTimestamp = "foo";
    o.description = "foo";
    o.failoverRatio = 42.0;
    o.healthChecks = buildUnnamed2552();
    o.id = "foo";
    o.instances = buildUnnamed2553();
    o.kind = "foo";
    o.name = "foo";
    o.region = "foo";
    o.selfLink = "foo";
    o.sessionAffinity = "foo";
  }
  buildCounterTargetPool--;
  return o;
}

checkTargetPool(api.TargetPool o) {
  buildCounterTargetPool++;
  if (buildCounterTargetPool < 3) {
    unittest.expect(o.backupPool, unittest.equals('foo'));
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.failoverRatio, unittest.equals(42.0));
    checkUnnamed2552(o.healthChecks);
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2553(o.instances);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.region, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
    unittest.expect(o.sessionAffinity, unittest.equals('foo'));
  }
  buildCounterTargetPool--;
}

buildUnnamed2554() {
  var o = new core.Map<core.String, api.TargetPoolsScopedList>();
  o["x"] = buildTargetPoolsScopedList();
  o["y"] = buildTargetPoolsScopedList();
  return o;
}

checkUnnamed2554(core.Map<core.String, api.TargetPoolsScopedList> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTargetPoolsScopedList(o["x"]);
  checkTargetPoolsScopedList(o["y"]);
}

core.int buildCounterTargetPoolAggregatedList = 0;
buildTargetPoolAggregatedList() {
  var o = new api.TargetPoolAggregatedList();
  buildCounterTargetPoolAggregatedList++;
  if (buildCounterTargetPoolAggregatedList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2554();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterTargetPoolAggregatedList--;
  return o;
}

checkTargetPoolAggregatedList(api.TargetPoolAggregatedList o) {
  buildCounterTargetPoolAggregatedList++;
  if (buildCounterTargetPoolAggregatedList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2554(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterTargetPoolAggregatedList--;
}

buildUnnamed2555() {
  var o = new core.List<api.HealthStatus>();
  o.add(buildHealthStatus());
  o.add(buildHealthStatus());
  return o;
}

checkUnnamed2555(core.List<api.HealthStatus> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkHealthStatus(o[0]);
  checkHealthStatus(o[1]);
}

core.int buildCounterTargetPoolInstanceHealth = 0;
buildTargetPoolInstanceHealth() {
  var o = new api.TargetPoolInstanceHealth();
  buildCounterTargetPoolInstanceHealth++;
  if (buildCounterTargetPoolInstanceHealth < 3) {
    o.healthStatus = buildUnnamed2555();
    o.kind = "foo";
  }
  buildCounterTargetPoolInstanceHealth--;
  return o;
}

checkTargetPoolInstanceHealth(api.TargetPoolInstanceHealth o) {
  buildCounterTargetPoolInstanceHealth++;
  if (buildCounterTargetPoolInstanceHealth < 3) {
    checkUnnamed2555(o.healthStatus);
    unittest.expect(o.kind, unittest.equals('foo'));
  }
  buildCounterTargetPoolInstanceHealth--;
}

buildUnnamed2556() {
  var o = new core.List<api.TargetPool>();
  o.add(buildTargetPool());
  o.add(buildTargetPool());
  return o;
}

checkUnnamed2556(core.List<api.TargetPool> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTargetPool(o[0]);
  checkTargetPool(o[1]);
}

core.int buildCounterTargetPoolList = 0;
buildTargetPoolList() {
  var o = new api.TargetPoolList();
  buildCounterTargetPoolList++;
  if (buildCounterTargetPoolList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2556();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterTargetPoolList--;
  return o;
}

checkTargetPoolList(api.TargetPoolList o) {
  buildCounterTargetPoolList++;
  if (buildCounterTargetPoolList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2556(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterTargetPoolList--;
}

buildUnnamed2557() {
  var o = new core.List<api.HealthCheckReference>();
  o.add(buildHealthCheckReference());
  o.add(buildHealthCheckReference());
  return o;
}

checkUnnamed2557(core.List<api.HealthCheckReference> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkHealthCheckReference(o[0]);
  checkHealthCheckReference(o[1]);
}

core.int buildCounterTargetPoolsAddHealthCheckRequest = 0;
buildTargetPoolsAddHealthCheckRequest() {
  var o = new api.TargetPoolsAddHealthCheckRequest();
  buildCounterTargetPoolsAddHealthCheckRequest++;
  if (buildCounterTargetPoolsAddHealthCheckRequest < 3) {
    o.healthChecks = buildUnnamed2557();
  }
  buildCounterTargetPoolsAddHealthCheckRequest--;
  return o;
}

checkTargetPoolsAddHealthCheckRequest(api.TargetPoolsAddHealthCheckRequest o) {
  buildCounterTargetPoolsAddHealthCheckRequest++;
  if (buildCounterTargetPoolsAddHealthCheckRequest < 3) {
    checkUnnamed2557(o.healthChecks);
  }
  buildCounterTargetPoolsAddHealthCheckRequest--;
}

buildUnnamed2558() {
  var o = new core.List<api.InstanceReference>();
  o.add(buildInstanceReference());
  o.add(buildInstanceReference());
  return o;
}

checkUnnamed2558(core.List<api.InstanceReference> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInstanceReference(o[0]);
  checkInstanceReference(o[1]);
}

core.int buildCounterTargetPoolsAddInstanceRequest = 0;
buildTargetPoolsAddInstanceRequest() {
  var o = new api.TargetPoolsAddInstanceRequest();
  buildCounterTargetPoolsAddInstanceRequest++;
  if (buildCounterTargetPoolsAddInstanceRequest < 3) {
    o.instances = buildUnnamed2558();
  }
  buildCounterTargetPoolsAddInstanceRequest--;
  return o;
}

checkTargetPoolsAddInstanceRequest(api.TargetPoolsAddInstanceRequest o) {
  buildCounterTargetPoolsAddInstanceRequest++;
  if (buildCounterTargetPoolsAddInstanceRequest < 3) {
    checkUnnamed2558(o.instances);
  }
  buildCounterTargetPoolsAddInstanceRequest--;
}

buildUnnamed2559() {
  var o = new core.List<api.HealthCheckReference>();
  o.add(buildHealthCheckReference());
  o.add(buildHealthCheckReference());
  return o;
}

checkUnnamed2559(core.List<api.HealthCheckReference> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkHealthCheckReference(o[0]);
  checkHealthCheckReference(o[1]);
}

core.int buildCounterTargetPoolsRemoveHealthCheckRequest = 0;
buildTargetPoolsRemoveHealthCheckRequest() {
  var o = new api.TargetPoolsRemoveHealthCheckRequest();
  buildCounterTargetPoolsRemoveHealthCheckRequest++;
  if (buildCounterTargetPoolsRemoveHealthCheckRequest < 3) {
    o.healthChecks = buildUnnamed2559();
  }
  buildCounterTargetPoolsRemoveHealthCheckRequest--;
  return o;
}

checkTargetPoolsRemoveHealthCheckRequest(api.TargetPoolsRemoveHealthCheckRequest o) {
  buildCounterTargetPoolsRemoveHealthCheckRequest++;
  if (buildCounterTargetPoolsRemoveHealthCheckRequest < 3) {
    checkUnnamed2559(o.healthChecks);
  }
  buildCounterTargetPoolsRemoveHealthCheckRequest--;
}

buildUnnamed2560() {
  var o = new core.List<api.InstanceReference>();
  o.add(buildInstanceReference());
  o.add(buildInstanceReference());
  return o;
}

checkUnnamed2560(core.List<api.InstanceReference> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkInstanceReference(o[0]);
  checkInstanceReference(o[1]);
}

core.int buildCounterTargetPoolsRemoveInstanceRequest = 0;
buildTargetPoolsRemoveInstanceRequest() {
  var o = new api.TargetPoolsRemoveInstanceRequest();
  buildCounterTargetPoolsRemoveInstanceRequest++;
  if (buildCounterTargetPoolsRemoveInstanceRequest < 3) {
    o.instances = buildUnnamed2560();
  }
  buildCounterTargetPoolsRemoveInstanceRequest--;
  return o;
}

checkTargetPoolsRemoveInstanceRequest(api.TargetPoolsRemoveInstanceRequest o) {
  buildCounterTargetPoolsRemoveInstanceRequest++;
  if (buildCounterTargetPoolsRemoveInstanceRequest < 3) {
    checkUnnamed2560(o.instances);
  }
  buildCounterTargetPoolsRemoveInstanceRequest--;
}

buildUnnamed2561() {
  var o = new core.List<api.TargetPool>();
  o.add(buildTargetPool());
  o.add(buildTargetPool());
  return o;
}

checkUnnamed2561(core.List<api.TargetPool> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTargetPool(o[0]);
  checkTargetPool(o[1]);
}

core.int buildCounterTargetPoolsScopedListWarningData = 0;
buildTargetPoolsScopedListWarningData() {
  var o = new api.TargetPoolsScopedListWarningData();
  buildCounterTargetPoolsScopedListWarningData++;
  if (buildCounterTargetPoolsScopedListWarningData < 3) {
    o.key = "foo";
    o.value = "foo";
  }
  buildCounterTargetPoolsScopedListWarningData--;
  return o;
}

checkTargetPoolsScopedListWarningData(api.TargetPoolsScopedListWarningData o) {
  buildCounterTargetPoolsScopedListWarningData++;
  if (buildCounterTargetPoolsScopedListWarningData < 3) {
    unittest.expect(o.key, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterTargetPoolsScopedListWarningData--;
}

buildUnnamed2562() {
  var o = new core.List<api.TargetPoolsScopedListWarningData>();
  o.add(buildTargetPoolsScopedListWarningData());
  o.add(buildTargetPoolsScopedListWarningData());
  return o;
}

checkUnnamed2562(core.List<api.TargetPoolsScopedListWarningData> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTargetPoolsScopedListWarningData(o[0]);
  checkTargetPoolsScopedListWarningData(o[1]);
}

core.int buildCounterTargetPoolsScopedListWarning = 0;
buildTargetPoolsScopedListWarning() {
  var o = new api.TargetPoolsScopedListWarning();
  buildCounterTargetPoolsScopedListWarning++;
  if (buildCounterTargetPoolsScopedListWarning < 3) {
    o.code = "foo";
    o.data = buildUnnamed2562();
    o.message = "foo";
  }
  buildCounterTargetPoolsScopedListWarning--;
  return o;
}

checkTargetPoolsScopedListWarning(api.TargetPoolsScopedListWarning o) {
  buildCounterTargetPoolsScopedListWarning++;
  if (buildCounterTargetPoolsScopedListWarning < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    checkUnnamed2562(o.data);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterTargetPoolsScopedListWarning--;
}

core.int buildCounterTargetPoolsScopedList = 0;
buildTargetPoolsScopedList() {
  var o = new api.TargetPoolsScopedList();
  buildCounterTargetPoolsScopedList++;
  if (buildCounterTargetPoolsScopedList < 3) {
    o.targetPools = buildUnnamed2561();
    o.warning = buildTargetPoolsScopedListWarning();
  }
  buildCounterTargetPoolsScopedList--;
  return o;
}

checkTargetPoolsScopedList(api.TargetPoolsScopedList o) {
  buildCounterTargetPoolsScopedList++;
  if (buildCounterTargetPoolsScopedList < 3) {
    checkUnnamed2561(o.targetPools);
    checkTargetPoolsScopedListWarning(o.warning);
  }
  buildCounterTargetPoolsScopedList--;
}

core.int buildCounterTargetReference = 0;
buildTargetReference() {
  var o = new api.TargetReference();
  buildCounterTargetReference++;
  if (buildCounterTargetReference < 3) {
    o.target = "foo";
  }
  buildCounterTargetReference--;
  return o;
}

checkTargetReference(api.TargetReference o) {
  buildCounterTargetReference++;
  if (buildCounterTargetReference < 3) {
    unittest.expect(o.target, unittest.equals('foo'));
  }
  buildCounterTargetReference--;
}

buildUnnamed2563() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2563(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2564() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2564(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterTargetVpnGateway = 0;
buildTargetVpnGateway() {
  var o = new api.TargetVpnGateway();
  buildCounterTargetVpnGateway++;
  if (buildCounterTargetVpnGateway < 3) {
    o.creationTimestamp = "foo";
    o.description = "foo";
    o.forwardingRules = buildUnnamed2563();
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.network = "foo";
    o.region = "foo";
    o.selfLink = "foo";
    o.status = "foo";
    o.tunnels = buildUnnamed2564();
  }
  buildCounterTargetVpnGateway--;
  return o;
}

checkTargetVpnGateway(api.TargetVpnGateway o) {
  buildCounterTargetVpnGateway++;
  if (buildCounterTargetVpnGateway < 3) {
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    checkUnnamed2563(o.forwardingRules);
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.network, unittest.equals('foo'));
    unittest.expect(o.region, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
    unittest.expect(o.status, unittest.equals('foo'));
    checkUnnamed2564(o.tunnels);
  }
  buildCounterTargetVpnGateway--;
}

buildUnnamed2565() {
  var o = new core.Map<core.String, api.TargetVpnGatewaysScopedList>();
  o["x"] = buildTargetVpnGatewaysScopedList();
  o["y"] = buildTargetVpnGatewaysScopedList();
  return o;
}

checkUnnamed2565(core.Map<core.String, api.TargetVpnGatewaysScopedList> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTargetVpnGatewaysScopedList(o["x"]);
  checkTargetVpnGatewaysScopedList(o["y"]);
}

core.int buildCounterTargetVpnGatewayAggregatedList = 0;
buildTargetVpnGatewayAggregatedList() {
  var o = new api.TargetVpnGatewayAggregatedList();
  buildCounterTargetVpnGatewayAggregatedList++;
  if (buildCounterTargetVpnGatewayAggregatedList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2565();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterTargetVpnGatewayAggregatedList--;
  return o;
}

checkTargetVpnGatewayAggregatedList(api.TargetVpnGatewayAggregatedList o) {
  buildCounterTargetVpnGatewayAggregatedList++;
  if (buildCounterTargetVpnGatewayAggregatedList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2565(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterTargetVpnGatewayAggregatedList--;
}

buildUnnamed2566() {
  var o = new core.List<api.TargetVpnGateway>();
  o.add(buildTargetVpnGateway());
  o.add(buildTargetVpnGateway());
  return o;
}

checkUnnamed2566(core.List<api.TargetVpnGateway> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTargetVpnGateway(o[0]);
  checkTargetVpnGateway(o[1]);
}

core.int buildCounterTargetVpnGatewayList = 0;
buildTargetVpnGatewayList() {
  var o = new api.TargetVpnGatewayList();
  buildCounterTargetVpnGatewayList++;
  if (buildCounterTargetVpnGatewayList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2566();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterTargetVpnGatewayList--;
  return o;
}

checkTargetVpnGatewayList(api.TargetVpnGatewayList o) {
  buildCounterTargetVpnGatewayList++;
  if (buildCounterTargetVpnGatewayList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2566(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterTargetVpnGatewayList--;
}

buildUnnamed2567() {
  var o = new core.List<api.TargetVpnGateway>();
  o.add(buildTargetVpnGateway());
  o.add(buildTargetVpnGateway());
  return o;
}

checkUnnamed2567(core.List<api.TargetVpnGateway> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTargetVpnGateway(o[0]);
  checkTargetVpnGateway(o[1]);
}

core.int buildCounterTargetVpnGatewaysScopedListWarningData = 0;
buildTargetVpnGatewaysScopedListWarningData() {
  var o = new api.TargetVpnGatewaysScopedListWarningData();
  buildCounterTargetVpnGatewaysScopedListWarningData++;
  if (buildCounterTargetVpnGatewaysScopedListWarningData < 3) {
    o.key = "foo";
    o.value = "foo";
  }
  buildCounterTargetVpnGatewaysScopedListWarningData--;
  return o;
}

checkTargetVpnGatewaysScopedListWarningData(api.TargetVpnGatewaysScopedListWarningData o) {
  buildCounterTargetVpnGatewaysScopedListWarningData++;
  if (buildCounterTargetVpnGatewaysScopedListWarningData < 3) {
    unittest.expect(o.key, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterTargetVpnGatewaysScopedListWarningData--;
}

buildUnnamed2568() {
  var o = new core.List<api.TargetVpnGatewaysScopedListWarningData>();
  o.add(buildTargetVpnGatewaysScopedListWarningData());
  o.add(buildTargetVpnGatewaysScopedListWarningData());
  return o;
}

checkUnnamed2568(core.List<api.TargetVpnGatewaysScopedListWarningData> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTargetVpnGatewaysScopedListWarningData(o[0]);
  checkTargetVpnGatewaysScopedListWarningData(o[1]);
}

core.int buildCounterTargetVpnGatewaysScopedListWarning = 0;
buildTargetVpnGatewaysScopedListWarning() {
  var o = new api.TargetVpnGatewaysScopedListWarning();
  buildCounterTargetVpnGatewaysScopedListWarning++;
  if (buildCounterTargetVpnGatewaysScopedListWarning < 3) {
    o.code = "foo";
    o.data = buildUnnamed2568();
    o.message = "foo";
  }
  buildCounterTargetVpnGatewaysScopedListWarning--;
  return o;
}

checkTargetVpnGatewaysScopedListWarning(api.TargetVpnGatewaysScopedListWarning o) {
  buildCounterTargetVpnGatewaysScopedListWarning++;
  if (buildCounterTargetVpnGatewaysScopedListWarning < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    checkUnnamed2568(o.data);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterTargetVpnGatewaysScopedListWarning--;
}

core.int buildCounterTargetVpnGatewaysScopedList = 0;
buildTargetVpnGatewaysScopedList() {
  var o = new api.TargetVpnGatewaysScopedList();
  buildCounterTargetVpnGatewaysScopedList++;
  if (buildCounterTargetVpnGatewaysScopedList < 3) {
    o.targetVpnGateways = buildUnnamed2567();
    o.warning = buildTargetVpnGatewaysScopedListWarning();
  }
  buildCounterTargetVpnGatewaysScopedList--;
  return o;
}

checkTargetVpnGatewaysScopedList(api.TargetVpnGatewaysScopedList o) {
  buildCounterTargetVpnGatewaysScopedList++;
  if (buildCounterTargetVpnGatewaysScopedList < 3) {
    checkUnnamed2567(o.targetVpnGateways);
    checkTargetVpnGatewaysScopedListWarning(o.warning);
  }
  buildCounterTargetVpnGatewaysScopedList--;
}

core.int buildCounterTestFailure = 0;
buildTestFailure() {
  var o = new api.TestFailure();
  buildCounterTestFailure++;
  if (buildCounterTestFailure < 3) {
    o.actualService = "foo";
    o.expectedService = "foo";
    o.host = "foo";
    o.path = "foo";
  }
  buildCounterTestFailure--;
  return o;
}

checkTestFailure(api.TestFailure o) {
  buildCounterTestFailure++;
  if (buildCounterTestFailure < 3) {
    unittest.expect(o.actualService, unittest.equals('foo'));
    unittest.expect(o.expectedService, unittest.equals('foo'));
    unittest.expect(o.host, unittest.equals('foo'));
    unittest.expect(o.path, unittest.equals('foo'));
  }
  buildCounterTestFailure--;
}

buildUnnamed2569() {
  var o = new core.List<api.HostRule>();
  o.add(buildHostRule());
  o.add(buildHostRule());
  return o;
}

checkUnnamed2569(core.List<api.HostRule> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkHostRule(o[0]);
  checkHostRule(o[1]);
}

buildUnnamed2570() {
  var o = new core.List<api.PathMatcher>();
  o.add(buildPathMatcher());
  o.add(buildPathMatcher());
  return o;
}

checkUnnamed2570(core.List<api.PathMatcher> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkPathMatcher(o[0]);
  checkPathMatcher(o[1]);
}

buildUnnamed2571() {
  var o = new core.List<api.UrlMapTest>();
  o.add(buildUrlMapTest());
  o.add(buildUrlMapTest());
  return o;
}

checkUnnamed2571(core.List<api.UrlMapTest> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUrlMapTest(o[0]);
  checkUrlMapTest(o[1]);
}

core.int buildCounterUrlMap = 0;
buildUrlMap() {
  var o = new api.UrlMap();
  buildCounterUrlMap++;
  if (buildCounterUrlMap < 3) {
    o.creationTimestamp = "foo";
    o.defaultService = "foo";
    o.description = "foo";
    o.fingerprint = "foo";
    o.hostRules = buildUnnamed2569();
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.pathMatchers = buildUnnamed2570();
    o.selfLink = "foo";
    o.tests = buildUnnamed2571();
  }
  buildCounterUrlMap--;
  return o;
}

checkUrlMap(api.UrlMap o) {
  buildCounterUrlMap++;
  if (buildCounterUrlMap < 3) {
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.defaultService, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.fingerprint, unittest.equals('foo'));
    checkUnnamed2569(o.hostRules);
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    checkUnnamed2570(o.pathMatchers);
    unittest.expect(o.selfLink, unittest.equals('foo'));
    checkUnnamed2571(o.tests);
  }
  buildCounterUrlMap--;
}

buildUnnamed2572() {
  var o = new core.List<api.UrlMap>();
  o.add(buildUrlMap());
  o.add(buildUrlMap());
  return o;
}

checkUnnamed2572(core.List<api.UrlMap> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUrlMap(o[0]);
  checkUrlMap(o[1]);
}

core.int buildCounterUrlMapList = 0;
buildUrlMapList() {
  var o = new api.UrlMapList();
  buildCounterUrlMapList++;
  if (buildCounterUrlMapList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2572();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterUrlMapList--;
  return o;
}

checkUrlMapList(api.UrlMapList o) {
  buildCounterUrlMapList++;
  if (buildCounterUrlMapList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2572(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterUrlMapList--;
}

core.int buildCounterUrlMapReference = 0;
buildUrlMapReference() {
  var o = new api.UrlMapReference();
  buildCounterUrlMapReference++;
  if (buildCounterUrlMapReference < 3) {
    o.urlMap = "foo";
  }
  buildCounterUrlMapReference--;
  return o;
}

checkUrlMapReference(api.UrlMapReference o) {
  buildCounterUrlMapReference++;
  if (buildCounterUrlMapReference < 3) {
    unittest.expect(o.urlMap, unittest.equals('foo'));
  }
  buildCounterUrlMapReference--;
}

core.int buildCounterUrlMapTest = 0;
buildUrlMapTest() {
  var o = new api.UrlMapTest();
  buildCounterUrlMapTest++;
  if (buildCounterUrlMapTest < 3) {
    o.description = "foo";
    o.host = "foo";
    o.path = "foo";
    o.service = "foo";
  }
  buildCounterUrlMapTest--;
  return o;
}

checkUrlMapTest(api.UrlMapTest o) {
  buildCounterUrlMapTest++;
  if (buildCounterUrlMapTest < 3) {
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.host, unittest.equals('foo'));
    unittest.expect(o.path, unittest.equals('foo'));
    unittest.expect(o.service, unittest.equals('foo'));
  }
  buildCounterUrlMapTest--;
}

buildUnnamed2573() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2573(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2574() {
  var o = new core.List<api.TestFailure>();
  o.add(buildTestFailure());
  o.add(buildTestFailure());
  return o;
}

checkUnnamed2574(core.List<api.TestFailure> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkTestFailure(o[0]);
  checkTestFailure(o[1]);
}

core.int buildCounterUrlMapValidationResult = 0;
buildUrlMapValidationResult() {
  var o = new api.UrlMapValidationResult();
  buildCounterUrlMapValidationResult++;
  if (buildCounterUrlMapValidationResult < 3) {
    o.loadErrors = buildUnnamed2573();
    o.loadSucceeded = true;
    o.testFailures = buildUnnamed2574();
    o.testPassed = true;
  }
  buildCounterUrlMapValidationResult--;
  return o;
}

checkUrlMapValidationResult(api.UrlMapValidationResult o) {
  buildCounterUrlMapValidationResult++;
  if (buildCounterUrlMapValidationResult < 3) {
    checkUnnamed2573(o.loadErrors);
    unittest.expect(o.loadSucceeded, unittest.isTrue);
    checkUnnamed2574(o.testFailures);
    unittest.expect(o.testPassed, unittest.isTrue);
  }
  buildCounterUrlMapValidationResult--;
}

core.int buildCounterUrlMapsValidateRequest = 0;
buildUrlMapsValidateRequest() {
  var o = new api.UrlMapsValidateRequest();
  buildCounterUrlMapsValidateRequest++;
  if (buildCounterUrlMapsValidateRequest < 3) {
    o.resource = buildUrlMap();
  }
  buildCounterUrlMapsValidateRequest--;
  return o;
}

checkUrlMapsValidateRequest(api.UrlMapsValidateRequest o) {
  buildCounterUrlMapsValidateRequest++;
  if (buildCounterUrlMapsValidateRequest < 3) {
    checkUrlMap(o.resource);
  }
  buildCounterUrlMapsValidateRequest--;
}

core.int buildCounterUrlMapsValidateResponse = 0;
buildUrlMapsValidateResponse() {
  var o = new api.UrlMapsValidateResponse();
  buildCounterUrlMapsValidateResponse++;
  if (buildCounterUrlMapsValidateResponse < 3) {
    o.result = buildUrlMapValidationResult();
  }
  buildCounterUrlMapsValidateResponse--;
  return o;
}

checkUrlMapsValidateResponse(api.UrlMapsValidateResponse o) {
  buildCounterUrlMapsValidateResponse++;
  if (buildCounterUrlMapsValidateResponse < 3) {
    checkUrlMapValidationResult(o.result);
  }
  buildCounterUrlMapsValidateResponse--;
}

core.int buildCounterUsageExportLocation = 0;
buildUsageExportLocation() {
  var o = new api.UsageExportLocation();
  buildCounterUsageExportLocation++;
  if (buildCounterUsageExportLocation < 3) {
    o.bucketName = "foo";
    o.reportNamePrefix = "foo";
  }
  buildCounterUsageExportLocation--;
  return o;
}

checkUsageExportLocation(api.UsageExportLocation o) {
  buildCounterUsageExportLocation++;
  if (buildCounterUsageExportLocation < 3) {
    unittest.expect(o.bucketName, unittest.equals('foo'));
    unittest.expect(o.reportNamePrefix, unittest.equals('foo'));
  }
  buildCounterUsageExportLocation--;
}

buildUnnamed2575() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2575(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed2576() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed2576(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterVpnTunnel = 0;
buildVpnTunnel() {
  var o = new api.VpnTunnel();
  buildCounterVpnTunnel++;
  if (buildCounterVpnTunnel < 3) {
    o.creationTimestamp = "foo";
    o.description = "foo";
    o.detailedStatus = "foo";
    o.id = "foo";
    o.ikeVersion = 42;
    o.kind = "foo";
    o.localTrafficSelector = buildUnnamed2575();
    o.name = "foo";
    o.peerIp = "foo";
    o.region = "foo";
    o.remoteTrafficSelector = buildUnnamed2576();
    o.router = "foo";
    o.selfLink = "foo";
    o.sharedSecret = "foo";
    o.sharedSecretHash = "foo";
    o.status = "foo";
    o.targetVpnGateway = "foo";
  }
  buildCounterVpnTunnel--;
  return o;
}

checkVpnTunnel(api.VpnTunnel o) {
  buildCounterVpnTunnel++;
  if (buildCounterVpnTunnel < 3) {
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.detailedStatus, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.ikeVersion, unittest.equals(42));
    unittest.expect(o.kind, unittest.equals('foo'));
    checkUnnamed2575(o.localTrafficSelector);
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.peerIp, unittest.equals('foo'));
    unittest.expect(o.region, unittest.equals('foo'));
    checkUnnamed2576(o.remoteTrafficSelector);
    unittest.expect(o.router, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
    unittest.expect(o.sharedSecret, unittest.equals('foo'));
    unittest.expect(o.sharedSecretHash, unittest.equals('foo'));
    unittest.expect(o.status, unittest.equals('foo'));
    unittest.expect(o.targetVpnGateway, unittest.equals('foo'));
  }
  buildCounterVpnTunnel--;
}

buildUnnamed2577() {
  var o = new core.Map<core.String, api.VpnTunnelsScopedList>();
  o["x"] = buildVpnTunnelsScopedList();
  o["y"] = buildVpnTunnelsScopedList();
  return o;
}

checkUnnamed2577(core.Map<core.String, api.VpnTunnelsScopedList> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkVpnTunnelsScopedList(o["x"]);
  checkVpnTunnelsScopedList(o["y"]);
}

core.int buildCounterVpnTunnelAggregatedList = 0;
buildVpnTunnelAggregatedList() {
  var o = new api.VpnTunnelAggregatedList();
  buildCounterVpnTunnelAggregatedList++;
  if (buildCounterVpnTunnelAggregatedList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2577();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterVpnTunnelAggregatedList--;
  return o;
}

checkVpnTunnelAggregatedList(api.VpnTunnelAggregatedList o) {
  buildCounterVpnTunnelAggregatedList++;
  if (buildCounterVpnTunnelAggregatedList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2577(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterVpnTunnelAggregatedList--;
}

buildUnnamed2578() {
  var o = new core.List<api.VpnTunnel>();
  o.add(buildVpnTunnel());
  o.add(buildVpnTunnel());
  return o;
}

checkUnnamed2578(core.List<api.VpnTunnel> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkVpnTunnel(o[0]);
  checkVpnTunnel(o[1]);
}

core.int buildCounterVpnTunnelList = 0;
buildVpnTunnelList() {
  var o = new api.VpnTunnelList();
  buildCounterVpnTunnelList++;
  if (buildCounterVpnTunnelList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2578();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterVpnTunnelList--;
  return o;
}

checkVpnTunnelList(api.VpnTunnelList o) {
  buildCounterVpnTunnelList++;
  if (buildCounterVpnTunnelList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2578(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterVpnTunnelList--;
}

buildUnnamed2579() {
  var o = new core.List<api.VpnTunnel>();
  o.add(buildVpnTunnel());
  o.add(buildVpnTunnel());
  return o;
}

checkUnnamed2579(core.List<api.VpnTunnel> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkVpnTunnel(o[0]);
  checkVpnTunnel(o[1]);
}

core.int buildCounterVpnTunnelsScopedListWarningData = 0;
buildVpnTunnelsScopedListWarningData() {
  var o = new api.VpnTunnelsScopedListWarningData();
  buildCounterVpnTunnelsScopedListWarningData++;
  if (buildCounterVpnTunnelsScopedListWarningData < 3) {
    o.key = "foo";
    o.value = "foo";
  }
  buildCounterVpnTunnelsScopedListWarningData--;
  return o;
}

checkVpnTunnelsScopedListWarningData(api.VpnTunnelsScopedListWarningData o) {
  buildCounterVpnTunnelsScopedListWarningData++;
  if (buildCounterVpnTunnelsScopedListWarningData < 3) {
    unittest.expect(o.key, unittest.equals('foo'));
    unittest.expect(o.value, unittest.equals('foo'));
  }
  buildCounterVpnTunnelsScopedListWarningData--;
}

buildUnnamed2580() {
  var o = new core.List<api.VpnTunnelsScopedListWarningData>();
  o.add(buildVpnTunnelsScopedListWarningData());
  o.add(buildVpnTunnelsScopedListWarningData());
  return o;
}

checkUnnamed2580(core.List<api.VpnTunnelsScopedListWarningData> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkVpnTunnelsScopedListWarningData(o[0]);
  checkVpnTunnelsScopedListWarningData(o[1]);
}

core.int buildCounterVpnTunnelsScopedListWarning = 0;
buildVpnTunnelsScopedListWarning() {
  var o = new api.VpnTunnelsScopedListWarning();
  buildCounterVpnTunnelsScopedListWarning++;
  if (buildCounterVpnTunnelsScopedListWarning < 3) {
    o.code = "foo";
    o.data = buildUnnamed2580();
    o.message = "foo";
  }
  buildCounterVpnTunnelsScopedListWarning--;
  return o;
}

checkVpnTunnelsScopedListWarning(api.VpnTunnelsScopedListWarning o) {
  buildCounterVpnTunnelsScopedListWarning++;
  if (buildCounterVpnTunnelsScopedListWarning < 3) {
    unittest.expect(o.code, unittest.equals('foo'));
    checkUnnamed2580(o.data);
    unittest.expect(o.message, unittest.equals('foo'));
  }
  buildCounterVpnTunnelsScopedListWarning--;
}

core.int buildCounterVpnTunnelsScopedList = 0;
buildVpnTunnelsScopedList() {
  var o = new api.VpnTunnelsScopedList();
  buildCounterVpnTunnelsScopedList++;
  if (buildCounterVpnTunnelsScopedList < 3) {
    o.vpnTunnels = buildUnnamed2579();
    o.warning = buildVpnTunnelsScopedListWarning();
  }
  buildCounterVpnTunnelsScopedList--;
  return o;
}

checkVpnTunnelsScopedList(api.VpnTunnelsScopedList o) {
  buildCounterVpnTunnelsScopedList++;
  if (buildCounterVpnTunnelsScopedList < 3) {
    checkUnnamed2579(o.vpnTunnels);
    checkVpnTunnelsScopedListWarning(o.warning);
  }
  buildCounterVpnTunnelsScopedList--;
}

core.int buildCounterZone = 0;
buildZone() {
  var o = new api.Zone();
  buildCounterZone++;
  if (buildCounterZone < 3) {
    o.creationTimestamp = "foo";
    o.deprecated = buildDeprecationStatus();
    o.description = "foo";
    o.id = "foo";
    o.kind = "foo";
    o.name = "foo";
    o.region = "foo";
    o.selfLink = "foo";
    o.status = "foo";
  }
  buildCounterZone--;
  return o;
}

checkZone(api.Zone o) {
  buildCounterZone++;
  if (buildCounterZone < 3) {
    unittest.expect(o.creationTimestamp, unittest.equals('foo'));
    checkDeprecationStatus(o.deprecated);
    unittest.expect(o.description, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.region, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
    unittest.expect(o.status, unittest.equals('foo'));
  }
  buildCounterZone--;
}

buildUnnamed2581() {
  var o = new core.List<api.Zone>();
  o.add(buildZone());
  o.add(buildZone());
  return o;
}

checkUnnamed2581(core.List<api.Zone> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkZone(o[0]);
  checkZone(o[1]);
}

core.int buildCounterZoneList = 0;
buildZoneList() {
  var o = new api.ZoneList();
  buildCounterZoneList++;
  if (buildCounterZoneList < 3) {
    o.id = "foo";
    o.items = buildUnnamed2581();
    o.kind = "foo";
    o.nextPageToken = "foo";
    o.selfLink = "foo";
  }
  buildCounterZoneList--;
  return o;
}

checkZoneList(api.ZoneList o) {
  buildCounterZoneList++;
  if (buildCounterZoneList < 3) {
    unittest.expect(o.id, unittest.equals('foo'));
    checkUnnamed2581(o.items);
    unittest.expect(o.kind, unittest.equals('foo'));
    unittest.expect(o.nextPageToken, unittest.equals('foo'));
    unittest.expect(o.selfLink, unittest.equals('foo'));
  }
  buildCounterZoneList--;
}


main() {
  unittest.group("obj-schema-AccessConfig", () {
    unittest.test("to-json--from-json", () {
      var o = buildAccessConfig();
      var od = new api.AccessConfig.fromJson(o.toJson());
      checkAccessConfig(od);
    });
  });


  unittest.group("obj-schema-Address", () {
    unittest.test("to-json--from-json", () {
      var o = buildAddress();
      var od = new api.Address.fromJson(o.toJson());
      checkAddress(od);
    });
  });


  unittest.group("obj-schema-AddressAggregatedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildAddressAggregatedList();
      var od = new api.AddressAggregatedList.fromJson(o.toJson());
      checkAddressAggregatedList(od);
    });
  });


  unittest.group("obj-schema-AddressList", () {
    unittest.test("to-json--from-json", () {
      var o = buildAddressList();
      var od = new api.AddressList.fromJson(o.toJson());
      checkAddressList(od);
    });
  });


  unittest.group("obj-schema-AddressesScopedListWarningData", () {
    unittest.test("to-json--from-json", () {
      var o = buildAddressesScopedListWarningData();
      var od = new api.AddressesScopedListWarningData.fromJson(o.toJson());
      checkAddressesScopedListWarningData(od);
    });
  });


  unittest.group("obj-schema-AddressesScopedListWarning", () {
    unittest.test("to-json--from-json", () {
      var o = buildAddressesScopedListWarning();
      var od = new api.AddressesScopedListWarning.fromJson(o.toJson());
      checkAddressesScopedListWarning(od);
    });
  });


  unittest.group("obj-schema-AddressesScopedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildAddressesScopedList();
      var od = new api.AddressesScopedList.fromJson(o.toJson());
      checkAddressesScopedList(od);
    });
  });


  unittest.group("obj-schema-AttachedDisk", () {
    unittest.test("to-json--from-json", () {
      var o = buildAttachedDisk();
      var od = new api.AttachedDisk.fromJson(o.toJson());
      checkAttachedDisk(od);
    });
  });


  unittest.group("obj-schema-AttachedDiskInitializeParams", () {
    unittest.test("to-json--from-json", () {
      var o = buildAttachedDiskInitializeParams();
      var od = new api.AttachedDiskInitializeParams.fromJson(o.toJson());
      checkAttachedDiskInitializeParams(od);
    });
  });


  unittest.group("obj-schema-Autoscaler", () {
    unittest.test("to-json--from-json", () {
      var o = buildAutoscaler();
      var od = new api.Autoscaler.fromJson(o.toJson());
      checkAutoscaler(od);
    });
  });


  unittest.group("obj-schema-AutoscalerAggregatedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildAutoscalerAggregatedList();
      var od = new api.AutoscalerAggregatedList.fromJson(o.toJson());
      checkAutoscalerAggregatedList(od);
    });
  });


  unittest.group("obj-schema-AutoscalerList", () {
    unittest.test("to-json--from-json", () {
      var o = buildAutoscalerList();
      var od = new api.AutoscalerList.fromJson(o.toJson());
      checkAutoscalerList(od);
    });
  });


  unittest.group("obj-schema-AutoscalersScopedListWarningData", () {
    unittest.test("to-json--from-json", () {
      var o = buildAutoscalersScopedListWarningData();
      var od = new api.AutoscalersScopedListWarningData.fromJson(o.toJson());
      checkAutoscalersScopedListWarningData(od);
    });
  });


  unittest.group("obj-schema-AutoscalersScopedListWarning", () {
    unittest.test("to-json--from-json", () {
      var o = buildAutoscalersScopedListWarning();
      var od = new api.AutoscalersScopedListWarning.fromJson(o.toJson());
      checkAutoscalersScopedListWarning(od);
    });
  });


  unittest.group("obj-schema-AutoscalersScopedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildAutoscalersScopedList();
      var od = new api.AutoscalersScopedList.fromJson(o.toJson());
      checkAutoscalersScopedList(od);
    });
  });


  unittest.group("obj-schema-AutoscalingPolicy", () {
    unittest.test("to-json--from-json", () {
      var o = buildAutoscalingPolicy();
      var od = new api.AutoscalingPolicy.fromJson(o.toJson());
      checkAutoscalingPolicy(od);
    });
  });


  unittest.group("obj-schema-AutoscalingPolicyCpuUtilization", () {
    unittest.test("to-json--from-json", () {
      var o = buildAutoscalingPolicyCpuUtilization();
      var od = new api.AutoscalingPolicyCpuUtilization.fromJson(o.toJson());
      checkAutoscalingPolicyCpuUtilization(od);
    });
  });


  unittest.group("obj-schema-AutoscalingPolicyCustomMetricUtilization", () {
    unittest.test("to-json--from-json", () {
      var o = buildAutoscalingPolicyCustomMetricUtilization();
      var od = new api.AutoscalingPolicyCustomMetricUtilization.fromJson(o.toJson());
      checkAutoscalingPolicyCustomMetricUtilization(od);
    });
  });


  unittest.group("obj-schema-AutoscalingPolicyLoadBalancingUtilization", () {
    unittest.test("to-json--from-json", () {
      var o = buildAutoscalingPolicyLoadBalancingUtilization();
      var od = new api.AutoscalingPolicyLoadBalancingUtilization.fromJson(o.toJson());
      checkAutoscalingPolicyLoadBalancingUtilization(od);
    });
  });


  unittest.group("obj-schema-Backend", () {
    unittest.test("to-json--from-json", () {
      var o = buildBackend();
      var od = new api.Backend.fromJson(o.toJson());
      checkBackend(od);
    });
  });


  unittest.group("obj-schema-BackendService", () {
    unittest.test("to-json--from-json", () {
      var o = buildBackendService();
      var od = new api.BackendService.fromJson(o.toJson());
      checkBackendService(od);
    });
  });


  unittest.group("obj-schema-BackendServiceGroupHealth", () {
    unittest.test("to-json--from-json", () {
      var o = buildBackendServiceGroupHealth();
      var od = new api.BackendServiceGroupHealth.fromJson(o.toJson());
      checkBackendServiceGroupHealth(od);
    });
  });


  unittest.group("obj-schema-BackendServiceList", () {
    unittest.test("to-json--from-json", () {
      var o = buildBackendServiceList();
      var od = new api.BackendServiceList.fromJson(o.toJson());
      checkBackendServiceList(od);
    });
  });


  unittest.group("obj-schema-CacheInvalidationRule", () {
    unittest.test("to-json--from-json", () {
      var o = buildCacheInvalidationRule();
      var od = new api.CacheInvalidationRule.fromJson(o.toJson());
      checkCacheInvalidationRule(od);
    });
  });


  unittest.group("obj-schema-CustomerEncryptionKey", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomerEncryptionKey();
      var od = new api.CustomerEncryptionKey.fromJson(o.toJson());
      checkCustomerEncryptionKey(od);
    });
  });


  unittest.group("obj-schema-CustomerEncryptionKeyProtectedDisk", () {
    unittest.test("to-json--from-json", () {
      var o = buildCustomerEncryptionKeyProtectedDisk();
      var od = new api.CustomerEncryptionKeyProtectedDisk.fromJson(o.toJson());
      checkCustomerEncryptionKeyProtectedDisk(od);
    });
  });


  unittest.group("obj-schema-DeprecationStatus", () {
    unittest.test("to-json--from-json", () {
      var o = buildDeprecationStatus();
      var od = new api.DeprecationStatus.fromJson(o.toJson());
      checkDeprecationStatus(od);
    });
  });


  unittest.group("obj-schema-Disk", () {
    unittest.test("to-json--from-json", () {
      var o = buildDisk();
      var od = new api.Disk.fromJson(o.toJson());
      checkDisk(od);
    });
  });


  unittest.group("obj-schema-DiskAggregatedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildDiskAggregatedList();
      var od = new api.DiskAggregatedList.fromJson(o.toJson());
      checkDiskAggregatedList(od);
    });
  });


  unittest.group("obj-schema-DiskList", () {
    unittest.test("to-json--from-json", () {
      var o = buildDiskList();
      var od = new api.DiskList.fromJson(o.toJson());
      checkDiskList(od);
    });
  });


  unittest.group("obj-schema-DiskMoveRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildDiskMoveRequest();
      var od = new api.DiskMoveRequest.fromJson(o.toJson());
      checkDiskMoveRequest(od);
    });
  });


  unittest.group("obj-schema-DiskType", () {
    unittest.test("to-json--from-json", () {
      var o = buildDiskType();
      var od = new api.DiskType.fromJson(o.toJson());
      checkDiskType(od);
    });
  });


  unittest.group("obj-schema-DiskTypeAggregatedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildDiskTypeAggregatedList();
      var od = new api.DiskTypeAggregatedList.fromJson(o.toJson());
      checkDiskTypeAggregatedList(od);
    });
  });


  unittest.group("obj-schema-DiskTypeList", () {
    unittest.test("to-json--from-json", () {
      var o = buildDiskTypeList();
      var od = new api.DiskTypeList.fromJson(o.toJson());
      checkDiskTypeList(od);
    });
  });


  unittest.group("obj-schema-DiskTypesScopedListWarningData", () {
    unittest.test("to-json--from-json", () {
      var o = buildDiskTypesScopedListWarningData();
      var od = new api.DiskTypesScopedListWarningData.fromJson(o.toJson());
      checkDiskTypesScopedListWarningData(od);
    });
  });


  unittest.group("obj-schema-DiskTypesScopedListWarning", () {
    unittest.test("to-json--from-json", () {
      var o = buildDiskTypesScopedListWarning();
      var od = new api.DiskTypesScopedListWarning.fromJson(o.toJson());
      checkDiskTypesScopedListWarning(od);
    });
  });


  unittest.group("obj-schema-DiskTypesScopedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildDiskTypesScopedList();
      var od = new api.DiskTypesScopedList.fromJson(o.toJson());
      checkDiskTypesScopedList(od);
    });
  });


  unittest.group("obj-schema-DisksResizeRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildDisksResizeRequest();
      var od = new api.DisksResizeRequest.fromJson(o.toJson());
      checkDisksResizeRequest(od);
    });
  });


  unittest.group("obj-schema-DisksScopedListWarningData", () {
    unittest.test("to-json--from-json", () {
      var o = buildDisksScopedListWarningData();
      var od = new api.DisksScopedListWarningData.fromJson(o.toJson());
      checkDisksScopedListWarningData(od);
    });
  });


  unittest.group("obj-schema-DisksScopedListWarning", () {
    unittest.test("to-json--from-json", () {
      var o = buildDisksScopedListWarning();
      var od = new api.DisksScopedListWarning.fromJson(o.toJson());
      checkDisksScopedListWarning(od);
    });
  });


  unittest.group("obj-schema-DisksScopedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildDisksScopedList();
      var od = new api.DisksScopedList.fromJson(o.toJson());
      checkDisksScopedList(od);
    });
  });


  unittest.group("obj-schema-FirewallAllowed", () {
    unittest.test("to-json--from-json", () {
      var o = buildFirewallAllowed();
      var od = new api.FirewallAllowed.fromJson(o.toJson());
      checkFirewallAllowed(od);
    });
  });


  unittest.group("obj-schema-Firewall", () {
    unittest.test("to-json--from-json", () {
      var o = buildFirewall();
      var od = new api.Firewall.fromJson(o.toJson());
      checkFirewall(od);
    });
  });


  unittest.group("obj-schema-FirewallList", () {
    unittest.test("to-json--from-json", () {
      var o = buildFirewallList();
      var od = new api.FirewallList.fromJson(o.toJson());
      checkFirewallList(od);
    });
  });


  unittest.group("obj-schema-ForwardingRule", () {
    unittest.test("to-json--from-json", () {
      var o = buildForwardingRule();
      var od = new api.ForwardingRule.fromJson(o.toJson());
      checkForwardingRule(od);
    });
  });


  unittest.group("obj-schema-ForwardingRuleAggregatedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildForwardingRuleAggregatedList();
      var od = new api.ForwardingRuleAggregatedList.fromJson(o.toJson());
      checkForwardingRuleAggregatedList(od);
    });
  });


  unittest.group("obj-schema-ForwardingRuleList", () {
    unittest.test("to-json--from-json", () {
      var o = buildForwardingRuleList();
      var od = new api.ForwardingRuleList.fromJson(o.toJson());
      checkForwardingRuleList(od);
    });
  });


  unittest.group("obj-schema-ForwardingRulesScopedListWarningData", () {
    unittest.test("to-json--from-json", () {
      var o = buildForwardingRulesScopedListWarningData();
      var od = new api.ForwardingRulesScopedListWarningData.fromJson(o.toJson());
      checkForwardingRulesScopedListWarningData(od);
    });
  });


  unittest.group("obj-schema-ForwardingRulesScopedListWarning", () {
    unittest.test("to-json--from-json", () {
      var o = buildForwardingRulesScopedListWarning();
      var od = new api.ForwardingRulesScopedListWarning.fromJson(o.toJson());
      checkForwardingRulesScopedListWarning(od);
    });
  });


  unittest.group("obj-schema-ForwardingRulesScopedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildForwardingRulesScopedList();
      var od = new api.ForwardingRulesScopedList.fromJson(o.toJson());
      checkForwardingRulesScopedList(od);
    });
  });


  unittest.group("obj-schema-HealthCheckReference", () {
    unittest.test("to-json--from-json", () {
      var o = buildHealthCheckReference();
      var od = new api.HealthCheckReference.fromJson(o.toJson());
      checkHealthCheckReference(od);
    });
  });


  unittest.group("obj-schema-HealthStatus", () {
    unittest.test("to-json--from-json", () {
      var o = buildHealthStatus();
      var od = new api.HealthStatus.fromJson(o.toJson());
      checkHealthStatus(od);
    });
  });


  unittest.group("obj-schema-HostRule", () {
    unittest.test("to-json--from-json", () {
      var o = buildHostRule();
      var od = new api.HostRule.fromJson(o.toJson());
      checkHostRule(od);
    });
  });


  unittest.group("obj-schema-HttpHealthCheck", () {
    unittest.test("to-json--from-json", () {
      var o = buildHttpHealthCheck();
      var od = new api.HttpHealthCheck.fromJson(o.toJson());
      checkHttpHealthCheck(od);
    });
  });


  unittest.group("obj-schema-HttpHealthCheckList", () {
    unittest.test("to-json--from-json", () {
      var o = buildHttpHealthCheckList();
      var od = new api.HttpHealthCheckList.fromJson(o.toJson());
      checkHttpHealthCheckList(od);
    });
  });


  unittest.group("obj-schema-HttpsHealthCheck", () {
    unittest.test("to-json--from-json", () {
      var o = buildHttpsHealthCheck();
      var od = new api.HttpsHealthCheck.fromJson(o.toJson());
      checkHttpsHealthCheck(od);
    });
  });


  unittest.group("obj-schema-HttpsHealthCheckList", () {
    unittest.test("to-json--from-json", () {
      var o = buildHttpsHealthCheckList();
      var od = new api.HttpsHealthCheckList.fromJson(o.toJson());
      checkHttpsHealthCheckList(od);
    });
  });


  unittest.group("obj-schema-ImageRawDisk", () {
    unittest.test("to-json--from-json", () {
      var o = buildImageRawDisk();
      var od = new api.ImageRawDisk.fromJson(o.toJson());
      checkImageRawDisk(od);
    });
  });


  unittest.group("obj-schema-Image", () {
    unittest.test("to-json--from-json", () {
      var o = buildImage();
      var od = new api.Image.fromJson(o.toJson());
      checkImage(od);
    });
  });


  unittest.group("obj-schema-ImageList", () {
    unittest.test("to-json--from-json", () {
      var o = buildImageList();
      var od = new api.ImageList.fromJson(o.toJson());
      checkImageList(od);
    });
  });


  unittest.group("obj-schema-Instance", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstance();
      var od = new api.Instance.fromJson(o.toJson());
      checkInstance(od);
    });
  });


  unittest.group("obj-schema-InstanceAggregatedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceAggregatedList();
      var od = new api.InstanceAggregatedList.fromJson(o.toJson());
      checkInstanceAggregatedList(od);
    });
  });


  unittest.group("obj-schema-InstanceGroup", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceGroup();
      var od = new api.InstanceGroup.fromJson(o.toJson());
      checkInstanceGroup(od);
    });
  });


  unittest.group("obj-schema-InstanceGroupAggregatedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceGroupAggregatedList();
      var od = new api.InstanceGroupAggregatedList.fromJson(o.toJson());
      checkInstanceGroupAggregatedList(od);
    });
  });


  unittest.group("obj-schema-InstanceGroupList", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceGroupList();
      var od = new api.InstanceGroupList.fromJson(o.toJson());
      checkInstanceGroupList(od);
    });
  });


  unittest.group("obj-schema-InstanceGroupManager", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceGroupManager();
      var od = new api.InstanceGroupManager.fromJson(o.toJson());
      checkInstanceGroupManager(od);
    });
  });


  unittest.group("obj-schema-InstanceGroupManagerActionsSummary", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceGroupManagerActionsSummary();
      var od = new api.InstanceGroupManagerActionsSummary.fromJson(o.toJson());
      checkInstanceGroupManagerActionsSummary(od);
    });
  });


  unittest.group("obj-schema-InstanceGroupManagerAggregatedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceGroupManagerAggregatedList();
      var od = new api.InstanceGroupManagerAggregatedList.fromJson(o.toJson());
      checkInstanceGroupManagerAggregatedList(od);
    });
  });


  unittest.group("obj-schema-InstanceGroupManagerList", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceGroupManagerList();
      var od = new api.InstanceGroupManagerList.fromJson(o.toJson());
      checkInstanceGroupManagerList(od);
    });
  });


  unittest.group("obj-schema-InstanceGroupManagersAbandonInstancesRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceGroupManagersAbandonInstancesRequest();
      var od = new api.InstanceGroupManagersAbandonInstancesRequest.fromJson(o.toJson());
      checkInstanceGroupManagersAbandonInstancesRequest(od);
    });
  });


  unittest.group("obj-schema-InstanceGroupManagersDeleteInstancesRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceGroupManagersDeleteInstancesRequest();
      var od = new api.InstanceGroupManagersDeleteInstancesRequest.fromJson(o.toJson());
      checkInstanceGroupManagersDeleteInstancesRequest(od);
    });
  });


  unittest.group("obj-schema-InstanceGroupManagersListManagedInstancesResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceGroupManagersListManagedInstancesResponse();
      var od = new api.InstanceGroupManagersListManagedInstancesResponse.fromJson(o.toJson());
      checkInstanceGroupManagersListManagedInstancesResponse(od);
    });
  });


  unittest.group("obj-schema-InstanceGroupManagersRecreateInstancesRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceGroupManagersRecreateInstancesRequest();
      var od = new api.InstanceGroupManagersRecreateInstancesRequest.fromJson(o.toJson());
      checkInstanceGroupManagersRecreateInstancesRequest(od);
    });
  });


  unittest.group("obj-schema-InstanceGroupManagersScopedListWarningData", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceGroupManagersScopedListWarningData();
      var od = new api.InstanceGroupManagersScopedListWarningData.fromJson(o.toJson());
      checkInstanceGroupManagersScopedListWarningData(od);
    });
  });


  unittest.group("obj-schema-InstanceGroupManagersScopedListWarning", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceGroupManagersScopedListWarning();
      var od = new api.InstanceGroupManagersScopedListWarning.fromJson(o.toJson());
      checkInstanceGroupManagersScopedListWarning(od);
    });
  });


  unittest.group("obj-schema-InstanceGroupManagersScopedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceGroupManagersScopedList();
      var od = new api.InstanceGroupManagersScopedList.fromJson(o.toJson());
      checkInstanceGroupManagersScopedList(od);
    });
  });


  unittest.group("obj-schema-InstanceGroupManagersSetInstanceTemplateRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceGroupManagersSetInstanceTemplateRequest();
      var od = new api.InstanceGroupManagersSetInstanceTemplateRequest.fromJson(o.toJson());
      checkInstanceGroupManagersSetInstanceTemplateRequest(od);
    });
  });


  unittest.group("obj-schema-InstanceGroupManagersSetTargetPoolsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceGroupManagersSetTargetPoolsRequest();
      var od = new api.InstanceGroupManagersSetTargetPoolsRequest.fromJson(o.toJson());
      checkInstanceGroupManagersSetTargetPoolsRequest(od);
    });
  });


  unittest.group("obj-schema-InstanceGroupsAddInstancesRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceGroupsAddInstancesRequest();
      var od = new api.InstanceGroupsAddInstancesRequest.fromJson(o.toJson());
      checkInstanceGroupsAddInstancesRequest(od);
    });
  });


  unittest.group("obj-schema-InstanceGroupsListInstances", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceGroupsListInstances();
      var od = new api.InstanceGroupsListInstances.fromJson(o.toJson());
      checkInstanceGroupsListInstances(od);
    });
  });


  unittest.group("obj-schema-InstanceGroupsListInstancesRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceGroupsListInstancesRequest();
      var od = new api.InstanceGroupsListInstancesRequest.fromJson(o.toJson());
      checkInstanceGroupsListInstancesRequest(od);
    });
  });


  unittest.group("obj-schema-InstanceGroupsRemoveInstancesRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceGroupsRemoveInstancesRequest();
      var od = new api.InstanceGroupsRemoveInstancesRequest.fromJson(o.toJson());
      checkInstanceGroupsRemoveInstancesRequest(od);
    });
  });


  unittest.group("obj-schema-InstanceGroupsScopedListWarningData", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceGroupsScopedListWarningData();
      var od = new api.InstanceGroupsScopedListWarningData.fromJson(o.toJson());
      checkInstanceGroupsScopedListWarningData(od);
    });
  });


  unittest.group("obj-schema-InstanceGroupsScopedListWarning", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceGroupsScopedListWarning();
      var od = new api.InstanceGroupsScopedListWarning.fromJson(o.toJson());
      checkInstanceGroupsScopedListWarning(od);
    });
  });


  unittest.group("obj-schema-InstanceGroupsScopedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceGroupsScopedList();
      var od = new api.InstanceGroupsScopedList.fromJson(o.toJson());
      checkInstanceGroupsScopedList(od);
    });
  });


  unittest.group("obj-schema-InstanceGroupsSetNamedPortsRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceGroupsSetNamedPortsRequest();
      var od = new api.InstanceGroupsSetNamedPortsRequest.fromJson(o.toJson());
      checkInstanceGroupsSetNamedPortsRequest(od);
    });
  });


  unittest.group("obj-schema-InstanceList", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceList();
      var od = new api.InstanceList.fromJson(o.toJson());
      checkInstanceList(od);
    });
  });


  unittest.group("obj-schema-InstanceMoveRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceMoveRequest();
      var od = new api.InstanceMoveRequest.fromJson(o.toJson());
      checkInstanceMoveRequest(od);
    });
  });


  unittest.group("obj-schema-InstanceProperties", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceProperties();
      var od = new api.InstanceProperties.fromJson(o.toJson());
      checkInstanceProperties(od);
    });
  });


  unittest.group("obj-schema-InstanceReference", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceReference();
      var od = new api.InstanceReference.fromJson(o.toJson());
      checkInstanceReference(od);
    });
  });


  unittest.group("obj-schema-InstanceTemplate", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceTemplate();
      var od = new api.InstanceTemplate.fromJson(o.toJson());
      checkInstanceTemplate(od);
    });
  });


  unittest.group("obj-schema-InstanceTemplateList", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceTemplateList();
      var od = new api.InstanceTemplateList.fromJson(o.toJson());
      checkInstanceTemplateList(od);
    });
  });


  unittest.group("obj-schema-InstanceWithNamedPorts", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstanceWithNamedPorts();
      var od = new api.InstanceWithNamedPorts.fromJson(o.toJson());
      checkInstanceWithNamedPorts(od);
    });
  });


  unittest.group("obj-schema-InstancesScopedListWarningData", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstancesScopedListWarningData();
      var od = new api.InstancesScopedListWarningData.fromJson(o.toJson());
      checkInstancesScopedListWarningData(od);
    });
  });


  unittest.group("obj-schema-InstancesScopedListWarning", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstancesScopedListWarning();
      var od = new api.InstancesScopedListWarning.fromJson(o.toJson());
      checkInstancesScopedListWarning(od);
    });
  });


  unittest.group("obj-schema-InstancesScopedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstancesScopedList();
      var od = new api.InstancesScopedList.fromJson(o.toJson());
      checkInstancesScopedList(od);
    });
  });


  unittest.group("obj-schema-InstancesSetMachineTypeRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstancesSetMachineTypeRequest();
      var od = new api.InstancesSetMachineTypeRequest.fromJson(o.toJson());
      checkInstancesSetMachineTypeRequest(od);
    });
  });


  unittest.group("obj-schema-InstancesStartWithEncryptionKeyRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildInstancesStartWithEncryptionKeyRequest();
      var od = new api.InstancesStartWithEncryptionKeyRequest.fromJson(o.toJson());
      checkInstancesStartWithEncryptionKeyRequest(od);
    });
  });


  unittest.group("obj-schema-License", () {
    unittest.test("to-json--from-json", () {
      var o = buildLicense();
      var od = new api.License.fromJson(o.toJson());
      checkLicense(od);
    });
  });


  unittest.group("obj-schema-MachineTypeScratchDisks", () {
    unittest.test("to-json--from-json", () {
      var o = buildMachineTypeScratchDisks();
      var od = new api.MachineTypeScratchDisks.fromJson(o.toJson());
      checkMachineTypeScratchDisks(od);
    });
  });


  unittest.group("obj-schema-MachineType", () {
    unittest.test("to-json--from-json", () {
      var o = buildMachineType();
      var od = new api.MachineType.fromJson(o.toJson());
      checkMachineType(od);
    });
  });


  unittest.group("obj-schema-MachineTypeAggregatedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildMachineTypeAggregatedList();
      var od = new api.MachineTypeAggregatedList.fromJson(o.toJson());
      checkMachineTypeAggregatedList(od);
    });
  });


  unittest.group("obj-schema-MachineTypeList", () {
    unittest.test("to-json--from-json", () {
      var o = buildMachineTypeList();
      var od = new api.MachineTypeList.fromJson(o.toJson());
      checkMachineTypeList(od);
    });
  });


  unittest.group("obj-schema-MachineTypesScopedListWarningData", () {
    unittest.test("to-json--from-json", () {
      var o = buildMachineTypesScopedListWarningData();
      var od = new api.MachineTypesScopedListWarningData.fromJson(o.toJson());
      checkMachineTypesScopedListWarningData(od);
    });
  });


  unittest.group("obj-schema-MachineTypesScopedListWarning", () {
    unittest.test("to-json--from-json", () {
      var o = buildMachineTypesScopedListWarning();
      var od = new api.MachineTypesScopedListWarning.fromJson(o.toJson());
      checkMachineTypesScopedListWarning(od);
    });
  });


  unittest.group("obj-schema-MachineTypesScopedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildMachineTypesScopedList();
      var od = new api.MachineTypesScopedList.fromJson(o.toJson());
      checkMachineTypesScopedList(od);
    });
  });


  unittest.group("obj-schema-ManagedInstance", () {
    unittest.test("to-json--from-json", () {
      var o = buildManagedInstance();
      var od = new api.ManagedInstance.fromJson(o.toJson());
      checkManagedInstance(od);
    });
  });


  unittest.group("obj-schema-ManagedInstanceLastAttemptErrorsErrors", () {
    unittest.test("to-json--from-json", () {
      var o = buildManagedInstanceLastAttemptErrorsErrors();
      var od = new api.ManagedInstanceLastAttemptErrorsErrors.fromJson(o.toJson());
      checkManagedInstanceLastAttemptErrorsErrors(od);
    });
  });


  unittest.group("obj-schema-ManagedInstanceLastAttemptErrors", () {
    unittest.test("to-json--from-json", () {
      var o = buildManagedInstanceLastAttemptErrors();
      var od = new api.ManagedInstanceLastAttemptErrors.fromJson(o.toJson());
      checkManagedInstanceLastAttemptErrors(od);
    });
  });


  unittest.group("obj-schema-ManagedInstanceLastAttempt", () {
    unittest.test("to-json--from-json", () {
      var o = buildManagedInstanceLastAttempt();
      var od = new api.ManagedInstanceLastAttempt.fromJson(o.toJson());
      checkManagedInstanceLastAttempt(od);
    });
  });


  unittest.group("obj-schema-MetadataItems", () {
    unittest.test("to-json--from-json", () {
      var o = buildMetadataItems();
      var od = new api.MetadataItems.fromJson(o.toJson());
      checkMetadataItems(od);
    });
  });


  unittest.group("obj-schema-Metadata", () {
    unittest.test("to-json--from-json", () {
      var o = buildMetadata();
      var od = new api.Metadata.fromJson(o.toJson());
      checkMetadata(od);
    });
  });


  unittest.group("obj-schema-NamedPort", () {
    unittest.test("to-json--from-json", () {
      var o = buildNamedPort();
      var od = new api.NamedPort.fromJson(o.toJson());
      checkNamedPort(od);
    });
  });


  unittest.group("obj-schema-Network", () {
    unittest.test("to-json--from-json", () {
      var o = buildNetwork();
      var od = new api.Network.fromJson(o.toJson());
      checkNetwork(od);
    });
  });


  unittest.group("obj-schema-NetworkInterface", () {
    unittest.test("to-json--from-json", () {
      var o = buildNetworkInterface();
      var od = new api.NetworkInterface.fromJson(o.toJson());
      checkNetworkInterface(od);
    });
  });


  unittest.group("obj-schema-NetworkList", () {
    unittest.test("to-json--from-json", () {
      var o = buildNetworkList();
      var od = new api.NetworkList.fromJson(o.toJson());
      checkNetworkList(od);
    });
  });


  unittest.group("obj-schema-OperationErrorErrors", () {
    unittest.test("to-json--from-json", () {
      var o = buildOperationErrorErrors();
      var od = new api.OperationErrorErrors.fromJson(o.toJson());
      checkOperationErrorErrors(od);
    });
  });


  unittest.group("obj-schema-OperationError", () {
    unittest.test("to-json--from-json", () {
      var o = buildOperationError();
      var od = new api.OperationError.fromJson(o.toJson());
      checkOperationError(od);
    });
  });


  unittest.group("obj-schema-OperationWarningsData", () {
    unittest.test("to-json--from-json", () {
      var o = buildOperationWarningsData();
      var od = new api.OperationWarningsData.fromJson(o.toJson());
      checkOperationWarningsData(od);
    });
  });


  unittest.group("obj-schema-OperationWarnings", () {
    unittest.test("to-json--from-json", () {
      var o = buildOperationWarnings();
      var od = new api.OperationWarnings.fromJson(o.toJson());
      checkOperationWarnings(od);
    });
  });


  unittest.group("obj-schema-Operation", () {
    unittest.test("to-json--from-json", () {
      var o = buildOperation();
      var od = new api.Operation.fromJson(o.toJson());
      checkOperation(od);
    });
  });


  unittest.group("obj-schema-OperationAggregatedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildOperationAggregatedList();
      var od = new api.OperationAggregatedList.fromJson(o.toJson());
      checkOperationAggregatedList(od);
    });
  });


  unittest.group("obj-schema-OperationList", () {
    unittest.test("to-json--from-json", () {
      var o = buildOperationList();
      var od = new api.OperationList.fromJson(o.toJson());
      checkOperationList(od);
    });
  });


  unittest.group("obj-schema-OperationsScopedListWarningData", () {
    unittest.test("to-json--from-json", () {
      var o = buildOperationsScopedListWarningData();
      var od = new api.OperationsScopedListWarningData.fromJson(o.toJson());
      checkOperationsScopedListWarningData(od);
    });
  });


  unittest.group("obj-schema-OperationsScopedListWarning", () {
    unittest.test("to-json--from-json", () {
      var o = buildOperationsScopedListWarning();
      var od = new api.OperationsScopedListWarning.fromJson(o.toJson());
      checkOperationsScopedListWarning(od);
    });
  });


  unittest.group("obj-schema-OperationsScopedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildOperationsScopedList();
      var od = new api.OperationsScopedList.fromJson(o.toJson());
      checkOperationsScopedList(od);
    });
  });


  unittest.group("obj-schema-PathMatcher", () {
    unittest.test("to-json--from-json", () {
      var o = buildPathMatcher();
      var od = new api.PathMatcher.fromJson(o.toJson());
      checkPathMatcher(od);
    });
  });


  unittest.group("obj-schema-PathRule", () {
    unittest.test("to-json--from-json", () {
      var o = buildPathRule();
      var od = new api.PathRule.fromJson(o.toJson());
      checkPathRule(od);
    });
  });


  unittest.group("obj-schema-Project", () {
    unittest.test("to-json--from-json", () {
      var o = buildProject();
      var od = new api.Project.fromJson(o.toJson());
      checkProject(od);
    });
  });


  unittest.group("obj-schema-Quota", () {
    unittest.test("to-json--from-json", () {
      var o = buildQuota();
      var od = new api.Quota.fromJson(o.toJson());
      checkQuota(od);
    });
  });


  unittest.group("obj-schema-Region", () {
    unittest.test("to-json--from-json", () {
      var o = buildRegion();
      var od = new api.Region.fromJson(o.toJson());
      checkRegion(od);
    });
  });


  unittest.group("obj-schema-RegionList", () {
    unittest.test("to-json--from-json", () {
      var o = buildRegionList();
      var od = new api.RegionList.fromJson(o.toJson());
      checkRegionList(od);
    });
  });


  unittest.group("obj-schema-ResourceGroupReference", () {
    unittest.test("to-json--from-json", () {
      var o = buildResourceGroupReference();
      var od = new api.ResourceGroupReference.fromJson(o.toJson());
      checkResourceGroupReference(od);
    });
  });


  unittest.group("obj-schema-RouteWarningsData", () {
    unittest.test("to-json--from-json", () {
      var o = buildRouteWarningsData();
      var od = new api.RouteWarningsData.fromJson(o.toJson());
      checkRouteWarningsData(od);
    });
  });


  unittest.group("obj-schema-RouteWarnings", () {
    unittest.test("to-json--from-json", () {
      var o = buildRouteWarnings();
      var od = new api.RouteWarnings.fromJson(o.toJson());
      checkRouteWarnings(od);
    });
  });


  unittest.group("obj-schema-Route", () {
    unittest.test("to-json--from-json", () {
      var o = buildRoute();
      var od = new api.Route.fromJson(o.toJson());
      checkRoute(od);
    });
  });


  unittest.group("obj-schema-RouteList", () {
    unittest.test("to-json--from-json", () {
      var o = buildRouteList();
      var od = new api.RouteList.fromJson(o.toJson());
      checkRouteList(od);
    });
  });


  unittest.group("obj-schema-Router", () {
    unittest.test("to-json--from-json", () {
      var o = buildRouter();
      var od = new api.Router.fromJson(o.toJson());
      checkRouter(od);
    });
  });


  unittest.group("obj-schema-RouterAggregatedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildRouterAggregatedList();
      var od = new api.RouterAggregatedList.fromJson(o.toJson());
      checkRouterAggregatedList(od);
    });
  });


  unittest.group("obj-schema-RouterBgp", () {
    unittest.test("to-json--from-json", () {
      var o = buildRouterBgp();
      var od = new api.RouterBgp.fromJson(o.toJson());
      checkRouterBgp(od);
    });
  });


  unittest.group("obj-schema-RouterBgpPeer", () {
    unittest.test("to-json--from-json", () {
      var o = buildRouterBgpPeer();
      var od = new api.RouterBgpPeer.fromJson(o.toJson());
      checkRouterBgpPeer(od);
    });
  });


  unittest.group("obj-schema-RouterInterface", () {
    unittest.test("to-json--from-json", () {
      var o = buildRouterInterface();
      var od = new api.RouterInterface.fromJson(o.toJson());
      checkRouterInterface(od);
    });
  });


  unittest.group("obj-schema-RouterList", () {
    unittest.test("to-json--from-json", () {
      var o = buildRouterList();
      var od = new api.RouterList.fromJson(o.toJson());
      checkRouterList(od);
    });
  });


  unittest.group("obj-schema-RouterStatus", () {
    unittest.test("to-json--from-json", () {
      var o = buildRouterStatus();
      var od = new api.RouterStatus.fromJson(o.toJson());
      checkRouterStatus(od);
    });
  });


  unittest.group("obj-schema-RouterStatusBgpPeerStatus", () {
    unittest.test("to-json--from-json", () {
      var o = buildRouterStatusBgpPeerStatus();
      var od = new api.RouterStatusBgpPeerStatus.fromJson(o.toJson());
      checkRouterStatusBgpPeerStatus(od);
    });
  });


  unittest.group("obj-schema-RouterStatusResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildRouterStatusResponse();
      var od = new api.RouterStatusResponse.fromJson(o.toJson());
      checkRouterStatusResponse(od);
    });
  });


  unittest.group("obj-schema-RoutersPreviewResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildRoutersPreviewResponse();
      var od = new api.RoutersPreviewResponse.fromJson(o.toJson());
      checkRoutersPreviewResponse(od);
    });
  });


  unittest.group("obj-schema-RoutersScopedListWarningData", () {
    unittest.test("to-json--from-json", () {
      var o = buildRoutersScopedListWarningData();
      var od = new api.RoutersScopedListWarningData.fromJson(o.toJson());
      checkRoutersScopedListWarningData(od);
    });
  });


  unittest.group("obj-schema-RoutersScopedListWarning", () {
    unittest.test("to-json--from-json", () {
      var o = buildRoutersScopedListWarning();
      var od = new api.RoutersScopedListWarning.fromJson(o.toJson());
      checkRoutersScopedListWarning(od);
    });
  });


  unittest.group("obj-schema-RoutersScopedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildRoutersScopedList();
      var od = new api.RoutersScopedList.fromJson(o.toJson());
      checkRoutersScopedList(od);
    });
  });


  unittest.group("obj-schema-Scheduling", () {
    unittest.test("to-json--from-json", () {
      var o = buildScheduling();
      var od = new api.Scheduling.fromJson(o.toJson());
      checkScheduling(od);
    });
  });


  unittest.group("obj-schema-SerialPortOutput", () {
    unittest.test("to-json--from-json", () {
      var o = buildSerialPortOutput();
      var od = new api.SerialPortOutput.fromJson(o.toJson());
      checkSerialPortOutput(od);
    });
  });


  unittest.group("obj-schema-ServiceAccount", () {
    unittest.test("to-json--from-json", () {
      var o = buildServiceAccount();
      var od = new api.ServiceAccount.fromJson(o.toJson());
      checkServiceAccount(od);
    });
  });


  unittest.group("obj-schema-Snapshot", () {
    unittest.test("to-json--from-json", () {
      var o = buildSnapshot();
      var od = new api.Snapshot.fromJson(o.toJson());
      checkSnapshot(od);
    });
  });


  unittest.group("obj-schema-SnapshotList", () {
    unittest.test("to-json--from-json", () {
      var o = buildSnapshotList();
      var od = new api.SnapshotList.fromJson(o.toJson());
      checkSnapshotList(od);
    });
  });


  unittest.group("obj-schema-SslCertificate", () {
    unittest.test("to-json--from-json", () {
      var o = buildSslCertificate();
      var od = new api.SslCertificate.fromJson(o.toJson());
      checkSslCertificate(od);
    });
  });


  unittest.group("obj-schema-SslCertificateList", () {
    unittest.test("to-json--from-json", () {
      var o = buildSslCertificateList();
      var od = new api.SslCertificateList.fromJson(o.toJson());
      checkSslCertificateList(od);
    });
  });


  unittest.group("obj-schema-Subnetwork", () {
    unittest.test("to-json--from-json", () {
      var o = buildSubnetwork();
      var od = new api.Subnetwork.fromJson(o.toJson());
      checkSubnetwork(od);
    });
  });


  unittest.group("obj-schema-SubnetworkAggregatedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildSubnetworkAggregatedList();
      var od = new api.SubnetworkAggregatedList.fromJson(o.toJson());
      checkSubnetworkAggregatedList(od);
    });
  });


  unittest.group("obj-schema-SubnetworkList", () {
    unittest.test("to-json--from-json", () {
      var o = buildSubnetworkList();
      var od = new api.SubnetworkList.fromJson(o.toJson());
      checkSubnetworkList(od);
    });
  });


  unittest.group("obj-schema-SubnetworksScopedListWarningData", () {
    unittest.test("to-json--from-json", () {
      var o = buildSubnetworksScopedListWarningData();
      var od = new api.SubnetworksScopedListWarningData.fromJson(o.toJson());
      checkSubnetworksScopedListWarningData(od);
    });
  });


  unittest.group("obj-schema-SubnetworksScopedListWarning", () {
    unittest.test("to-json--from-json", () {
      var o = buildSubnetworksScopedListWarning();
      var od = new api.SubnetworksScopedListWarning.fromJson(o.toJson());
      checkSubnetworksScopedListWarning(od);
    });
  });


  unittest.group("obj-schema-SubnetworksScopedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildSubnetworksScopedList();
      var od = new api.SubnetworksScopedList.fromJson(o.toJson());
      checkSubnetworksScopedList(od);
    });
  });


  unittest.group("obj-schema-Tags", () {
    unittest.test("to-json--from-json", () {
      var o = buildTags();
      var od = new api.Tags.fromJson(o.toJson());
      checkTags(od);
    });
  });


  unittest.group("obj-schema-TargetHttpProxy", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetHttpProxy();
      var od = new api.TargetHttpProxy.fromJson(o.toJson());
      checkTargetHttpProxy(od);
    });
  });


  unittest.group("obj-schema-TargetHttpProxyList", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetHttpProxyList();
      var od = new api.TargetHttpProxyList.fromJson(o.toJson());
      checkTargetHttpProxyList(od);
    });
  });


  unittest.group("obj-schema-TargetHttpsProxiesSetSslCertificatesRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetHttpsProxiesSetSslCertificatesRequest();
      var od = new api.TargetHttpsProxiesSetSslCertificatesRequest.fromJson(o.toJson());
      checkTargetHttpsProxiesSetSslCertificatesRequest(od);
    });
  });


  unittest.group("obj-schema-TargetHttpsProxy", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetHttpsProxy();
      var od = new api.TargetHttpsProxy.fromJson(o.toJson());
      checkTargetHttpsProxy(od);
    });
  });


  unittest.group("obj-schema-TargetHttpsProxyList", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetHttpsProxyList();
      var od = new api.TargetHttpsProxyList.fromJson(o.toJson());
      checkTargetHttpsProxyList(od);
    });
  });


  unittest.group("obj-schema-TargetInstance", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetInstance();
      var od = new api.TargetInstance.fromJson(o.toJson());
      checkTargetInstance(od);
    });
  });


  unittest.group("obj-schema-TargetInstanceAggregatedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetInstanceAggregatedList();
      var od = new api.TargetInstanceAggregatedList.fromJson(o.toJson());
      checkTargetInstanceAggregatedList(od);
    });
  });


  unittest.group("obj-schema-TargetInstanceList", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetInstanceList();
      var od = new api.TargetInstanceList.fromJson(o.toJson());
      checkTargetInstanceList(od);
    });
  });


  unittest.group("obj-schema-TargetInstancesScopedListWarningData", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetInstancesScopedListWarningData();
      var od = new api.TargetInstancesScopedListWarningData.fromJson(o.toJson());
      checkTargetInstancesScopedListWarningData(od);
    });
  });


  unittest.group("obj-schema-TargetInstancesScopedListWarning", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetInstancesScopedListWarning();
      var od = new api.TargetInstancesScopedListWarning.fromJson(o.toJson());
      checkTargetInstancesScopedListWarning(od);
    });
  });


  unittest.group("obj-schema-TargetInstancesScopedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetInstancesScopedList();
      var od = new api.TargetInstancesScopedList.fromJson(o.toJson());
      checkTargetInstancesScopedList(od);
    });
  });


  unittest.group("obj-schema-TargetPool", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetPool();
      var od = new api.TargetPool.fromJson(o.toJson());
      checkTargetPool(od);
    });
  });


  unittest.group("obj-schema-TargetPoolAggregatedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetPoolAggregatedList();
      var od = new api.TargetPoolAggregatedList.fromJson(o.toJson());
      checkTargetPoolAggregatedList(od);
    });
  });


  unittest.group("obj-schema-TargetPoolInstanceHealth", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetPoolInstanceHealth();
      var od = new api.TargetPoolInstanceHealth.fromJson(o.toJson());
      checkTargetPoolInstanceHealth(od);
    });
  });


  unittest.group("obj-schema-TargetPoolList", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetPoolList();
      var od = new api.TargetPoolList.fromJson(o.toJson());
      checkTargetPoolList(od);
    });
  });


  unittest.group("obj-schema-TargetPoolsAddHealthCheckRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetPoolsAddHealthCheckRequest();
      var od = new api.TargetPoolsAddHealthCheckRequest.fromJson(o.toJson());
      checkTargetPoolsAddHealthCheckRequest(od);
    });
  });


  unittest.group("obj-schema-TargetPoolsAddInstanceRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetPoolsAddInstanceRequest();
      var od = new api.TargetPoolsAddInstanceRequest.fromJson(o.toJson());
      checkTargetPoolsAddInstanceRequest(od);
    });
  });


  unittest.group("obj-schema-TargetPoolsRemoveHealthCheckRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetPoolsRemoveHealthCheckRequest();
      var od = new api.TargetPoolsRemoveHealthCheckRequest.fromJson(o.toJson());
      checkTargetPoolsRemoveHealthCheckRequest(od);
    });
  });


  unittest.group("obj-schema-TargetPoolsRemoveInstanceRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetPoolsRemoveInstanceRequest();
      var od = new api.TargetPoolsRemoveInstanceRequest.fromJson(o.toJson());
      checkTargetPoolsRemoveInstanceRequest(od);
    });
  });


  unittest.group("obj-schema-TargetPoolsScopedListWarningData", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetPoolsScopedListWarningData();
      var od = new api.TargetPoolsScopedListWarningData.fromJson(o.toJson());
      checkTargetPoolsScopedListWarningData(od);
    });
  });


  unittest.group("obj-schema-TargetPoolsScopedListWarning", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetPoolsScopedListWarning();
      var od = new api.TargetPoolsScopedListWarning.fromJson(o.toJson());
      checkTargetPoolsScopedListWarning(od);
    });
  });


  unittest.group("obj-schema-TargetPoolsScopedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetPoolsScopedList();
      var od = new api.TargetPoolsScopedList.fromJson(o.toJson());
      checkTargetPoolsScopedList(od);
    });
  });


  unittest.group("obj-schema-TargetReference", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetReference();
      var od = new api.TargetReference.fromJson(o.toJson());
      checkTargetReference(od);
    });
  });


  unittest.group("obj-schema-TargetVpnGateway", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetVpnGateway();
      var od = new api.TargetVpnGateway.fromJson(o.toJson());
      checkTargetVpnGateway(od);
    });
  });


  unittest.group("obj-schema-TargetVpnGatewayAggregatedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetVpnGatewayAggregatedList();
      var od = new api.TargetVpnGatewayAggregatedList.fromJson(o.toJson());
      checkTargetVpnGatewayAggregatedList(od);
    });
  });


  unittest.group("obj-schema-TargetVpnGatewayList", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetVpnGatewayList();
      var od = new api.TargetVpnGatewayList.fromJson(o.toJson());
      checkTargetVpnGatewayList(od);
    });
  });


  unittest.group("obj-schema-TargetVpnGatewaysScopedListWarningData", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetVpnGatewaysScopedListWarningData();
      var od = new api.TargetVpnGatewaysScopedListWarningData.fromJson(o.toJson());
      checkTargetVpnGatewaysScopedListWarningData(od);
    });
  });


  unittest.group("obj-schema-TargetVpnGatewaysScopedListWarning", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetVpnGatewaysScopedListWarning();
      var od = new api.TargetVpnGatewaysScopedListWarning.fromJson(o.toJson());
      checkTargetVpnGatewaysScopedListWarning(od);
    });
  });


  unittest.group("obj-schema-TargetVpnGatewaysScopedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildTargetVpnGatewaysScopedList();
      var od = new api.TargetVpnGatewaysScopedList.fromJson(o.toJson());
      checkTargetVpnGatewaysScopedList(od);
    });
  });


  unittest.group("obj-schema-TestFailure", () {
    unittest.test("to-json--from-json", () {
      var o = buildTestFailure();
      var od = new api.TestFailure.fromJson(o.toJson());
      checkTestFailure(od);
    });
  });


  unittest.group("obj-schema-UrlMap", () {
    unittest.test("to-json--from-json", () {
      var o = buildUrlMap();
      var od = new api.UrlMap.fromJson(o.toJson());
      checkUrlMap(od);
    });
  });


  unittest.group("obj-schema-UrlMapList", () {
    unittest.test("to-json--from-json", () {
      var o = buildUrlMapList();
      var od = new api.UrlMapList.fromJson(o.toJson());
      checkUrlMapList(od);
    });
  });


  unittest.group("obj-schema-UrlMapReference", () {
    unittest.test("to-json--from-json", () {
      var o = buildUrlMapReference();
      var od = new api.UrlMapReference.fromJson(o.toJson());
      checkUrlMapReference(od);
    });
  });


  unittest.group("obj-schema-UrlMapTest", () {
    unittest.test("to-json--from-json", () {
      var o = buildUrlMapTest();
      var od = new api.UrlMapTest.fromJson(o.toJson());
      checkUrlMapTest(od);
    });
  });


  unittest.group("obj-schema-UrlMapValidationResult", () {
    unittest.test("to-json--from-json", () {
      var o = buildUrlMapValidationResult();
      var od = new api.UrlMapValidationResult.fromJson(o.toJson());
      checkUrlMapValidationResult(od);
    });
  });


  unittest.group("obj-schema-UrlMapsValidateRequest", () {
    unittest.test("to-json--from-json", () {
      var o = buildUrlMapsValidateRequest();
      var od = new api.UrlMapsValidateRequest.fromJson(o.toJson());
      checkUrlMapsValidateRequest(od);
    });
  });


  unittest.group("obj-schema-UrlMapsValidateResponse", () {
    unittest.test("to-json--from-json", () {
      var o = buildUrlMapsValidateResponse();
      var od = new api.UrlMapsValidateResponse.fromJson(o.toJson());
      checkUrlMapsValidateResponse(od);
    });
  });


  unittest.group("obj-schema-UsageExportLocation", () {
    unittest.test("to-json--from-json", () {
      var o = buildUsageExportLocation();
      var od = new api.UsageExportLocation.fromJson(o.toJson());
      checkUsageExportLocation(od);
    });
  });


  unittest.group("obj-schema-VpnTunnel", () {
    unittest.test("to-json--from-json", () {
      var o = buildVpnTunnel();
      var od = new api.VpnTunnel.fromJson(o.toJson());
      checkVpnTunnel(od);
    });
  });


  unittest.group("obj-schema-VpnTunnelAggregatedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildVpnTunnelAggregatedList();
      var od = new api.VpnTunnelAggregatedList.fromJson(o.toJson());
      checkVpnTunnelAggregatedList(od);
    });
  });


  unittest.group("obj-schema-VpnTunnelList", () {
    unittest.test("to-json--from-json", () {
      var o = buildVpnTunnelList();
      var od = new api.VpnTunnelList.fromJson(o.toJson());
      checkVpnTunnelList(od);
    });
  });


  unittest.group("obj-schema-VpnTunnelsScopedListWarningData", () {
    unittest.test("to-json--from-json", () {
      var o = buildVpnTunnelsScopedListWarningData();
      var od = new api.VpnTunnelsScopedListWarningData.fromJson(o.toJson());
      checkVpnTunnelsScopedListWarningData(od);
    });
  });


  unittest.group("obj-schema-VpnTunnelsScopedListWarning", () {
    unittest.test("to-json--from-json", () {
      var o = buildVpnTunnelsScopedListWarning();
      var od = new api.VpnTunnelsScopedListWarning.fromJson(o.toJson());
      checkVpnTunnelsScopedListWarning(od);
    });
  });


  unittest.group("obj-schema-VpnTunnelsScopedList", () {
    unittest.test("to-json--from-json", () {
      var o = buildVpnTunnelsScopedList();
      var od = new api.VpnTunnelsScopedList.fromJson(o.toJson());
      checkVpnTunnelsScopedList(od);
    });
  });


  unittest.group("obj-schema-Zone", () {
    unittest.test("to-json--from-json", () {
      var o = buildZone();
      var od = new api.Zone.fromJson(o.toJson());
      checkZone(od);
    });
  });


  unittest.group("obj-schema-ZoneList", () {
    unittest.test("to-json--from-json", () {
      var o = buildZoneList();
      var od = new api.ZoneList.fromJson(o.toJson());
      checkZoneList(od);
    });
  });


  unittest.group("resource-AddressesResourceApi", () {
    unittest.test("method--aggregatedList", () {

      var mock = new HttpServerMock();
      api.AddressesResourceApi res = new api.ComputeApi(mock).addresses;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAddressAggregatedList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.aggregatedList(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.AddressAggregatedList response) {
        checkAddressAggregatedList(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.AddressesResourceApi res = new api.ComputeApi(mock).addresses;
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_address = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_region, arg_address).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.AddressesResourceApi res = new api.ComputeApi(mock).addresses;
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_address = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAddress());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_region, arg_address).then(unittest.expectAsync(((api.Address response) {
        checkAddress(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.AddressesResourceApi res = new api.ComputeApi(mock).addresses;
      var arg_request = buildAddress();
      var arg_project = "foo";
      var arg_region = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Address.fromJson(json);
        checkAddress(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project, arg_region).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.AddressesResourceApi res = new api.ComputeApi(mock).addresses;
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAddressList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, arg_region, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.AddressList response) {
        checkAddressList(response);
      })));
    });

  });


  unittest.group("resource-AutoscalersResourceApi", () {
    unittest.test("method--aggregatedList", () {

      var mock = new HttpServerMock();
      api.AutoscalersResourceApi res = new api.ComputeApi(mock).autoscalers;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAutoscalerAggregatedList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.aggregatedList(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.AutoscalerAggregatedList response) {
        checkAutoscalerAggregatedList(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.AutoscalersResourceApi res = new api.ComputeApi(mock).autoscalers;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_autoscaler = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_zone, arg_autoscaler).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.AutoscalersResourceApi res = new api.ComputeApi(mock).autoscalers;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_autoscaler = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAutoscaler());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_zone, arg_autoscaler).then(unittest.expectAsync(((api.Autoscaler response) {
        checkAutoscaler(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.AutoscalersResourceApi res = new api.ComputeApi(mock).autoscalers;
      var arg_request = buildAutoscaler();
      var arg_project = "foo";
      var arg_zone = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Autoscaler.fromJson(json);
        checkAutoscaler(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project, arg_zone).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.AutoscalersResourceApi res = new api.ComputeApi(mock).autoscalers;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAutoscalerList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, arg_zone, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.AutoscalerList response) {
        checkAutoscalerList(response);
      })));
    });

    unittest.test("method--patch", () {

      var mock = new HttpServerMock();
      api.AutoscalersResourceApi res = new api.ComputeApi(mock).autoscalers;
      var arg_request = buildAutoscaler();
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_autoscaler = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Autoscaler.fromJson(json);
        checkAutoscaler(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["autoscaler"].first, unittest.equals(arg_autoscaler));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.patch(arg_request, arg_project, arg_zone, arg_autoscaler).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--update", () {

      var mock = new HttpServerMock();
      api.AutoscalersResourceApi res = new api.ComputeApi(mock).autoscalers;
      var arg_request = buildAutoscaler();
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_autoscaler = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Autoscaler.fromJson(json);
        checkAutoscaler(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["autoscaler"].first, unittest.equals(arg_autoscaler));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.update(arg_request, arg_project, arg_zone, autoscaler: arg_autoscaler).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

  });


  unittest.group("resource-BackendServicesResourceApi", () {
    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.BackendServicesResourceApi res = new api.ComputeApi(mock).backendServices;
      var arg_project = "foo";
      var arg_backendService = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_backendService).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.BackendServicesResourceApi res = new api.ComputeApi(mock).backendServices;
      var arg_project = "foo";
      var arg_backendService = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildBackendService());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_backendService).then(unittest.expectAsync(((api.BackendService response) {
        checkBackendService(response);
      })));
    });

    unittest.test("method--getHealth", () {

      var mock = new HttpServerMock();
      api.BackendServicesResourceApi res = new api.ComputeApi(mock).backendServices;
      var arg_request = buildResourceGroupReference();
      var arg_project = "foo";
      var arg_backendService = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.ResourceGroupReference.fromJson(json);
        checkResourceGroupReference(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildBackendServiceGroupHealth());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.getHealth(arg_request, arg_project, arg_backendService).then(unittest.expectAsync(((api.BackendServiceGroupHealth response) {
        checkBackendServiceGroupHealth(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.BackendServicesResourceApi res = new api.ComputeApi(mock).backendServices;
      var arg_request = buildBackendService();
      var arg_project = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.BackendService.fromJson(json);
        checkBackendService(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.BackendServicesResourceApi res = new api.ComputeApi(mock).backendServices;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildBackendServiceList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.BackendServiceList response) {
        checkBackendServiceList(response);
      })));
    });

    unittest.test("method--patch", () {

      var mock = new HttpServerMock();
      api.BackendServicesResourceApi res = new api.ComputeApi(mock).backendServices;
      var arg_request = buildBackendService();
      var arg_project = "foo";
      var arg_backendService = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.BackendService.fromJson(json);
        checkBackendService(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.patch(arg_request, arg_project, arg_backendService).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--update", () {

      var mock = new HttpServerMock();
      api.BackendServicesResourceApi res = new api.ComputeApi(mock).backendServices;
      var arg_request = buildBackendService();
      var arg_project = "foo";
      var arg_backendService = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.BackendService.fromJson(json);
        checkBackendService(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.update(arg_request, arg_project, arg_backendService).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

  });


  unittest.group("resource-DiskTypesResourceApi", () {
    unittest.test("method--aggregatedList", () {

      var mock = new HttpServerMock();
      api.DiskTypesResourceApi res = new api.ComputeApi(mock).diskTypes;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildDiskTypeAggregatedList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.aggregatedList(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.DiskTypeAggregatedList response) {
        checkDiskTypeAggregatedList(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.DiskTypesResourceApi res = new api.ComputeApi(mock).diskTypes;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_diskType = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildDiskType());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_zone, arg_diskType).then(unittest.expectAsync(((api.DiskType response) {
        checkDiskType(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.DiskTypesResourceApi res = new api.ComputeApi(mock).diskTypes;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildDiskTypeList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, arg_zone, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.DiskTypeList response) {
        checkDiskTypeList(response);
      })));
    });

  });


  unittest.group("resource-DisksResourceApi", () {
    unittest.test("method--aggregatedList", () {

      var mock = new HttpServerMock();
      api.DisksResourceApi res = new api.ComputeApi(mock).disks;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildDiskAggregatedList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.aggregatedList(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.DiskAggregatedList response) {
        checkDiskAggregatedList(response);
      })));
    });

    unittest.test("method--createSnapshot", () {

      var mock = new HttpServerMock();
      api.DisksResourceApi res = new api.ComputeApi(mock).disks;
      var arg_request = buildSnapshot();
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_disk = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Snapshot.fromJson(json);
        checkSnapshot(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.createSnapshot(arg_request, arg_project, arg_zone, arg_disk).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.DisksResourceApi res = new api.ComputeApi(mock).disks;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_disk = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_zone, arg_disk).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.DisksResourceApi res = new api.ComputeApi(mock).disks;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_disk = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildDisk());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_zone, arg_disk).then(unittest.expectAsync(((api.Disk response) {
        checkDisk(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.DisksResourceApi res = new api.ComputeApi(mock).disks;
      var arg_request = buildDisk();
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_sourceImage = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Disk.fromJson(json);
        checkDisk(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["sourceImage"].first, unittest.equals(arg_sourceImage));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project, arg_zone, sourceImage: arg_sourceImage).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.DisksResourceApi res = new api.ComputeApi(mock).disks;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildDiskList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, arg_zone, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.DiskList response) {
        checkDiskList(response);
      })));
    });

    unittest.test("method--resize", () {

      var mock = new HttpServerMock();
      api.DisksResourceApi res = new api.ComputeApi(mock).disks;
      var arg_request = buildDisksResizeRequest();
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_disk = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.DisksResizeRequest.fromJson(json);
        checkDisksResizeRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.resize(arg_request, arg_project, arg_zone, arg_disk).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

  });


  unittest.group("resource-FirewallsResourceApi", () {
    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.FirewallsResourceApi res = new api.ComputeApi(mock).firewalls;
      var arg_project = "foo";
      var arg_firewall = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_firewall).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.FirewallsResourceApi res = new api.ComputeApi(mock).firewalls;
      var arg_project = "foo";
      var arg_firewall = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildFirewall());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_firewall).then(unittest.expectAsync(((api.Firewall response) {
        checkFirewall(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.FirewallsResourceApi res = new api.ComputeApi(mock).firewalls;
      var arg_request = buildFirewall();
      var arg_project = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Firewall.fromJson(json);
        checkFirewall(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.FirewallsResourceApi res = new api.ComputeApi(mock).firewalls;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildFirewallList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.FirewallList response) {
        checkFirewallList(response);
      })));
    });

    unittest.test("method--patch", () {

      var mock = new HttpServerMock();
      api.FirewallsResourceApi res = new api.ComputeApi(mock).firewalls;
      var arg_request = buildFirewall();
      var arg_project = "foo";
      var arg_firewall = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Firewall.fromJson(json);
        checkFirewall(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.patch(arg_request, arg_project, arg_firewall).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--update", () {

      var mock = new HttpServerMock();
      api.FirewallsResourceApi res = new api.ComputeApi(mock).firewalls;
      var arg_request = buildFirewall();
      var arg_project = "foo";
      var arg_firewall = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Firewall.fromJson(json);
        checkFirewall(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.update(arg_request, arg_project, arg_firewall).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

  });


  unittest.group("resource-ForwardingRulesResourceApi", () {
    unittest.test("method--aggregatedList", () {

      var mock = new HttpServerMock();
      api.ForwardingRulesResourceApi res = new api.ComputeApi(mock).forwardingRules;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildForwardingRuleAggregatedList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.aggregatedList(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.ForwardingRuleAggregatedList response) {
        checkForwardingRuleAggregatedList(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.ForwardingRulesResourceApi res = new api.ComputeApi(mock).forwardingRules;
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_forwardingRule = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_region, arg_forwardingRule).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.ForwardingRulesResourceApi res = new api.ComputeApi(mock).forwardingRules;
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_forwardingRule = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildForwardingRule());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_region, arg_forwardingRule).then(unittest.expectAsync(((api.ForwardingRule response) {
        checkForwardingRule(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.ForwardingRulesResourceApi res = new api.ComputeApi(mock).forwardingRules;
      var arg_request = buildForwardingRule();
      var arg_project = "foo";
      var arg_region = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.ForwardingRule.fromJson(json);
        checkForwardingRule(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project, arg_region).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.ForwardingRulesResourceApi res = new api.ComputeApi(mock).forwardingRules;
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildForwardingRuleList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, arg_region, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.ForwardingRuleList response) {
        checkForwardingRuleList(response);
      })));
    });

    unittest.test("method--setTarget", () {

      var mock = new HttpServerMock();
      api.ForwardingRulesResourceApi res = new api.ComputeApi(mock).forwardingRules;
      var arg_request = buildTargetReference();
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_forwardingRule = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.TargetReference.fromJson(json);
        checkTargetReference(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.setTarget(arg_request, arg_project, arg_region, arg_forwardingRule).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

  });


  unittest.group("resource-GlobalAddressesResourceApi", () {
    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.GlobalAddressesResourceApi res = new api.ComputeApi(mock).globalAddresses;
      var arg_project = "foo";
      var arg_address = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_address).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.GlobalAddressesResourceApi res = new api.ComputeApi(mock).globalAddresses;
      var arg_project = "foo";
      var arg_address = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAddress());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_address).then(unittest.expectAsync(((api.Address response) {
        checkAddress(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.GlobalAddressesResourceApi res = new api.ComputeApi(mock).globalAddresses;
      var arg_request = buildAddress();
      var arg_project = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Address.fromJson(json);
        checkAddress(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.GlobalAddressesResourceApi res = new api.ComputeApi(mock).globalAddresses;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildAddressList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.AddressList response) {
        checkAddressList(response);
      })));
    });

  });


  unittest.group("resource-GlobalForwardingRulesResourceApi", () {
    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.GlobalForwardingRulesResourceApi res = new api.ComputeApi(mock).globalForwardingRules;
      var arg_project = "foo";
      var arg_forwardingRule = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_forwardingRule).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.GlobalForwardingRulesResourceApi res = new api.ComputeApi(mock).globalForwardingRules;
      var arg_project = "foo";
      var arg_forwardingRule = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildForwardingRule());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_forwardingRule).then(unittest.expectAsync(((api.ForwardingRule response) {
        checkForwardingRule(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.GlobalForwardingRulesResourceApi res = new api.ComputeApi(mock).globalForwardingRules;
      var arg_request = buildForwardingRule();
      var arg_project = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.ForwardingRule.fromJson(json);
        checkForwardingRule(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.GlobalForwardingRulesResourceApi res = new api.ComputeApi(mock).globalForwardingRules;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildForwardingRuleList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.ForwardingRuleList response) {
        checkForwardingRuleList(response);
      })));
    });

    unittest.test("method--setTarget", () {

      var mock = new HttpServerMock();
      api.GlobalForwardingRulesResourceApi res = new api.ComputeApi(mock).globalForwardingRules;
      var arg_request = buildTargetReference();
      var arg_project = "foo";
      var arg_forwardingRule = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.TargetReference.fromJson(json);
        checkTargetReference(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.setTarget(arg_request, arg_project, arg_forwardingRule).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

  });


  unittest.group("resource-GlobalOperationsResourceApi", () {
    unittest.test("method--aggregatedList", () {

      var mock = new HttpServerMock();
      api.GlobalOperationsResourceApi res = new api.ComputeApi(mock).globalOperations;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperationAggregatedList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.aggregatedList(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.OperationAggregatedList response) {
        checkOperationAggregatedList(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.GlobalOperationsResourceApi res = new api.ComputeApi(mock).globalOperations;
      var arg_project = "foo";
      var arg_operation = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_operation).then(unittest.expectAsync((_) {}));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.GlobalOperationsResourceApi res = new api.ComputeApi(mock).globalOperations;
      var arg_project = "foo";
      var arg_operation = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_operation).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.GlobalOperationsResourceApi res = new api.ComputeApi(mock).globalOperations;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperationList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.OperationList response) {
        checkOperationList(response);
      })));
    });

  });


  unittest.group("resource-HttpHealthChecksResourceApi", () {
    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.HttpHealthChecksResourceApi res = new api.ComputeApi(mock).httpHealthChecks;
      var arg_project = "foo";
      var arg_httpHealthCheck = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_httpHealthCheck).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.HttpHealthChecksResourceApi res = new api.ComputeApi(mock).httpHealthChecks;
      var arg_project = "foo";
      var arg_httpHealthCheck = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildHttpHealthCheck());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_httpHealthCheck).then(unittest.expectAsync(((api.HttpHealthCheck response) {
        checkHttpHealthCheck(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.HttpHealthChecksResourceApi res = new api.ComputeApi(mock).httpHealthChecks;
      var arg_request = buildHttpHealthCheck();
      var arg_project = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.HttpHealthCheck.fromJson(json);
        checkHttpHealthCheck(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.HttpHealthChecksResourceApi res = new api.ComputeApi(mock).httpHealthChecks;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildHttpHealthCheckList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.HttpHealthCheckList response) {
        checkHttpHealthCheckList(response);
      })));
    });

    unittest.test("method--patch", () {

      var mock = new HttpServerMock();
      api.HttpHealthChecksResourceApi res = new api.ComputeApi(mock).httpHealthChecks;
      var arg_request = buildHttpHealthCheck();
      var arg_project = "foo";
      var arg_httpHealthCheck = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.HttpHealthCheck.fromJson(json);
        checkHttpHealthCheck(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.patch(arg_request, arg_project, arg_httpHealthCheck).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--update", () {

      var mock = new HttpServerMock();
      api.HttpHealthChecksResourceApi res = new api.ComputeApi(mock).httpHealthChecks;
      var arg_request = buildHttpHealthCheck();
      var arg_project = "foo";
      var arg_httpHealthCheck = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.HttpHealthCheck.fromJson(json);
        checkHttpHealthCheck(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.update(arg_request, arg_project, arg_httpHealthCheck).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

  });


  unittest.group("resource-HttpsHealthChecksResourceApi", () {
    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.HttpsHealthChecksResourceApi res = new api.ComputeApi(mock).httpsHealthChecks;
      var arg_project = "foo";
      var arg_httpsHealthCheck = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_httpsHealthCheck).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.HttpsHealthChecksResourceApi res = new api.ComputeApi(mock).httpsHealthChecks;
      var arg_project = "foo";
      var arg_httpsHealthCheck = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildHttpsHealthCheck());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_httpsHealthCheck).then(unittest.expectAsync(((api.HttpsHealthCheck response) {
        checkHttpsHealthCheck(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.HttpsHealthChecksResourceApi res = new api.ComputeApi(mock).httpsHealthChecks;
      var arg_request = buildHttpsHealthCheck();
      var arg_project = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.HttpsHealthCheck.fromJson(json);
        checkHttpsHealthCheck(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.HttpsHealthChecksResourceApi res = new api.ComputeApi(mock).httpsHealthChecks;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildHttpsHealthCheckList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.HttpsHealthCheckList response) {
        checkHttpsHealthCheckList(response);
      })));
    });

    unittest.test("method--patch", () {

      var mock = new HttpServerMock();
      api.HttpsHealthChecksResourceApi res = new api.ComputeApi(mock).httpsHealthChecks;
      var arg_request = buildHttpsHealthCheck();
      var arg_project = "foo";
      var arg_httpsHealthCheck = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.HttpsHealthCheck.fromJson(json);
        checkHttpsHealthCheck(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.patch(arg_request, arg_project, arg_httpsHealthCheck).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--update", () {

      var mock = new HttpServerMock();
      api.HttpsHealthChecksResourceApi res = new api.ComputeApi(mock).httpsHealthChecks;
      var arg_request = buildHttpsHealthCheck();
      var arg_project = "foo";
      var arg_httpsHealthCheck = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.HttpsHealthCheck.fromJson(json);
        checkHttpsHealthCheck(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.update(arg_request, arg_project, arg_httpsHealthCheck).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

  });


  unittest.group("resource-ImagesResourceApi", () {
    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.ImagesResourceApi res = new api.ComputeApi(mock).images;
      var arg_project = "foo";
      var arg_image = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_image).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--deprecate", () {

      var mock = new HttpServerMock();
      api.ImagesResourceApi res = new api.ComputeApi(mock).images;
      var arg_request = buildDeprecationStatus();
      var arg_project = "foo";
      var arg_image = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.DeprecationStatus.fromJson(json);
        checkDeprecationStatus(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.deprecate(arg_request, arg_project, arg_image).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.ImagesResourceApi res = new api.ComputeApi(mock).images;
      var arg_project = "foo";
      var arg_image = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildImage());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_image).then(unittest.expectAsync(((api.Image response) {
        checkImage(response);
      })));
    });

    unittest.test("method--getFromFamily", () {

      var mock = new HttpServerMock();
      api.ImagesResourceApi res = new api.ComputeApi(mock).images;
      var arg_project = "foo";
      var arg_family = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildImage());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.getFromFamily(arg_project, arg_family).then(unittest.expectAsync(((api.Image response) {
        checkImage(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.ImagesResourceApi res = new api.ComputeApi(mock).images;
      var arg_request = buildImage();
      var arg_project = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Image.fromJson(json);
        checkImage(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.ImagesResourceApi res = new api.ComputeApi(mock).images;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildImageList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.ImageList response) {
        checkImageList(response);
      })));
    });

  });


  unittest.group("resource-InstanceGroupManagersResourceApi", () {
    unittest.test("method--abandonInstances", () {

      var mock = new HttpServerMock();
      api.InstanceGroupManagersResourceApi res = new api.ComputeApi(mock).instanceGroupManagers;
      var arg_request = buildInstanceGroupManagersAbandonInstancesRequest();
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instanceGroupManager = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.InstanceGroupManagersAbandonInstancesRequest.fromJson(json);
        checkInstanceGroupManagersAbandonInstancesRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.abandonInstances(arg_request, arg_project, arg_zone, arg_instanceGroupManager).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--aggregatedList", () {

      var mock = new HttpServerMock();
      api.InstanceGroupManagersResourceApi res = new api.ComputeApi(mock).instanceGroupManagers;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildInstanceGroupManagerAggregatedList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.aggregatedList(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.InstanceGroupManagerAggregatedList response) {
        checkInstanceGroupManagerAggregatedList(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.InstanceGroupManagersResourceApi res = new api.ComputeApi(mock).instanceGroupManagers;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instanceGroupManager = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_zone, arg_instanceGroupManager).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--deleteInstances", () {

      var mock = new HttpServerMock();
      api.InstanceGroupManagersResourceApi res = new api.ComputeApi(mock).instanceGroupManagers;
      var arg_request = buildInstanceGroupManagersDeleteInstancesRequest();
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instanceGroupManager = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.InstanceGroupManagersDeleteInstancesRequest.fromJson(json);
        checkInstanceGroupManagersDeleteInstancesRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.deleteInstances(arg_request, arg_project, arg_zone, arg_instanceGroupManager).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.InstanceGroupManagersResourceApi res = new api.ComputeApi(mock).instanceGroupManagers;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instanceGroupManager = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildInstanceGroupManager());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_zone, arg_instanceGroupManager).then(unittest.expectAsync(((api.InstanceGroupManager response) {
        checkInstanceGroupManager(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.InstanceGroupManagersResourceApi res = new api.ComputeApi(mock).instanceGroupManagers;
      var arg_request = buildInstanceGroupManager();
      var arg_project = "foo";
      var arg_zone = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.InstanceGroupManager.fromJson(json);
        checkInstanceGroupManager(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project, arg_zone).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.InstanceGroupManagersResourceApi res = new api.ComputeApi(mock).instanceGroupManagers;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildInstanceGroupManagerList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, arg_zone, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.InstanceGroupManagerList response) {
        checkInstanceGroupManagerList(response);
      })));
    });

    unittest.test("method--listManagedInstances", () {

      var mock = new HttpServerMock();
      api.InstanceGroupManagersResourceApi res = new api.ComputeApi(mock).instanceGroupManagers;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instanceGroupManager = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildInstanceGroupManagersListManagedInstancesResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.listManagedInstances(arg_project, arg_zone, arg_instanceGroupManager).then(unittest.expectAsync(((api.InstanceGroupManagersListManagedInstancesResponse response) {
        checkInstanceGroupManagersListManagedInstancesResponse(response);
      })));
    });

    unittest.test("method--recreateInstances", () {

      var mock = new HttpServerMock();
      api.InstanceGroupManagersResourceApi res = new api.ComputeApi(mock).instanceGroupManagers;
      var arg_request = buildInstanceGroupManagersRecreateInstancesRequest();
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instanceGroupManager = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.InstanceGroupManagersRecreateInstancesRequest.fromJson(json);
        checkInstanceGroupManagersRecreateInstancesRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.recreateInstances(arg_request, arg_project, arg_zone, arg_instanceGroupManager).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--resize", () {

      var mock = new HttpServerMock();
      api.InstanceGroupManagersResourceApi res = new api.ComputeApi(mock).instanceGroupManagers;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instanceGroupManager = "foo";
      var arg_size = 42;
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(core.int.parse(queryMap["size"].first), unittest.equals(arg_size));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.resize(arg_project, arg_zone, arg_instanceGroupManager, arg_size).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--setInstanceTemplate", () {

      var mock = new HttpServerMock();
      api.InstanceGroupManagersResourceApi res = new api.ComputeApi(mock).instanceGroupManagers;
      var arg_request = buildInstanceGroupManagersSetInstanceTemplateRequest();
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instanceGroupManager = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.InstanceGroupManagersSetInstanceTemplateRequest.fromJson(json);
        checkInstanceGroupManagersSetInstanceTemplateRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.setInstanceTemplate(arg_request, arg_project, arg_zone, arg_instanceGroupManager).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--setTargetPools", () {

      var mock = new HttpServerMock();
      api.InstanceGroupManagersResourceApi res = new api.ComputeApi(mock).instanceGroupManagers;
      var arg_request = buildInstanceGroupManagersSetTargetPoolsRequest();
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instanceGroupManager = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.InstanceGroupManagersSetTargetPoolsRequest.fromJson(json);
        checkInstanceGroupManagersSetTargetPoolsRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.setTargetPools(arg_request, arg_project, arg_zone, arg_instanceGroupManager).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

  });


  unittest.group("resource-InstanceGroupsResourceApi", () {
    unittest.test("method--addInstances", () {

      var mock = new HttpServerMock();
      api.InstanceGroupsResourceApi res = new api.ComputeApi(mock).instanceGroups;
      var arg_request = buildInstanceGroupsAddInstancesRequest();
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instanceGroup = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.InstanceGroupsAddInstancesRequest.fromJson(json);
        checkInstanceGroupsAddInstancesRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.addInstances(arg_request, arg_project, arg_zone, arg_instanceGroup).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--aggregatedList", () {

      var mock = new HttpServerMock();
      api.InstanceGroupsResourceApi res = new api.ComputeApi(mock).instanceGroups;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildInstanceGroupAggregatedList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.aggregatedList(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.InstanceGroupAggregatedList response) {
        checkInstanceGroupAggregatedList(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.InstanceGroupsResourceApi res = new api.ComputeApi(mock).instanceGroups;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instanceGroup = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_zone, arg_instanceGroup).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.InstanceGroupsResourceApi res = new api.ComputeApi(mock).instanceGroups;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instanceGroup = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildInstanceGroup());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_zone, arg_instanceGroup).then(unittest.expectAsync(((api.InstanceGroup response) {
        checkInstanceGroup(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.InstanceGroupsResourceApi res = new api.ComputeApi(mock).instanceGroups;
      var arg_request = buildInstanceGroup();
      var arg_project = "foo";
      var arg_zone = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.InstanceGroup.fromJson(json);
        checkInstanceGroup(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project, arg_zone).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.InstanceGroupsResourceApi res = new api.ComputeApi(mock).instanceGroups;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildInstanceGroupList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, arg_zone, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.InstanceGroupList response) {
        checkInstanceGroupList(response);
      })));
    });

    unittest.test("method--listInstances", () {

      var mock = new HttpServerMock();
      api.InstanceGroupsResourceApi res = new api.ComputeApi(mock).instanceGroups;
      var arg_request = buildInstanceGroupsListInstancesRequest();
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instanceGroup = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.InstanceGroupsListInstancesRequest.fromJson(json);
        checkInstanceGroupsListInstancesRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildInstanceGroupsListInstances());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.listInstances(arg_request, arg_project, arg_zone, arg_instanceGroup, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.InstanceGroupsListInstances response) {
        checkInstanceGroupsListInstances(response);
      })));
    });

    unittest.test("method--removeInstances", () {

      var mock = new HttpServerMock();
      api.InstanceGroupsResourceApi res = new api.ComputeApi(mock).instanceGroups;
      var arg_request = buildInstanceGroupsRemoveInstancesRequest();
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instanceGroup = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.InstanceGroupsRemoveInstancesRequest.fromJson(json);
        checkInstanceGroupsRemoveInstancesRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.removeInstances(arg_request, arg_project, arg_zone, arg_instanceGroup).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--setNamedPorts", () {

      var mock = new HttpServerMock();
      api.InstanceGroupsResourceApi res = new api.ComputeApi(mock).instanceGroups;
      var arg_request = buildInstanceGroupsSetNamedPortsRequest();
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instanceGroup = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.InstanceGroupsSetNamedPortsRequest.fromJson(json);
        checkInstanceGroupsSetNamedPortsRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.setNamedPorts(arg_request, arg_project, arg_zone, arg_instanceGroup).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

  });


  unittest.group("resource-InstanceTemplatesResourceApi", () {
    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.InstanceTemplatesResourceApi res = new api.ComputeApi(mock).instanceTemplates;
      var arg_project = "foo";
      var arg_instanceTemplate = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_instanceTemplate).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.InstanceTemplatesResourceApi res = new api.ComputeApi(mock).instanceTemplates;
      var arg_project = "foo";
      var arg_instanceTemplate = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildInstanceTemplate());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_instanceTemplate).then(unittest.expectAsync(((api.InstanceTemplate response) {
        checkInstanceTemplate(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.InstanceTemplatesResourceApi res = new api.ComputeApi(mock).instanceTemplates;
      var arg_request = buildInstanceTemplate();
      var arg_project = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.InstanceTemplate.fromJson(json);
        checkInstanceTemplate(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.InstanceTemplatesResourceApi res = new api.ComputeApi(mock).instanceTemplates;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildInstanceTemplateList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.InstanceTemplateList response) {
        checkInstanceTemplateList(response);
      })));
    });

  });


  unittest.group("resource-InstancesResourceApi", () {
    unittest.test("method--addAccessConfig", () {

      var mock = new HttpServerMock();
      api.InstancesResourceApi res = new api.ComputeApi(mock).instances;
      var arg_request = buildAccessConfig();
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instance = "foo";
      var arg_networkInterface = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.AccessConfig.fromJson(json);
        checkAccessConfig(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["networkInterface"].first, unittest.equals(arg_networkInterface));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.addAccessConfig(arg_request, arg_project, arg_zone, arg_instance, arg_networkInterface).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--aggregatedList", () {

      var mock = new HttpServerMock();
      api.InstancesResourceApi res = new api.ComputeApi(mock).instances;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildInstanceAggregatedList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.aggregatedList(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.InstanceAggregatedList response) {
        checkInstanceAggregatedList(response);
      })));
    });

    unittest.test("method--attachDisk", () {

      var mock = new HttpServerMock();
      api.InstancesResourceApi res = new api.ComputeApi(mock).instances;
      var arg_request = buildAttachedDisk();
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instance = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.AttachedDisk.fromJson(json);
        checkAttachedDisk(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.attachDisk(arg_request, arg_project, arg_zone, arg_instance).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.InstancesResourceApi res = new api.ComputeApi(mock).instances;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instance = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_zone, arg_instance).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--deleteAccessConfig", () {

      var mock = new HttpServerMock();
      api.InstancesResourceApi res = new api.ComputeApi(mock).instances;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instance = "foo";
      var arg_accessConfig = "foo";
      var arg_networkInterface = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["accessConfig"].first, unittest.equals(arg_accessConfig));
        unittest.expect(queryMap["networkInterface"].first, unittest.equals(arg_networkInterface));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.deleteAccessConfig(arg_project, arg_zone, arg_instance, arg_accessConfig, arg_networkInterface).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--detachDisk", () {

      var mock = new HttpServerMock();
      api.InstancesResourceApi res = new api.ComputeApi(mock).instances;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instance = "foo";
      var arg_deviceName = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["deviceName"].first, unittest.equals(arg_deviceName));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.detachDisk(arg_project, arg_zone, arg_instance, arg_deviceName).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.InstancesResourceApi res = new api.ComputeApi(mock).instances;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instance = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildInstance());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_zone, arg_instance).then(unittest.expectAsync(((api.Instance response) {
        checkInstance(response);
      })));
    });

    unittest.test("method--getSerialPortOutput", () {

      var mock = new HttpServerMock();
      api.InstancesResourceApi res = new api.ComputeApi(mock).instances;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instance = "foo";
      var arg_port = 42;
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(core.int.parse(queryMap["port"].first), unittest.equals(arg_port));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildSerialPortOutput());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.getSerialPortOutput(arg_project, arg_zone, arg_instance, port: arg_port).then(unittest.expectAsync(((api.SerialPortOutput response) {
        checkSerialPortOutput(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.InstancesResourceApi res = new api.ComputeApi(mock).instances;
      var arg_request = buildInstance();
      var arg_project = "foo";
      var arg_zone = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Instance.fromJson(json);
        checkInstance(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project, arg_zone).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.InstancesResourceApi res = new api.ComputeApi(mock).instances;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildInstanceList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, arg_zone, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.InstanceList response) {
        checkInstanceList(response);
      })));
    });

    unittest.test("method--reset", () {

      var mock = new HttpServerMock();
      api.InstancesResourceApi res = new api.ComputeApi(mock).instances;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instance = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.reset(arg_project, arg_zone, arg_instance).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--setDiskAutoDelete", () {

      var mock = new HttpServerMock();
      api.InstancesResourceApi res = new api.ComputeApi(mock).instances;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instance = "foo";
      var arg_autoDelete = true;
      var arg_deviceName = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["autoDelete"].first, unittest.equals("$arg_autoDelete"));
        unittest.expect(queryMap["deviceName"].first, unittest.equals(arg_deviceName));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.setDiskAutoDelete(arg_project, arg_zone, arg_instance, arg_autoDelete, arg_deviceName).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--setMachineType", () {

      var mock = new HttpServerMock();
      api.InstancesResourceApi res = new api.ComputeApi(mock).instances;
      var arg_request = buildInstancesSetMachineTypeRequest();
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instance = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.InstancesSetMachineTypeRequest.fromJson(json);
        checkInstancesSetMachineTypeRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.setMachineType(arg_request, arg_project, arg_zone, arg_instance).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--setMetadata", () {

      var mock = new HttpServerMock();
      api.InstancesResourceApi res = new api.ComputeApi(mock).instances;
      var arg_request = buildMetadata();
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instance = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Metadata.fromJson(json);
        checkMetadata(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.setMetadata(arg_request, arg_project, arg_zone, arg_instance).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--setScheduling", () {

      var mock = new HttpServerMock();
      api.InstancesResourceApi res = new api.ComputeApi(mock).instances;
      var arg_request = buildScheduling();
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instance = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Scheduling.fromJson(json);
        checkScheduling(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.setScheduling(arg_request, arg_project, arg_zone, arg_instance).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--setTags", () {

      var mock = new HttpServerMock();
      api.InstancesResourceApi res = new api.ComputeApi(mock).instances;
      var arg_request = buildTags();
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instance = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Tags.fromJson(json);
        checkTags(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.setTags(arg_request, arg_project, arg_zone, arg_instance).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--start", () {

      var mock = new HttpServerMock();
      api.InstancesResourceApi res = new api.ComputeApi(mock).instances;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instance = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.start(arg_project, arg_zone, arg_instance).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--startWithEncryptionKey", () {

      var mock = new HttpServerMock();
      api.InstancesResourceApi res = new api.ComputeApi(mock).instances;
      var arg_request = buildInstancesStartWithEncryptionKeyRequest();
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instance = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.InstancesStartWithEncryptionKeyRequest.fromJson(json);
        checkInstancesStartWithEncryptionKeyRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.startWithEncryptionKey(arg_request, arg_project, arg_zone, arg_instance).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--stop", () {

      var mock = new HttpServerMock();
      api.InstancesResourceApi res = new api.ComputeApi(mock).instances;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_instance = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.stop(arg_project, arg_zone, arg_instance).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

  });


  unittest.group("resource-LicensesResourceApi", () {
    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.LicensesResourceApi res = new api.ComputeApi(mock).licenses;
      var arg_project = "foo";
      var arg_license = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildLicense());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_license).then(unittest.expectAsync(((api.License response) {
        checkLicense(response);
      })));
    });

  });


  unittest.group("resource-MachineTypesResourceApi", () {
    unittest.test("method--aggregatedList", () {

      var mock = new HttpServerMock();
      api.MachineTypesResourceApi res = new api.ComputeApi(mock).machineTypes;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildMachineTypeAggregatedList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.aggregatedList(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.MachineTypeAggregatedList response) {
        checkMachineTypeAggregatedList(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.MachineTypesResourceApi res = new api.ComputeApi(mock).machineTypes;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_machineType = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildMachineType());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_zone, arg_machineType).then(unittest.expectAsync(((api.MachineType response) {
        checkMachineType(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.MachineTypesResourceApi res = new api.ComputeApi(mock).machineTypes;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildMachineTypeList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, arg_zone, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.MachineTypeList response) {
        checkMachineTypeList(response);
      })));
    });

  });


  unittest.group("resource-NetworksResourceApi", () {
    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.NetworksResourceApi res = new api.ComputeApi(mock).networks;
      var arg_project = "foo";
      var arg_network = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_network).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.NetworksResourceApi res = new api.ComputeApi(mock).networks;
      var arg_project = "foo";
      var arg_network = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildNetwork());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_network).then(unittest.expectAsync(((api.Network response) {
        checkNetwork(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.NetworksResourceApi res = new api.ComputeApi(mock).networks;
      var arg_request = buildNetwork();
      var arg_project = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Network.fromJson(json);
        checkNetwork(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.NetworksResourceApi res = new api.ComputeApi(mock).networks;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildNetworkList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.NetworkList response) {
        checkNetworkList(response);
      })));
    });

  });


  unittest.group("resource-ProjectsResourceApi", () {
    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.ProjectsResourceApi res = new api.ComputeApi(mock).projects;
      var arg_project = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildProject());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project).then(unittest.expectAsync(((api.Project response) {
        checkProject(response);
      })));
    });

    unittest.test("method--moveDisk", () {

      var mock = new HttpServerMock();
      api.ProjectsResourceApi res = new api.ComputeApi(mock).projects;
      var arg_request = buildDiskMoveRequest();
      var arg_project = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.DiskMoveRequest.fromJson(json);
        checkDiskMoveRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.moveDisk(arg_request, arg_project).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--moveInstance", () {

      var mock = new HttpServerMock();
      api.ProjectsResourceApi res = new api.ComputeApi(mock).projects;
      var arg_request = buildInstanceMoveRequest();
      var arg_project = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.InstanceMoveRequest.fromJson(json);
        checkInstanceMoveRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.moveInstance(arg_request, arg_project).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--setCommonInstanceMetadata", () {

      var mock = new HttpServerMock();
      api.ProjectsResourceApi res = new api.ComputeApi(mock).projects;
      var arg_request = buildMetadata();
      var arg_project = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Metadata.fromJson(json);
        checkMetadata(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.setCommonInstanceMetadata(arg_request, arg_project).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--setUsageExportBucket", () {

      var mock = new HttpServerMock();
      api.ProjectsResourceApi res = new api.ComputeApi(mock).projects;
      var arg_request = buildUsageExportLocation();
      var arg_project = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.UsageExportLocation.fromJson(json);
        checkUsageExportLocation(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.setUsageExportBucket(arg_request, arg_project).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

  });


  unittest.group("resource-RegionOperationsResourceApi", () {
    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.RegionOperationsResourceApi res = new api.ComputeApi(mock).regionOperations;
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_operation = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_region, arg_operation).then(unittest.expectAsync((_) {}));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.RegionOperationsResourceApi res = new api.ComputeApi(mock).regionOperations;
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_operation = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_region, arg_operation).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.RegionOperationsResourceApi res = new api.ComputeApi(mock).regionOperations;
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperationList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, arg_region, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.OperationList response) {
        checkOperationList(response);
      })));
    });

  });


  unittest.group("resource-RegionsResourceApi", () {
    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.RegionsResourceApi res = new api.ComputeApi(mock).regions;
      var arg_project = "foo";
      var arg_region = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildRegion());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_region).then(unittest.expectAsync(((api.Region response) {
        checkRegion(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.RegionsResourceApi res = new api.ComputeApi(mock).regions;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildRegionList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.RegionList response) {
        checkRegionList(response);
      })));
    });

  });


  unittest.group("resource-RoutersResourceApi", () {
    unittest.test("method--aggregatedList", () {

      var mock = new HttpServerMock();
      api.RoutersResourceApi res = new api.ComputeApi(mock).routers;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildRouterAggregatedList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.aggregatedList(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.RouterAggregatedList response) {
        checkRouterAggregatedList(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.RoutersResourceApi res = new api.ComputeApi(mock).routers;
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_router = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_region, arg_router).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.RoutersResourceApi res = new api.ComputeApi(mock).routers;
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_router = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildRouter());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_region, arg_router).then(unittest.expectAsync(((api.Router response) {
        checkRouter(response);
      })));
    });

    unittest.test("method--getRouterStatus", () {

      var mock = new HttpServerMock();
      api.RoutersResourceApi res = new api.ComputeApi(mock).routers;
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_router = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildRouterStatusResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.getRouterStatus(arg_project, arg_region, arg_router).then(unittest.expectAsync(((api.RouterStatusResponse response) {
        checkRouterStatusResponse(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.RoutersResourceApi res = new api.ComputeApi(mock).routers;
      var arg_request = buildRouter();
      var arg_project = "foo";
      var arg_region = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Router.fromJson(json);
        checkRouter(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project, arg_region).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.RoutersResourceApi res = new api.ComputeApi(mock).routers;
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildRouterList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, arg_region, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.RouterList response) {
        checkRouterList(response);
      })));
    });

    unittest.test("method--patch", () {

      var mock = new HttpServerMock();
      api.RoutersResourceApi res = new api.ComputeApi(mock).routers;
      var arg_request = buildRouter();
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_router = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Router.fromJson(json);
        checkRouter(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.patch(arg_request, arg_project, arg_region, arg_router).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--preview", () {

      var mock = new HttpServerMock();
      api.RoutersResourceApi res = new api.ComputeApi(mock).routers;
      var arg_request = buildRouter();
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_router = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Router.fromJson(json);
        checkRouter(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildRoutersPreviewResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.preview(arg_request, arg_project, arg_region, arg_router).then(unittest.expectAsync(((api.RoutersPreviewResponse response) {
        checkRoutersPreviewResponse(response);
      })));
    });

    unittest.test("method--update", () {

      var mock = new HttpServerMock();
      api.RoutersResourceApi res = new api.ComputeApi(mock).routers;
      var arg_request = buildRouter();
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_router = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Router.fromJson(json);
        checkRouter(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.update(arg_request, arg_project, arg_region, arg_router).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

  });


  unittest.group("resource-RoutesResourceApi", () {
    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.RoutesResourceApi res = new api.ComputeApi(mock).routes;
      var arg_project = "foo";
      var arg_route = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_route).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.RoutesResourceApi res = new api.ComputeApi(mock).routes;
      var arg_project = "foo";
      var arg_route = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildRoute());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_route).then(unittest.expectAsync(((api.Route response) {
        checkRoute(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.RoutesResourceApi res = new api.ComputeApi(mock).routes;
      var arg_request = buildRoute();
      var arg_project = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Route.fromJson(json);
        checkRoute(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.RoutesResourceApi res = new api.ComputeApi(mock).routes;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildRouteList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.RouteList response) {
        checkRouteList(response);
      })));
    });

  });


  unittest.group("resource-SnapshotsResourceApi", () {
    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.SnapshotsResourceApi res = new api.ComputeApi(mock).snapshots;
      var arg_project = "foo";
      var arg_snapshot = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_snapshot).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.SnapshotsResourceApi res = new api.ComputeApi(mock).snapshots;
      var arg_project = "foo";
      var arg_snapshot = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildSnapshot());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_snapshot).then(unittest.expectAsync(((api.Snapshot response) {
        checkSnapshot(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.SnapshotsResourceApi res = new api.ComputeApi(mock).snapshots;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildSnapshotList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.SnapshotList response) {
        checkSnapshotList(response);
      })));
    });

  });


  unittest.group("resource-SslCertificatesResourceApi", () {
    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.SslCertificatesResourceApi res = new api.ComputeApi(mock).sslCertificates;
      var arg_project = "foo";
      var arg_sslCertificate = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_sslCertificate).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.SslCertificatesResourceApi res = new api.ComputeApi(mock).sslCertificates;
      var arg_project = "foo";
      var arg_sslCertificate = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildSslCertificate());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_sslCertificate).then(unittest.expectAsync(((api.SslCertificate response) {
        checkSslCertificate(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.SslCertificatesResourceApi res = new api.ComputeApi(mock).sslCertificates;
      var arg_request = buildSslCertificate();
      var arg_project = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.SslCertificate.fromJson(json);
        checkSslCertificate(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.SslCertificatesResourceApi res = new api.ComputeApi(mock).sslCertificates;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildSslCertificateList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.SslCertificateList response) {
        checkSslCertificateList(response);
      })));
    });

  });


  unittest.group("resource-SubnetworksResourceApi", () {
    unittest.test("method--aggregatedList", () {

      var mock = new HttpServerMock();
      api.SubnetworksResourceApi res = new api.ComputeApi(mock).subnetworks;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildSubnetworkAggregatedList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.aggregatedList(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.SubnetworkAggregatedList response) {
        checkSubnetworkAggregatedList(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.SubnetworksResourceApi res = new api.ComputeApi(mock).subnetworks;
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_subnetwork = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_region, arg_subnetwork).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.SubnetworksResourceApi res = new api.ComputeApi(mock).subnetworks;
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_subnetwork = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildSubnetwork());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_region, arg_subnetwork).then(unittest.expectAsync(((api.Subnetwork response) {
        checkSubnetwork(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.SubnetworksResourceApi res = new api.ComputeApi(mock).subnetworks;
      var arg_request = buildSubnetwork();
      var arg_project = "foo";
      var arg_region = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Subnetwork.fromJson(json);
        checkSubnetwork(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project, arg_region).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.SubnetworksResourceApi res = new api.ComputeApi(mock).subnetworks;
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildSubnetworkList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, arg_region, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.SubnetworkList response) {
        checkSubnetworkList(response);
      })));
    });

  });


  unittest.group("resource-TargetHttpProxiesResourceApi", () {
    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.TargetHttpProxiesResourceApi res = new api.ComputeApi(mock).targetHttpProxies;
      var arg_project = "foo";
      var arg_targetHttpProxy = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_targetHttpProxy).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.TargetHttpProxiesResourceApi res = new api.ComputeApi(mock).targetHttpProxies;
      var arg_project = "foo";
      var arg_targetHttpProxy = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTargetHttpProxy());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_targetHttpProxy).then(unittest.expectAsync(((api.TargetHttpProxy response) {
        checkTargetHttpProxy(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.TargetHttpProxiesResourceApi res = new api.ComputeApi(mock).targetHttpProxies;
      var arg_request = buildTargetHttpProxy();
      var arg_project = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.TargetHttpProxy.fromJson(json);
        checkTargetHttpProxy(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.TargetHttpProxiesResourceApi res = new api.ComputeApi(mock).targetHttpProxies;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTargetHttpProxyList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.TargetHttpProxyList response) {
        checkTargetHttpProxyList(response);
      })));
    });

    unittest.test("method--setUrlMap", () {

      var mock = new HttpServerMock();
      api.TargetHttpProxiesResourceApi res = new api.ComputeApi(mock).targetHttpProxies;
      var arg_request = buildUrlMapReference();
      var arg_project = "foo";
      var arg_targetHttpProxy = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.UrlMapReference.fromJson(json);
        checkUrlMapReference(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.setUrlMap(arg_request, arg_project, arg_targetHttpProxy).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

  });


  unittest.group("resource-TargetHttpsProxiesResourceApi", () {
    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.TargetHttpsProxiesResourceApi res = new api.ComputeApi(mock).targetHttpsProxies;
      var arg_project = "foo";
      var arg_targetHttpsProxy = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_targetHttpsProxy).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.TargetHttpsProxiesResourceApi res = new api.ComputeApi(mock).targetHttpsProxies;
      var arg_project = "foo";
      var arg_targetHttpsProxy = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTargetHttpsProxy());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_targetHttpsProxy).then(unittest.expectAsync(((api.TargetHttpsProxy response) {
        checkTargetHttpsProxy(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.TargetHttpsProxiesResourceApi res = new api.ComputeApi(mock).targetHttpsProxies;
      var arg_request = buildTargetHttpsProxy();
      var arg_project = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.TargetHttpsProxy.fromJson(json);
        checkTargetHttpsProxy(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.TargetHttpsProxiesResourceApi res = new api.ComputeApi(mock).targetHttpsProxies;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTargetHttpsProxyList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.TargetHttpsProxyList response) {
        checkTargetHttpsProxyList(response);
      })));
    });

    unittest.test("method--setSslCertificates", () {

      var mock = new HttpServerMock();
      api.TargetHttpsProxiesResourceApi res = new api.ComputeApi(mock).targetHttpsProxies;
      var arg_request = buildTargetHttpsProxiesSetSslCertificatesRequest();
      var arg_project = "foo";
      var arg_targetHttpsProxy = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.TargetHttpsProxiesSetSslCertificatesRequest.fromJson(json);
        checkTargetHttpsProxiesSetSslCertificatesRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.setSslCertificates(arg_request, arg_project, arg_targetHttpsProxy).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--setUrlMap", () {

      var mock = new HttpServerMock();
      api.TargetHttpsProxiesResourceApi res = new api.ComputeApi(mock).targetHttpsProxies;
      var arg_request = buildUrlMapReference();
      var arg_project = "foo";
      var arg_targetHttpsProxy = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.UrlMapReference.fromJson(json);
        checkUrlMapReference(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.setUrlMap(arg_request, arg_project, arg_targetHttpsProxy).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

  });


  unittest.group("resource-TargetInstancesResourceApi", () {
    unittest.test("method--aggregatedList", () {

      var mock = new HttpServerMock();
      api.TargetInstancesResourceApi res = new api.ComputeApi(mock).targetInstances;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTargetInstanceAggregatedList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.aggregatedList(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.TargetInstanceAggregatedList response) {
        checkTargetInstanceAggregatedList(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.TargetInstancesResourceApi res = new api.ComputeApi(mock).targetInstances;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_targetInstance = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_zone, arg_targetInstance).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.TargetInstancesResourceApi res = new api.ComputeApi(mock).targetInstances;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_targetInstance = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTargetInstance());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_zone, arg_targetInstance).then(unittest.expectAsync(((api.TargetInstance response) {
        checkTargetInstance(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.TargetInstancesResourceApi res = new api.ComputeApi(mock).targetInstances;
      var arg_request = buildTargetInstance();
      var arg_project = "foo";
      var arg_zone = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.TargetInstance.fromJson(json);
        checkTargetInstance(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project, arg_zone).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.TargetInstancesResourceApi res = new api.ComputeApi(mock).targetInstances;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTargetInstanceList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, arg_zone, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.TargetInstanceList response) {
        checkTargetInstanceList(response);
      })));
    });

  });


  unittest.group("resource-TargetPoolsResourceApi", () {
    unittest.test("method--addHealthCheck", () {

      var mock = new HttpServerMock();
      api.TargetPoolsResourceApi res = new api.ComputeApi(mock).targetPools;
      var arg_request = buildTargetPoolsAddHealthCheckRequest();
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_targetPool = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.TargetPoolsAddHealthCheckRequest.fromJson(json);
        checkTargetPoolsAddHealthCheckRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.addHealthCheck(arg_request, arg_project, arg_region, arg_targetPool).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--addInstance", () {

      var mock = new HttpServerMock();
      api.TargetPoolsResourceApi res = new api.ComputeApi(mock).targetPools;
      var arg_request = buildTargetPoolsAddInstanceRequest();
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_targetPool = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.TargetPoolsAddInstanceRequest.fromJson(json);
        checkTargetPoolsAddInstanceRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.addInstance(arg_request, arg_project, arg_region, arg_targetPool).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--aggregatedList", () {

      var mock = new HttpServerMock();
      api.TargetPoolsResourceApi res = new api.ComputeApi(mock).targetPools;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTargetPoolAggregatedList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.aggregatedList(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.TargetPoolAggregatedList response) {
        checkTargetPoolAggregatedList(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.TargetPoolsResourceApi res = new api.ComputeApi(mock).targetPools;
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_targetPool = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_region, arg_targetPool).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.TargetPoolsResourceApi res = new api.ComputeApi(mock).targetPools;
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_targetPool = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTargetPool());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_region, arg_targetPool).then(unittest.expectAsync(((api.TargetPool response) {
        checkTargetPool(response);
      })));
    });

    unittest.test("method--getHealth", () {

      var mock = new HttpServerMock();
      api.TargetPoolsResourceApi res = new api.ComputeApi(mock).targetPools;
      var arg_request = buildInstanceReference();
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_targetPool = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.InstanceReference.fromJson(json);
        checkInstanceReference(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTargetPoolInstanceHealth());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.getHealth(arg_request, arg_project, arg_region, arg_targetPool).then(unittest.expectAsync(((api.TargetPoolInstanceHealth response) {
        checkTargetPoolInstanceHealth(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.TargetPoolsResourceApi res = new api.ComputeApi(mock).targetPools;
      var arg_request = buildTargetPool();
      var arg_project = "foo";
      var arg_region = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.TargetPool.fromJson(json);
        checkTargetPool(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project, arg_region).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.TargetPoolsResourceApi res = new api.ComputeApi(mock).targetPools;
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTargetPoolList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, arg_region, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.TargetPoolList response) {
        checkTargetPoolList(response);
      })));
    });

    unittest.test("method--removeHealthCheck", () {

      var mock = new HttpServerMock();
      api.TargetPoolsResourceApi res = new api.ComputeApi(mock).targetPools;
      var arg_request = buildTargetPoolsRemoveHealthCheckRequest();
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_targetPool = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.TargetPoolsRemoveHealthCheckRequest.fromJson(json);
        checkTargetPoolsRemoveHealthCheckRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.removeHealthCheck(arg_request, arg_project, arg_region, arg_targetPool).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--removeInstance", () {

      var mock = new HttpServerMock();
      api.TargetPoolsResourceApi res = new api.ComputeApi(mock).targetPools;
      var arg_request = buildTargetPoolsRemoveInstanceRequest();
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_targetPool = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.TargetPoolsRemoveInstanceRequest.fromJson(json);
        checkTargetPoolsRemoveInstanceRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.removeInstance(arg_request, arg_project, arg_region, arg_targetPool).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--setBackup", () {

      var mock = new HttpServerMock();
      api.TargetPoolsResourceApi res = new api.ComputeApi(mock).targetPools;
      var arg_request = buildTargetReference();
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_targetPool = "foo";
      var arg_failoverRatio = 42.0;
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.TargetReference.fromJson(json);
        checkTargetReference(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(core.num.parse(queryMap["failoverRatio"].first), unittest.equals(arg_failoverRatio));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.setBackup(arg_request, arg_project, arg_region, arg_targetPool, failoverRatio: arg_failoverRatio).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

  });


  unittest.group("resource-TargetVpnGatewaysResourceApi", () {
    unittest.test("method--aggregatedList", () {

      var mock = new HttpServerMock();
      api.TargetVpnGatewaysResourceApi res = new api.ComputeApi(mock).targetVpnGateways;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTargetVpnGatewayAggregatedList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.aggregatedList(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.TargetVpnGatewayAggregatedList response) {
        checkTargetVpnGatewayAggregatedList(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.TargetVpnGatewaysResourceApi res = new api.ComputeApi(mock).targetVpnGateways;
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_targetVpnGateway = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_region, arg_targetVpnGateway).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.TargetVpnGatewaysResourceApi res = new api.ComputeApi(mock).targetVpnGateways;
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_targetVpnGateway = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTargetVpnGateway());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_region, arg_targetVpnGateway).then(unittest.expectAsync(((api.TargetVpnGateway response) {
        checkTargetVpnGateway(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.TargetVpnGatewaysResourceApi res = new api.ComputeApi(mock).targetVpnGateways;
      var arg_request = buildTargetVpnGateway();
      var arg_project = "foo";
      var arg_region = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.TargetVpnGateway.fromJson(json);
        checkTargetVpnGateway(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project, arg_region).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.TargetVpnGatewaysResourceApi res = new api.ComputeApi(mock).targetVpnGateways;
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildTargetVpnGatewayList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, arg_region, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.TargetVpnGatewayList response) {
        checkTargetVpnGatewayList(response);
      })));
    });

  });


  unittest.group("resource-UrlMapsResourceApi", () {
    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.UrlMapsResourceApi res = new api.ComputeApi(mock).urlMaps;
      var arg_project = "foo";
      var arg_urlMap = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_urlMap).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.UrlMapsResourceApi res = new api.ComputeApi(mock).urlMaps;
      var arg_project = "foo";
      var arg_urlMap = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildUrlMap());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_urlMap).then(unittest.expectAsync(((api.UrlMap response) {
        checkUrlMap(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.UrlMapsResourceApi res = new api.ComputeApi(mock).urlMaps;
      var arg_request = buildUrlMap();
      var arg_project = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.UrlMap.fromJson(json);
        checkUrlMap(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--invalidateCache", () {

      var mock = new HttpServerMock();
      api.UrlMapsResourceApi res = new api.ComputeApi(mock).urlMaps;
      var arg_request = buildCacheInvalidationRule();
      var arg_project = "foo";
      var arg_urlMap = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.CacheInvalidationRule.fromJson(json);
        checkCacheInvalidationRule(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.invalidateCache(arg_request, arg_project, arg_urlMap).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.UrlMapsResourceApi res = new api.ComputeApi(mock).urlMaps;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildUrlMapList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.UrlMapList response) {
        checkUrlMapList(response);
      })));
    });

    unittest.test("method--patch", () {

      var mock = new HttpServerMock();
      api.UrlMapsResourceApi res = new api.ComputeApi(mock).urlMaps;
      var arg_request = buildUrlMap();
      var arg_project = "foo";
      var arg_urlMap = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.UrlMap.fromJson(json);
        checkUrlMap(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.patch(arg_request, arg_project, arg_urlMap).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--update", () {

      var mock = new HttpServerMock();
      api.UrlMapsResourceApi res = new api.ComputeApi(mock).urlMaps;
      var arg_request = buildUrlMap();
      var arg_project = "foo";
      var arg_urlMap = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.UrlMap.fromJson(json);
        checkUrlMap(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.update(arg_request, arg_project, arg_urlMap).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--validate", () {

      var mock = new HttpServerMock();
      api.UrlMapsResourceApi res = new api.ComputeApi(mock).urlMaps;
      var arg_request = buildUrlMapsValidateRequest();
      var arg_project = "foo";
      var arg_urlMap = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.UrlMapsValidateRequest.fromJson(json);
        checkUrlMapsValidateRequest(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildUrlMapsValidateResponse());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.validate(arg_request, arg_project, arg_urlMap).then(unittest.expectAsync(((api.UrlMapsValidateResponse response) {
        checkUrlMapsValidateResponse(response);
      })));
    });

  });


  unittest.group("resource-VpnTunnelsResourceApi", () {
    unittest.test("method--aggregatedList", () {

      var mock = new HttpServerMock();
      api.VpnTunnelsResourceApi res = new api.ComputeApi(mock).vpnTunnels;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildVpnTunnelAggregatedList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.aggregatedList(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.VpnTunnelAggregatedList response) {
        checkVpnTunnelAggregatedList(response);
      })));
    });

    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.VpnTunnelsResourceApi res = new api.ComputeApi(mock).vpnTunnels;
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_vpnTunnel = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_region, arg_vpnTunnel).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.VpnTunnelsResourceApi res = new api.ComputeApi(mock).vpnTunnels;
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_vpnTunnel = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildVpnTunnel());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_region, arg_vpnTunnel).then(unittest.expectAsync(((api.VpnTunnel response) {
        checkVpnTunnel(response);
      })));
    });

    unittest.test("method--insert", () {

      var mock = new HttpServerMock();
      api.VpnTunnelsResourceApi res = new api.ComputeApi(mock).vpnTunnels;
      var arg_request = buildVpnTunnel();
      var arg_project = "foo";
      var arg_region = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.VpnTunnel.fromJson(json);
        checkVpnTunnel(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.insert(arg_request, arg_project, arg_region).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.VpnTunnelsResourceApi res = new api.ComputeApi(mock).vpnTunnels;
      var arg_project = "foo";
      var arg_region = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildVpnTunnelList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, arg_region, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.VpnTunnelList response) {
        checkVpnTunnelList(response);
      })));
    });

  });


  unittest.group("resource-ZoneOperationsResourceApi", () {
    unittest.test("method--delete", () {

      var mock = new HttpServerMock();
      api.ZoneOperationsResourceApi res = new api.ComputeApi(mock).zoneOperations;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_operation = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.delete(arg_project, arg_zone, arg_operation).then(unittest.expectAsync((_) {}));
    });

    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.ZoneOperationsResourceApi res = new api.ComputeApi(mock).zoneOperations;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_operation = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperation());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_zone, arg_operation).then(unittest.expectAsync(((api.Operation response) {
        checkOperation(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.ZoneOperationsResourceApi res = new api.ComputeApi(mock).zoneOperations;
      var arg_project = "foo";
      var arg_zone = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildOperationList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, arg_zone, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.OperationList response) {
        checkOperationList(response);
      })));
    });

  });


  unittest.group("resource-ZonesResourceApi", () {
    unittest.test("method--get", () {

      var mock = new HttpServerMock();
      api.ZonesResourceApi res = new api.ComputeApi(mock).zones;
      var arg_project = "foo";
      var arg_zone = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildZone());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.get(arg_project, arg_zone).then(unittest.expectAsync(((api.Zone response) {
        checkZone(response);
      })));
    });

    unittest.test("method--list", () {

      var mock = new HttpServerMock();
      api.ZonesResourceApi res = new api.ComputeApi(mock).zones;
      var arg_project = "foo";
      var arg_filter = "foo";
      var arg_maxResults = 42;
      var arg_pageToken = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["maxResults"].first), unittest.equals(arg_maxResults));
        unittest.expect(queryMap["pageToken"].first, unittest.equals(arg_pageToken));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildZoneList());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.list(arg_project, filter: arg_filter, maxResults: arg_maxResults, pageToken: arg_pageToken).then(unittest.expectAsync(((api.ZoneList response) {
        checkZoneList(response);
      })));
    });

  });


}

