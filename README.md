# kube-sample-daemonset
Sample to show how to create a daemonset to automatically apply a change to worker nodes

In particular, this updates the worker nodes to enable "no_root_squash" as per https://knowledgelayer.softlayer.com/procedure/accessing-file-storage-linux

To do so, it generates ssh keys and pushes them to the host, then connects over to run the necessary commands as root. After the connection is complete, it cleans up the keys.
The deployment allows this to run in privileged mode, which is necessary to access the host. As always, be very careful allowing privileged access.

Since this is a daemon set, new worker nodes added while it is running will automatically have the change made.


Deploy the daemon set to enable the feature using

kubectl create -f urs-daemonset.yml


Remove (if needed) using

kubectl delete -f urs-daemonset.yml

Removing the daemonset will NOT back out changes made to the underlying nodes.
Future nodes added after this is removed will not have the changes applied.


