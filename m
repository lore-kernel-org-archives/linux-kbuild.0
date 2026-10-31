Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480539;
	b=hcW89zfjlfdNOOZkE7w0WmzmcTJeBxMF52X/tHzL5LvzbOcWdoSpA642owXZ6DhBh7D3
	 thpikS3P+CxRezrW55Eaa0yZa2Zm0Yiw+gMAP9/cnSKuwZs+bbcm5cxBuI+cNOYpl7/++
	 MD0ZOs/awexTW2jpnoZJQEWPyN7ajvOrOQ0Q03k3o6GiiAcW7Pxdq6TBqAmXVbE0q3C5J
	 8+bv1jQ8O4DnquzKNAii3yN8lRZQW63ctDVzhMispQwXTf6t9eROeJ3zINIPwf+j4rs7G
	 +NfU0J1aHzhrC8zncu0/FPigbPGY1+JrF4NZ/7tJ5Epeo+UhjMqkqUgAwKr77Hrya1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480539;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iHKwq9nI3NFxtpeouD+5YMnOj60hiZOrryjsziFw8O8=;
	b=WG4ac3mjPOEupA6/3S5yIi3w3iMdSmF6aQ2Y57Pey/0QpPaE2QZOSb3245NYmA81Eg3Q
	 zAphK5EVKJg3ZL6/LXdj8wtpNWHIc0EMzxv50f4xbB2Urh2C5QSe4rMjkmjD5jMR05d5d
	 f9eSOL54xrGnxU/QVqmB9FREC1ZfdYA3uHkeBySlJkmQlB5hEU0EfhuEtmTHgVhSJFsi9
	 SjyTwTgfTcWvqEZAtFClJQv8JnnYz8lFSajKLGza4+eG0aZI9zifAUG6EAFRwoqx77JLj
	 C1T6fpYKvYg/zzD0uet8azmvauoQ7O6JO/dmAXY1slVaAdWYwm0mCvLYWkvHtR9a67g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AJFTYxDE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D025606A31C
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 21:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AJFTYxDE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA371F00A16;
	Sat, 31 Oct 2026 21:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793480538;
	bh=iHKwq9nI3NFxtpeouD+5YMnOj60hiZOrryjsziFw8O8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AJFTYxDEWM0MnMTSP0ROG7TqNRtIc92mmtheUyhcCtiKblnH+W1anvBcVlLoLZA+S
	 TmlkXhL398SM6zQQl3SvzEkJdJbADB1kXEwkU3BQnlmQiNZnIA2Njqsq7pSg7S4B5N
	 Xu6zdqgz+clApSinBNNOc9dNeQHwQN5GP+bffD38tPObtCCZhOcoyn/VSbLMl4gC0n
	 CzkZvGZjW9MgyuQsk5+NiPiu2rx22w/4BvsW+9PWlWvtBpQWzVG9naLnnwVg4ZMbiV
	 zYJFBJETM7ZaqAYmro5Xrazais2N5PB7Dq1apsurRlyk0iWu2VhG+hjorcvY8P2tWc
	 i80ZRWXGm4FFQ==
Message-ID: <sashiko-outbox-192146@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 19/23] net: hpe: ss1: add SR-IOV support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Doug Ledford" <doug.ledford@hpe.com>, "Slingshot Open Source Team" <slingshot-os-team@groups.ext.hpe.com>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Richard
 Cochran" <richardcochran@gmail.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Guenter
 Roeck" <linux@roeck-us.net>
Cc: linux-kbuild@vger.kernel.org
In-Reply-To: <20261030-cxi-netdev-submission-v1-19-8c2c391cc283@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030-cxi-netdev-submission-v1-19-8c2c391cc283@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 21:02:17 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 16 potential issue=
(s) to consider:
- [Critical] net: hpe: ss1: NULL deref and guest cred bypass in pf_get_kvm_=
task()
- [Critical] net: hpe: ss1: unauthenticated VF vsock handshake and global p=
ort binding
- [Critical] net: hpe: ss1: kthread_stop() UAF on self-exiting SR-IOV kthre=
ads
- [Critical] net: hpe: ss1: premature unlocked vf->req_sock clear in pf_vf_=
msghandler()
- [Critical] net: hpe: ss1: uncalled __cxi_vf_structure_offset_checks() hid=
es layout bugs
- [High] net: hpe: ss1: #warning under CXI_DISABLE_SRIOV breaks CONFIG_WERR=
OR builds
- [High] net: hpe: ss1: unlocked driver and vfio_dev->kvm access in pf_get_=
kvm_task()
- [High] net: hpe: ss1: missing num_vfs bounds check against C_NUM_VFS in e=
nable_sriov()
- [High] net: hpe: ss1: enable_sriov() enables VFs before listener sockets =
are bound
- [High] net: hpe: ss1: vf_notif_handler() hardcodes seq 0 and breaks notif=
ications
- [High] net: hpe: ss1: missing vsock sk_rcvtimeo and infinite -EINTR retry=
 loops
- [High] net: hpe: ss1: broken VF IRQ binary search and num_vfs =3D=3D 1 ch=
eck in handshake
- [High] net: hpe: ss1: unvalidated vsock message lengths and uninitialized=
 stack vars
- [High] net: hpe: ss1: pf_vf_msghandler() sends stale MAX_VFMSG_SIZE reply=
 on error
- [High] net: hpe: ss1: uninitialized vf_cmd_lock when with_vf_support is f=
alse
- [Medium] net: hpe: ss1: enable_sriov() error return, offset order, and #w=
arning build
--

commit cd0507e8307b6aff215ba76c73aa7b6a9f1e28d5
Author: Doug Ledford <doug.ledford@hpe.com>

net: hpe: ss1: add SR-IOV support

This commit adds SR-IOV support for the HPE Cassini driver, including VF
creation, a vsock-based PF/VF mailbox and notification mechanism, and
compile-time structure offset checks for VF resource structures.

> diff --git a/drivers/net/ethernet/hpe/ss1/cass_sriov.c b/drivers/net/ethe=
rnet/hpe/ss1/cass_sriov.c
> new file mode 100644
> index 0000000000000..5c947372ab9c7
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/ss1/cass_sriov.c
> @@ -0,0 +1,1274 @@

[ ... ]

> +#if defined(CXI_DISABLE_SRIOV)
> +#warning "SR-IOV support is disabled."
> +
> +int cass_sriov_configure(struct pci_dev *pdev, int num_vfs)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +int cass_vf_init(struct cass_dev *hw)
> +{
> +	return -EOPNOTSUPP;
> +}

[Severity: High]
In cass_core.h, CXI_DISABLE_SRIOV is defined whenever CONFIG_KVM_VFIO is
not enabled, and CONFIG_HPE_SS1 does not depend on or select
CONFIG_KVM_VFIO.

When building with CONFIG_KVM_VFIO=3Dn and CONFIG_WERROR=3Dy, will this
unconditional #warning cause the build to fail with -Werror=3Dcpp?

Also, since only pf_get_kvm_task() on the PF side touches vfio_device->kvm,
does gating the entire file on CXI_DISABLE_SRIOV prevent a guest VM kernel
built without host CONFIG_KVM_VFIO from probing a Cassini VF via
cass_vf_init() and cxi_send_msg_to_pf()?

[ ... ]

> +/* Given a PF's pci_dev struct, find the pci_dev of one of its VFs */
> +static struct pci_dev *get_vf_pdev(struct pci_dev *pdev, int vf_idx)
> +{
> +	int devfn =3D pci_iov_virtfn_devfn(pdev, vf_idx);
> +
> +	if (devfn < 0)
> +		return ERR_PTR(devfn);
> +	return pci_get_slot(pdev->bus, devfn);
> +}
> +
> +/* Identify the KVM task associated with a VF that is bound to a guest V=
M. */
> +static struct task_struct *pf_get_kvm_task(struct cass_vf *vf)
> +{
> +	struct cass_dev *hw =3D vf->hw;
> +	struct pci_dev *vf_pdev =3D NULL;
> +	struct vfio_device *vfio_dev =3D NULL;
> +	struct task_struct *task =3D NULL;
> +	struct pid *pid;
> +
> +	vf_pdev =3D get_vf_pdev(hw->cdev.pdev, vf->vf_idx);
> +	if (IS_ERR(vf_pdev)) {
> +		cxidev_err(&hw->cdev, "vf %d: could not get device", vf->vf_idx);
> +		return ERR_PTR(PTR_ERR(vf_pdev));
> +	}
> +
> +	cxidev_dbg(&hw->cdev, "vf %d: device at %s", vf->vf_idx, pci_name(vf_pd=
ev));
> +
> +	if (!vf_pdev->driver) {
> +		task =3D ERR_PTR(-ENODEV);
> +	} else if (!strncmp(vf_pdev->driver->name, "vfio-pci", strlen("vfio-pci=
"))) {
> +		/* VF is under control of VFIO driver, look for KVM task. */
> +		vfio_dev =3D pci_get_drvdata(vf_pdev);
> +		if (vfio_dev->kvm) {
> +			pid =3D find_get_pid(vfio_dev->kvm->userspace_pid);
> +			task =3D get_pid_task(pid, PIDTYPE_PID);
> +			put_pid(pid);
> +		} else {
> +			task =3D ERR_PTR(-ESRCH);
> +		}

[Severity: Critical]
Could pf_get_kvm_task() trigger a NULL pointer dereference or allow a guest
VM to bypass host credential checks?

First, get_vf_pdev() calls pci_get_slot(pdev->bus, devfn), which only
searches pdev->bus (missing VFs placed on a virtual bus where
pci_iov_virtfn_bus(pdev, vf_idx) !=3D pdev->bus->number, or when the VF
pci_dev has not been created yet or was removed via sysfs) and returns NULL
when no device is found. Since pf_get_kvm_task() only checks
IS_ERR(vf_pdev), a NULL return is dereferenced by pci_name(vf_pdev) and
vf_pdev->driver.

Second, when vf_pdev is bound to vfio-pci and vfio_dev->kvm is set,
get_pid_task(pid, PIDTYPE_PID) can return NULL if the thread that originally
called KVM_CREATE_VM (vfio_dev->kvm->userspace_pid) has exited while other
VMM threads keep the VM alive. In that case pf_get_kvm_task() returns NULL
instead of an error pointer, and pf_vf_msghandler() treats vf->kvm_task =3D=
=3D
NULL as a host-owned VF:

	if (vf->kvm_task) {
		...
		uid =3D __kuid_val(cred->uid);
		gid =3D __kgid_val(cred->gid);
		rcu_read_unlock();
	}

Wouldn't that pass the untrusted guest-supplied uid and gid from the vsock
header directly to hw->msg_relay()?

> +	} else if (!strncmp(vf_pdev->driver->name, KBUILD_MODNAME,
> +			    strlen(KBUILD_MODNAME))) {
> +		/* VF is under control of our driver, KVM task is not applicable */
> +		task =3D NULL;
> +	} else {
> +		task =3D ERR_PTR(-EPERM);
> +	}
> +	pci_dev_put(vf_pdev);
> +	return task;
> +}

[Severity: High]
What protects vf_pdev->driver, pci_get_drvdata(vf_pdev), and vfio_dev->kvm
against concurrent driver unbind or VFIO device close in pf_get_kvm_task()?

Without holding device_lock(&vf_pdev->dev) or vfio_dev->dev_set->lock, a
concurrent sysfs unbind (device_release_driver_internal() ->
vfio_pci_remove()) can clear vf_pdev->driver and free vfio_dev after the
!vf_pdev->driver check, or vfio_device_put_kvm() can clear and free
vfio_dev->kvm while pf_get_kvm_task() dereferences
vfio_dev->kvm->userspace_pid.

> +
> +/* Handler thread for incoming messages from the VF driver to the PF. 1 =
instance
> + * per active VF.
> + */
> +static int pf_vf_msghandler(void *data)
> +{

[ ... ]

> +		mutex_lock(&hw->msg_relay_lock);
> +		if (hw->msg_relay) {
> +			reply_len =3D MAX_VFMSG_SIZE;
> +			msg_rc =3D hw->msg_relay(hw->msg_relay_data, vf->vf_idx,
> +					       vf->request, request_len, uid, gid,
> +					       vf->reply, &reply_len);
> +		} else {
> +			reply_len =3D 0;
> +			msg_rc =3D -ENODEV;
> +		}
> +		mutex_unlock(&hw->msg_relay_lock);
> +
> +		if (reply_len > MAX_VFMSG_SIZE) {
> +			reply_len =3D 0;
> +			msg_rc =3D -E2BIG;
> +		}
> +
> +		cxidev_dbg(&hw->cdev, "vf %d: responding with %ld bytes, rc=3D%d",
> +			   vf->vf_idx, reply_len, msg_rc);
> +		rc =3D write_message_to_vsock(vf->req_sock, vf->reply, reply_len,
> +					    msg_rc, seq);

[Severity: High]
In pf_vf_msghandler(), reply_len is initialized to MAX_VFMSG_SIZE before
calling hw->msg_relay(). If hw->msg_relay() returns a negative error code
without setting *reply_len =3D 0, won't write_message_to_vsock() send
MAX_VFMSG_SIZE (22,452) bytes of stale data from vf->reply to the VF, both
leaking PF memory and causing read_message_from_vsock() on the VF to fail
with -EMSGSIZE and shut down the socket?

[ ... ]

> +err:
> +	cxidev_dbg(&hw->cdev, "vf %d: handler exiting, rc=3D%d", vf->vf_idx, rc=
);
> +
> +	if (vf->kvm_task)
> +		put_task_struct(vf->kvm_task);
> +	kernel_sock_shutdown(vf->req_sock, SHUT_RDWR);
> +	sock_release(vf->req_sock);
> +	vf->req_sock =3D NULL;
> +	mutex_lock(&vf->notif_lock);
> +	if (vf->notif_sock) {
> +		kernel_sock_shutdown(vf->notif_sock, SHUT_RDWR);
> +		sock_release(vf->notif_sock);
> +		vf->notif_sock =3D NULL;
> +	}
> +	mutex_unlock(&vf->notif_lock);
> +
> +	vf->kvm_task =3D NULL;
> +
> +	cass_ac_phys_free(hw, vf->phys_ac);
> +	vf->phys_ac =3D 0;
> +
> +	return rc;
> +}

[Severity: Critical]
Is it safe for pf_vf_msghandler() to clear vf->req_sock =3D NULL without
locking before releasing vf->notif_sock, clearing vf->kvm_task, and calling
cass_ac_phys_free(hw, vf->phys_ac)?

Other paths treat vf->req_sock !=3D NULL as the indicator that a VF slot is
active:
- In pf_vf_listener(), if vf->req_sock becomes NULL right as SR-IOV is being
  disabled in cass_remove() -> disable_sriov(), pf_vf_listener() skips
  kthread_stop(hw->vfs[vf_idx].task), allowing disable_sriov() and
  cass_remove() to free hw while pf_vf_msghandler() is still running
  cass_ac_phys_free(hw, vf->phys_ac).
- In handle_vf_req_conn(), a reconnecting VF can see vf->req_sock =3D=3D NU=
LL
  and allocate a new vf->phys_ac and vf->kvm_task, which the exiting
  pf_vf_msghandler() thread then overwrites and frees.
- In handle_vf_notif_conn(), checking hw->vfs[i].req_sock without holding
  vf->notif_lock can race with this teardown and install vf->notif_sock
  after the notif_lock cleanup block has already run.

> +
> +/* Probe inactive VFs from range_min to range_max inclusive */
> +static int pf_probe_vfs(struct cass_dev *hw, struct socket *sock,
> +			int range_min, int range_max)
> +{
> +	int i, rc;
> +	int magic;
> +	size_t msg_len =3D sizeof(magic);
> +	union c_pi_ipd_cfg_pf_vf_irq irqs =3D {
> +		.irq =3D 0,
> +	};
> +
> +	for (i =3D range_min; i <=3D range_max; i++)
> +		if (!hw->vfs[i].req_sock) /* Only probe VFs that aren't already active=
 */
> +			irqs.irq |=3D 1ULL << i;
> +	if (!irqs.irq)
> +		return 0;
> +
> +	magic =3D CXI_SRIOV_MAGIC1;
> +	rc =3D write_message_to_vsock(sock, &magic, sizeof(magic), 0, 0);
> +	if (rc < 0) {
> +		cxidev_err(&hw->cdev, "could not send magic to incoming VF: %d", rc);
> +		return rc;
> +	}
> +
> +	cass_write(hw, C_PI_IPD_CFG_PF_VF_IRQ, &irqs,
> +		   sizeof(union c_pi_ipd_cfg_pf_vf_irq));
> +
> +	msg_len =3D sizeof(magic);
> +	do {
> +		rc =3D read_message_from_vsock(sock, &magic, &msg_len, NULL, NULL, NUL=
L, NULL);
> +		if (rc =3D=3D -EINTR)
> +			schedule();
> +	} while (rc =3D=3D -EINTR);
> +	if (rc < 0) {
> +		cxidev_err(&hw->cdev, "could not read magic from incoming VF: %d", rc);
> +		return rc;
> +	}
> +
> +	return magic;
> +}
> +
> +/* Identify which VF an incoming connection belongs to, by probing the P=
F-to-VF
> + * interrupt of VFs that do not have an active connection.
> + */
> +static int pf_vf_handshake(struct cass_dev *hw, struct socket *sock)
> +{
> +	int range_min =3D 0;
> +	int range_max =3D hw->num_vfs - 1;
> +	int range_mid, rc, seq, vf_idx;
> +	int magic;
> +
> +	seq =3D 0; /* Handshake sequence number */
> +	do {
> +		magic =3D CXI_SRIOV_MAGIC1 + seq;
> +		range_mid =3D range_min + (range_max - range_min) / 2;
> +		if (pf_probe_vfs(hw, sock, range_min, range_mid) =3D=3D magic) {
> +			seq +=3D 1;
> +			range_max =3D range_mid;
> +		} else if (pf_probe_vfs(hw, sock, range_mid + 1, range_max) =3D=3D mag=
ic) {
> +			seq +=3D 1;
> +			range_min =3D range_mid + 1;
> +		} else {
> +			break;
> +		}
> +	} while (range_max !=3D range_min);
> +
> +	if (range_max !=3D range_min) {
> +		cxidev_err(&hw->cdev, "vf search failed");
> +		return -ENOENT;
> +	}
> +	vf_idx =3D range_min;

[Severity: High]
How does the binary search in pf_vf_handshake() work when a VF in the upper
half [range_mid + 1, range_max] connects while at least one VF in the lower
half [range_min, range_mid] is still inactive?

1. pf_vf_handshake() first calls pf_probe_vfs(hw, sock, range_min,
   range_mid), which sends CXI_SRIOV_MAGIC1 over sock to the connecting
   upper-half VF, raises C_PI_IPD_CFG_PF_VF_IRQ only for VFs in
   [range_min, range_mid], and blocks waiting for a reply on sock.
2. In cass_vf_init(), the connecting upper-half VF receives
   CXI_SRIOV_MAGIC1 and enters wait_for_completion_timeout(&hw->pf_to_vf_co=
mp,
   CXI_SRIOV_VF_TIMEOUT), waiting for an interrupt that was only sent to the
   lower half, and aborts after 10 seconds with -ETIMEDOUT.
3. Meanwhile, any other inactive VFs in [range_min, range_mid] that have
   already registered pf_to_vf_int_cb() will have hw->pf_to_vf_comp
   completed prematurely by the probe interrupt.
4. Also, when hw->num_vfs =3D=3D 1, both range_min and range_max start at 0=
; if
   pf_probe_vfs() fails and breaks out of the loop, range_max !=3D range_min
   is false (0 !=3D 0), so doesn't pf_vf_handshake() still succeed and retu=
rn
   vf_idx =3D 0?

[ ... ]

> +/* Handle an incoming request connection from a VF */
> +static void handle_vf_req_conn(struct cass_dev *hw,
> +			       struct socket *incoming)
> +{
> +	struct sockaddr_vm peeraddr;
> +	struct cass_vf *vf;
> +	int rc, vf_idx;
> +
> +	rc =3D kernel_getpeername(incoming, (struct sockaddr *)&peeraddr);
> +	if (rc < 0) {
> +		cxidev_err(&hw->cdev, "could not get peer addr for vf: %d", rc);
> +		goto close_sock;
> +	}
> +
> +	vf_idx =3D pf_vf_handshake(hw, incoming);

[Severity: Critical]
What prevents an unprivileged local host user (via vsock_loopback) or an
unauthorized guest VM from claiming a VF in pf_vf_handshake()?

In enable_sriov(), vsock_loopback is loaded and pf_vf_listener() binds
CXI_SRIOV_VSOCK_PORT and CXI_SRIOV_VSOCK_NOTIF_PORT to VMADDR_CID_ANY in
init_net. In pf_probe_vfs(), the PF prompts the peer with CXI_SRIOV_MAGIC1
and accepts the predictable value CXI_SRIOV_MAGIC1 + seq in reply without
verifying that the peer actually received the hardware interrupt or
validating peeraddr.svm_cid in handle_vf_req_conn(). If the VF is bound to
the host driver (so vf->kvm_task is NULL), a local process can claim the VF
slot and supply arbitrary uid and gid values (such as 0) in the vsock
message header.

Also, since pf_vf_listener() binds fixed global ports CXI_SRIOV_VSOCK_PORT
(0x17db) and CXI_SRIOV_VSOCK_NOTIF_PORT (0x17dc) with VMADDR_CID_ANY, won't
enabling SR-IOV on a second Cassini PF in the same system fail in
vsock_create_listen() -> kernel_bind() with -EADDRINUSE?

[ ... ]

> +/* Handle an incoming notification connection from a VF */
> +static void handle_vf_notif_conn(struct cass_dev *hw,
> +				 struct socket *incoming)
> +{
> +	struct sockaddr_vm peeraddr;
> +	struct cass_vf *vf;
> +	int rc, vf_idx, i;
> +	unsigned int token;
> +	struct cass_vf_notif_ping ping =3D {
> +		.op =3D CASS_VF_NOTIF_OP_PING,
> +	};
> +	size_t msg_len;
> +
> +	rc =3D kernel_getpeername(incoming, (struct sockaddr *)&peeraddr);
> +	if (rc < 0) {
> +		cxidev_err(&hw->cdev,
> +			   "could not get peer addr for notification connection: %d", rc);
> +		goto close_sock;
> +	}
> +
> +	/* Read token to identify which VF this is */
> +	msg_len =3D sizeof(token);
> +	do {
> +		rc =3D read_message_from_vsock(incoming, &token, &msg_len, NULL, NULL,=
 NULL, NULL);
> +		if (rc =3D=3D -EINTR)
> +			schedule();
> +	} while (rc =3D=3D -EINTR);

[ ... ]

> +	vf->notif_seq =3D 0;
> +	vf->notif_sock =3D incoming;
> +	mutex_unlock(&vf->notif_lock);
> +	cxidev_dbg(&hw->cdev, "vf %d: notification socket connected", vf_idx);
> +
> +	/* Send test notification */
> +	msg_len =3D sizeof(ping);
> +	rc =3D cxi_send_msg_to_vf(&hw->cdev, vf_idx, &ping, msg_len,
> +				NULL, NULL);

[Severity: High]
Can an unresponsive peer hang pf_vf_listener() or deadlock vf->notif_lock,
and can the -EINTR retry loops spin indefinitely?

1. Accepted AF_VSOCK sockets created by kernel_accept() initialize
   sk->sk_rcvtimeo to MAX_SCHEDULE_TIMEOUT rather than inheriting the
   listener socket's timeout. In handle_vf_req_conn(),
   incoming->sk->sk_rcvtimeo is not set before pf_vf_handshake() (it is only
   set later in pf_vf_msghandler()), and in handle_vf_notif_conn(),
   sk_rcvtimeo is never set on incoming / vf->notif_sock at all. If a peer
   connects and sends nothing, pf_vf_listener() blocks forever; similarly,
   if a VF stops responding to notifications, cxi_send_msg_to_vf() blocks
   forever in cxi_vsock_send() while holding vf->notif_lock, deadlocking
   teardown in pf_vf_msghandler() and pf_vf_listener().
2. In pf_probe_vfs(), handle_vf_notif_conn(), and cass_vf_init(), the loops:

	do {
		rc =3D read_message_from_vsock(...);
		if (rc =3D=3D -EINTR)
			schedule();
	} while (rc =3D=3D -EINTR);

   do not check kthread_should_stop() or signal_pending(). When a signal or
   kthread_stop() is pending, kernel_recvmsg() immediately returns -EINTR
   and schedule() with state TASK_RUNNING returns without sleeping, causing
   a tight infinite loop.

[ ... ]

> +static int enable_sriov(struct pci_dev *pdev, int num_vfs)
> +{
> +	int rc;
> +	int sriov;
> +	u16 offset;
> +	u16 stride;
> +	union c_pi_cfg_pri_sriov pri_sriov =3D {};
> +	struct cass_dev *hw =3D pci_get_drvdata(pdev);
> +
> +	rc =3D request_module("vsock");
> +	if (rc) {
> +		cxidev_err(&hw->cdev, "could not load vsock module");
> +		goto err_novf;
> +	}
> +
> +	rc =3D request_module("vsock_loopback");
> +	if (rc) {
> +		cxidev_err(&hw->cdev, "could not load vsock_loopback module");
> +		goto err_novf;
> +	}
> +
> +	hw->num_vfs =3D num_vfs;
> +
> +	if (!hw->vf_listener)
> +		hw->vf_listener =3D kthread_run(pf_vf_listener, hw, "cxi_vf_listener");
> +	if (IS_ERR(hw->vf_listener)) {
> +		cxidev_err(&hw->cdev, "could not start vf listener thread");
> +		rc =3D PTR_ERR(hw->vf_listener);
> +		hw->vf_listener =3D NULL;
> +		goto err_novf;
> +	}
> +
> +	/* The VF Offset and Stride need to match the SR-IOV configuration. */
> +	sriov =3D pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_SRIOV);
> +	if (!sriov) {
> +		cxidev_err(&hw->cdev, "No extended capabilities found\n");
> +		rc =3D -ENODEV;
> +		goto err_kill_listener;
> +	}
> +
> +	pci_read_config_word(pdev, sriov + PCI_SRIOV_VF_OFFSET, &offset);
> +	pci_read_config_word(pdev, sriov + PCI_SRIOV_VF_STRIDE, &stride);
> +
> +	pri_sriov.vf_offset =3D offset;
> +	pri_sriov.vf_stride =3D stride;
> +
> +	cass_write(hw, C_PI_CFG_PRI_SRIOV, &pri_sriov,
> +		   sizeof(union c_pi_cfg_pri_sriov));
> +
> +	rc =3D pci_enable_sriov(pdev, num_vfs);
> +	if (rc) {
> +		cxidev_err(&hw->cdev, "SRIOV enable failed %d\n", rc);
> +		goto err_kill_listener;
> +	}
> +
> +	return num_vfs;
> +
> +err_kill_listener:
> +	kthread_stop(hw->vf_listener);
> +	hw->vf_listener =3D NULL;
> +err_novf:
> +	hw->num_vfs =3D 0;
> +	return rc;
> +}

[Severity: High]
Does enable_sriov() race with pf_vf_listener() when creating the listening
sockets?

enable_sriov() starts pf_vf_listener() asynchronously via kthread_run() and
immediately calls pci_enable_sriov(pdev, num_vfs) without waiting for
pf_vf_listener() to finish calling vsock_create_listen() for hw->vf_req_sock
and hw->vf_notif_sock. When sriov_drivers_autoprobe is enabled on the host,
pci_enable_sriov() synchronously probes VFs (cass_probe() -> cass_vf_init()
-> kernel_connect()), which can run before pf_vf_listener() has bound
CXI_SRIOV_VSOCK_PORT. Also, if vsock_create_listen() fails in
pf_vf_listener(), enable_sriov() will still enable SR-IOV and return
num_vfs.

[Severity: Medium]
Are there also a couple of error-handling and ordering issues in
enable_sriov()?

1. When modprobe fails, request_module() returns a positive wait status
   (such as 256). Jumping to err_novf returns that positive rc from
   cass_sriov_configure() to sriov_numvfs_store(), which only treats negati=
ve
   values as errors.
2. PCI_SRIOV_VF_OFFSET and PCI_SRIOV_VF_STRIDE are read and written to
   C_PI_CFG_PRI_SRIOV before pci_enable_sriov() writes PCI_SRIOV_NUM_VF
   (which under the PCIe SR-IOV specification can update First VF Offset and
   VF Stride).

> +
> +int cass_sriov_configure(struct pci_dev *pdev, int num_vfs)
> +{
> +	if (num_vfs < 0)
> +		return -EINVAL;
> +
> +	if (num_vfs =3D=3D 0) {
> +		disable_sriov(pdev);
> +		return 0;
> +	}
> +
> +	return enable_sriov(pdev, num_vfs);
> +}

[Severity: High]
Should cass_sriov_configure() or enable_sriov() validate that num_vfs does
not exceed C_NUM_VFS (64) before setting hw->num_vfs =3D num_vfs?

In struct cass_dev, vfs[] has fixed size C_NUM_VFS (64), and pf_probe_vfs()
evaluates 1ULL << i for i up to hw->num_vfs - 1. If num_vfs > C_NUM_VFS,
pf_vf_listener(), pf_probe_vfs(), handle_vf_req_conn(),
handle_vf_notif_conn(), cxi_send_msg_to_vf(), and cass_vf_get_token() can
shift past 63 bits and index hw->vfs[] out of bounds.

[ ... ]

> +/* VF-side handler thread for receiving notifications from PF */
> +static int vf_notif_handler(void *data)
> +{
> +	struct cass_dev *hw =3D (struct cass_dev *)data;
> +	int rc;
> +	size_t msg_len, rsp_len;
> +
> +	cxidev_dbg(&hw->cdev, "started notification handler");
> +
> +	while (!kthread_should_stop()) {
> +		msg_len =3D MAX_VFMSG_SIZE;
> +		rc =3D read_message_from_vsock(hw->vf_notif_sock, hw->vf_notif_buf,
> +					     &msg_len, NULL, NULL, NULL, NULL);

[ ... ]

> +		rsp_len =3D 0;
> +		rc =3D dispatch_vf_notif(hw, hw->vf_notif_buf, msg_len,
> +				       hw->vf_notif_rsp_buf, &rsp_len);
> +		rc =3D write_message_to_vsock(hw->vf_notif_sock, hw->vf_notif_rsp_buf,
> +					    rsp_len, rc, 0);
> +		if (rc < 0) {
> +			cxidev_err(&hw->cdev, "failed to send notification response: %d", rc);
> +			break;
> +		}
> +	}

[Severity: High]
In vf_notif_handler(), read_message_from_vsock() passes NULL for seq and
write_message_to_vsock() hardcodes seq =3D 0 in the reply.

Since cxi_send_msg_to_vf() sends notifications via cxi_vsock_send() with
hw->vfs[vf_num].notif_seq++, and cxi_vsock_send() checks:

	if (rsp_seq !=3D seq) {
		kernel_sock_shutdown(sock, SHUT_RDWR);
		cxidev_err(&hw->cdev, "expected response seq %d but got %d",
			   seq, rsp_seq);
		return -EPROTO;
	}

won't every notification after the initial ping (where notif_seq is 0) fail
with -EPROTO and shut down the notification socket?

[ ... ]

> +int cass_vf_init(struct cass_dev *hw)
> +{

[ ... ]

> +	if (!hw->with_vf_support)
> +		return 0;
> +
> +	init_completion(&hw->pf_to_vf_comp);
> +
> +	mutex_init(&hw->vf_cmd_lock);

[Severity: High]
If hw->with_vf_support is false on a VF, cass_vf_init() returns 0 before
mutex_init(&hw->vf_cmd_lock). When cass_probe() subsequently calls
cxi_send_msg_to_pf(), won't mutex_lock(&hw->vf_cmd_lock) operate on an
uninitialized mutex?

[ ... ]

> +void cass_vf_fini(struct cass_dev *hw)
> +{
> +	if (!hw->with_vf_support)
> +		return;
> +
> +	free_irq(hw->pf_vf_vec, hw);
> +
> +	if (hw->vf_notif_handler) {
> +		kthread_stop(hw->vf_notif_handler);
> +		hw->vf_notif_handler =3D NULL;
> +	}

[Severity: Critical]
Can kthread_stop() be called on a task_struct that has already exited and
been freed in cass_vf_fini(), disable_sriov(), enable_sriov(), and
pf_vf_listener()?

kthread_run() does not take an extra reference on task_struct for the
caller, so if a kthread returns before kthread_stop() is called, its
task_struct is freed on exit:
- In cass_vf_fini(), if the PF already closed the notification socket (or a
  socket error occurred), vf_notif_handler() breaks out of its loop and
  returns, leaving hw->vf_notif_handler pointing to a freed task_struct when
  kthread_stop(hw->vf_notif_handler) is called.
- In pf_vf_listener(), if vsock_create_listen() or kernel_accept() returns =
an
  error, pf_vf_listener() exits immediately, after which enable_sriov() or
  disable_sriov() calls kthread_stop(hw->vf_listener).
- In pf_vf_msghandler(), the thread exits whenever a VF disconnects or
  pf_get_kvm_task() fails (and disable_sriov() calls pci_disable_sriov()
  before stopping hw->vf_listener), which can race with pf_vf_listener()
  calling kthread_stop(hw->vfs[vf_idx].task).

[ ... ]

> diff --git a/drivers/net/ethernet/hpe/ss1/cass_vf.c b/drivers/net/etherne=
t/hpe/ss1/cass_vf.c
> new file mode 100644
> index 0000000000000..fde40d1b491ae
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/ss1/cass_vf.c
> @@ -0,0 +1,58 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2026 Hewlett Packard Enterprise Development LP */
> +
> +#include <linux/hpe/cxi/cxi.h>
> +#include <linux/dma-mapping.h>
> +#include "cass_core.h"
> +#include "cass_vf.h"
> +
> +/* Compile-time assertions to ensure VF structures can be safely cast to=
 their
> + * corresponding PF structures and vice versa.
> + * These verify that the common fields are at the same offsets in both s=
tructures.
> + */
> +static inline void __cxi_vf_structure_offset_checks(void)
> +{
> +	/* Ensure cxi_lni_priv_vf can be cast to cxi_lni_priv */
> +	BUILD_BUG_ON(offsetof(struct cxi_lni_priv_vf, dev) !=3D
> +		     offsetof(struct cxi_lni_priv, dev));
> +	BUILD_BUG_ON(offsetof(struct cxi_lni_priv_vf, lni) !=3D
> +		     offsetof(struct cxi_lni_priv, lni));

[ ... ]

> +	/* Ensure cxi_md_priv_vf can be cast to cxi_md_priv */
> +	BUILD_BUG_ON(offsetof(struct cxi_md_priv_vf, lni_priv) !=3D
> +		     offsetof(struct cxi_md_priv, lni_priv));
> +	BUILD_BUG_ON(offsetof(struct cxi_md_priv_vf, device) !=3D
> +		     offsetof(struct cxi_md_priv, device));
> +	BUILD_BUG_ON(offsetof(struct cxi_md_priv_vf, md) !=3D
> +		     offsetof(struct cxi_md_priv, md));
> +	BUILD_BUG_ON(offsetof(struct cxi_md_priv_vf, sgt) !=3D
> +		     offsetof(struct cxi_md_priv, sgt));
> +	BUILD_BUG_ON(offsetof(struct cxi_md_priv_vf, pages) !=3D
> +		     offsetof(struct cxi_md_priv, pages));
> +	BUILD_BUG_ON(offsetof(struct cxi_md_priv_vf, flags) !=3D
> +		     offsetof(struct cxi_md_priv, flags));
> +}

[Severity: Critical]
Because __cxi_vf_structure_offset_checks() is declared static inline and has
no callers, the compiler discards the function without evaluating any of the
BUILD_BUG_ON() assertions (unlike static_assert() at file scope).

If these checks are evaluated, three of them fail due to layout mismatches
between cass_vf.h and cxi_core.h:
1. struct cxi_lni_priv in cxi_core.h has
   DECLARE_BITMAP(leased_pids, 1 << MAX_PID_BITS) (64 bytes) between dev and
   lni, whereas struct cxi_lni_priv_vf in cass_vf.h places lni immediately
   after dev. When VF code such as cxi_map_sgtable_vf() or
   cxi_domain_alloc_vf() runs container_of(lni, struct cxi_lni_priv, lni) on
   a struct cxi_lni_priv_vf allocation, won't the resulting pointer point 64
   bytes before the allocated object?
2. In struct cxi_md_priv (cxi_core.h), pages precedes sgt, whereas in
   struct cxi_md_priv_vf (cass_vf.h), sgt precedes pages, swapping the two
   pointers when casting between the two structures.

> diff --git a/drivers/net/ethernet/hpe/ss1/cass_vf_notif.c b/drivers/net/e=
thernet/hpe/ss1/cass_vf_notif.c
> new file mode 100644
> index 0000000000000..c46e198698736
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/ss1/cass_vf_notif.c
> @@ -0,0 +1,51 @@

[ ... ]

> +int dispatch_vf_notif(struct cass_dev *hw, const void *req, size_t req_l=
en,
> +		      void *rsp, size_t *rsp_len)
> +{
> +	const struct cass_vf_notif_common *common_req =3D req;
> +	enum cass_vf_notif_ops op;
> +	const struct cass_vf_notif_info *info;
> +
> +	op =3D common_req->op;
> +	if (op <=3D CASS_VF_NOTIF_OP_INVALID || op >=3D CASS_VF_NOTIF_OP_MAX)
> +		return -EINVAL;
> +
> +	info =3D &vf_notif_info[op];
> +	if (!info->handler)
> +		return -EOPNOTSUPP;
> +
> +	if (req_len !=3D info->req_size)
> +		return -EINVAL;

[Severity: High]
What happens when a 0-byte or short message is received over vsock in
dispatch_vf_notif(), pf_probe_vfs(), cass_vf_init(), or pf_vf_msghandler()?

read_message_from_vsock() accepts any message with hdr.len <=3D *msg_len
(including hdr.len =3D=3D 0, where it writes nothing to msg and returns
sizeof(hdr) > 0):
- In dispatch_vf_notif(), common_req->op is read before checking whether
  req_len >=3D sizeof(*common_req).
- In pf_probe_vfs(), magic is set to CXI_SRIOV_MAGIC1 before sending and
  msg_len =3D=3D sizeof(magic) is not checked after read_message_from_vsock=
(),
  so a 0-byte reply leaves magic =3D=3D CXI_SRIOV_MAGIC1 and falsely matches
  seq =3D=3D 0.
- In cass_vf_init(), magic and token_resp are uninitialized on the stack,
  and neither msg_len =3D=3D sizeof(magic) after read_message_from_vsock() =
nor
  resp_len =3D=3D sizeof(token_resp) (or rc > 0) after cxi_send_msg_to_pf()=
 is
  verified before using them.
- In pf_vf_msghandler(), if the receive loop exits before invoking
  hw->msg_relay(), reply_len is uninitialized on the stack when passed to
  hw->msg_relay(hw->msg_relay_data, vf->vf_idx, NULL, 0, 0, 0, NULL,
  &reply_len).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-cxi-netdev=
-submission-v1-0-8c2c391cc283@hpe.com?part=3D19
