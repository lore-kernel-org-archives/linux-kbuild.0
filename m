Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480542;
	b=ZVY+LTlqQdmAeT8s/qKwn1cG84B0CR8/8a6SF1F5GqlWsXEDKxc0gib7eop7WDmRGgO/
	 nCJz+Y18sxDUWTX5n1dS9iZHswwNC0FKkyeAS+WLycEr9i5gPd6blmz4B+kIL+abcEdwr
	 gbyv3v5SUD6wjBp13KaOxOw0n+BLSTMFAFeSjo7F2nti+DFVRL7ltsUtVLhzfGliTKX2Y
	 8VL5goASGVcMiJUFTlEcB19WP5Eh2WI1AVgfw611uVeLWBmpBtcGyDW5EFBh80fQQX1dn
	 E3odCn4/8PQ3WFpH3PjGgsRG7piZfsqAWnAB8rWiil0/Yv6ejz2d5P5KZ7zY/IZpXTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480542;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AIJ3tuXnNPzlVCwgQxc5uJ3XoLDplyHuZgpHaHEA99A=;
	b=OPzHdjqXZl4KisSy4XHI3v8DcIF1KWnjXTyFeRITMFRi94nePEjtE6URh19Qs/9IFcBn
	 1K42ktuEy6B/tkjb/wC1YBW5Uh8oExsVv8z5UEAzDl0LJ+qzBzirYLOew4HeJhIW3YBk8
	 vk9qZwZP77dkoWGqUhU/WTXZo9T5emC7S4MeEf2AMenF1ecWVJuOKj9f7h2EYxzMaLw0M
	 Zb402PIoiJp/l0McXhZOUgtC+4krrdoxGs86Tka6twNRRfbcGEo2NpwhPPEs8hgae5FGk
	 VwAGIbwIc0BomouJsvccW9ydrE1uzsQqOUL7Sn4ZwVrq1Hwiz2GvZN3uzZewoDjz9YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DTnad2/o";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03127606A31C
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 21:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DTnad2/o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA5AC1F00919;
	Sat, 31 Oct 2026 21:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793480540;
	bh=AIJ3tuXnNPzlVCwgQxc5uJ3XoLDplyHuZgpHaHEA99A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DTnad2/oDpBJK8Osx9W+2/rDsRw25NjrnDYd3mjwrKk69EVu6Y24zmUr2l3mIiSv6
	 WYFtUn7sa12BjenonoW3k/as8aZPfLLfq9YPaHSB30qkdbjLdklaxGat0jcsExTrco
	 viISFZR5iKDEZCZH4qm6EITSIpRfZlLFMLgC1GMqXkPS1Fec4w/NvpfKmgcIs5d5m8
	 Pk3bEJnEp82mjULDhinPkmK96Hcj6ThDlQvqXJ1MfeSi+yeMfiVjXcLXml3MQetQFl
	 xHkbhbvTySb/bY+AvbvUscAtQEvtllFy/E7sCKyXv6TqH8DAqc7tLRvAO+ypwkl+nw
	 x05K1VV6xKuIg==
Message-ID: <sashiko-outbox-192148@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 22/23] net: hpe: ss1: add the Ethernet personality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Doug Ledford" <doug.ledford@hpe.com>, "Slingshot Open Source Team" <slingshot-os-team@groups.ext.hpe.com>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Richard
 Cochran" <richardcochran@gmail.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Guenter
 Roeck" <linux@roeck-us.net>
Cc: linux-kbuild@vger.kernel.org, "Sandeep Bhoot" <sandeep.bhoot@hpe.com>
In-Reply-To: <20261030-cxi-netdev-submission-v1-22-8c2c391cc283@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030-cxi-netdev-submission-v1-22-8c2c391cc283@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 21:02:19 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 33 potential issue=
(s) to consider:
- [Critical] net: hpe: ss1: use-after-free and NULL dereference in eth_rece=
ive()
- [High] net: hpe: ss1: unlocked queue and CQ access in debugfs dump_dev()
- [High] net: hpe: ss1: lock order inversion between rtnl_lock and dev_list=
_mutex
- [High] net: hpe: ss1: skb leak and dangling napi.skb in eth_receive()
- [High] net: hpe: ss1: priority RX buffer leak on drop in eth_receive()
- [High] net: hpe: ss1: duplicate DMA post and page leak in append_rx_buffe=
r()
- [High] net: hpe: ss1: uninitialized checksum_ctrl in cxi_eth_get_skb_chec=
ksum_settings()
- [High] net: hpe: ss1: TX queue stall in cxi_tx_eth_poll() on EQ credit ch=
eck
- [High] net: hpe: ss1: DMA skb leak and missing BQL reset in free_tx_queue=
()
- [High] net: hpe: ss1: PTP packet truncation after cxi_eth_open() resets t=
imestamp cfg
- [High] net: hpe: ss1: invalid RMU filter and RSS programming in cxi_eth_m=
ac_addr()
- [High] net: hpe: ss1: NULL deref in cxi_set_channels() and div-by-zero in=
 ringparam
- [High] net: hpe: ss1: invalid PTE and TXQ service limits in hw_setup()
- [High] net: hpe: ss1: page refcount leak and duplicate DMA post in append=
_rx_buffer()
- [High] net: hpe: ss1: service leak in hw_cleanup() and hw_setup() on asyn=
c LNI free
- [High] net: hpe: ss1: shared IRQ notifier attached before NAPI and EQ poi=
nter init
- [High] net: hpe: ss1: GFP_KERNEL sleep under addr_list_lock in cxi_eth_se=
t_rx_mode()
- [High] net: hpe: ss1: divide-by-zero and ignored ring sizes in cxi_set_ri=
ngparam()
- [High] net: hpe: ss1: spinlock self-deadlock in cxi_rxtx_profile_list_des=
troy()
- [High] net: hpe: ss1: self-collision in unique_vni_space() on profile upd=
ate
- [Medium] net: hpe: ss1: broken module_param types and queue bounds in ini=
t()
- [Medium] net: hpe: ss1: non-atomic updates to shared ndev->stats across q=
ueues
- [Medium] net: hpe: ss1: standard MAC and FEC stats duplicated in ethtool =
-S
- [Medium] net: hpe: ss1: eth_receive() ignores NETIF_F_RXCSUM feature flag
- [Medium] net: hpe: ss1: physical LAC leak and RX queue count clobber in h=
w_setup()
- [Medium] net: hpe: ss1: stale RSS indirection state in hw_setup() when RX=
 channels is 1
- [Medium] net: hpe: ss1: missing decrement of buffer counters in free_rx_b=
uffers()
- [Medium] net: hpe: ss1: standard FEC and MAC stats exposed in cxi_get_eth=
tool_stats()
- [Medium] net: hpe: ss1: premature link bounce and missing defaults in cxi=
_set_priv_flags()
- [Medium] net: hpe: ss1: missing VNI bounds check and u16 truncation in cx=
i_valid_vni()
- [Medium] net: hpe: ss1: TOCTOU race on VNI uniqueness in RX/TX profile li=
st
- [Medium] net: hpe: ss1: EEPROM offset truncation in cxi_get_module_eeprom=
()
- [Low] net: hpe: ss1: missing kernel-parameters.txt entries for module par=
ams
--

commit 7e1b94faef8516c915b2c860b4b34cce75b248a1
Author: Doug Ledford <doug.ledford@hpe.com>

net: hpe: ss1: add the Ethernet personality

This patch adds the Ethernet netdev personality (cxi-eth) for the Cassini
NIC, including netdev and ethtool operations, hardware timestamp
configuration, RX/TX profile lists, and debugfs support.

> diff --git a/drivers/net/ethernet/hpe/ss1/cxi_eth.c b/drivers/net/etherne=
t/hpe/ss1/cxi_eth.c
> new file mode 100644
> index 0000000000000..f575847120f94
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/ss1/cxi_eth.c
> @@ -0,0 +1,443 @@

[ ... ]

> +unsigned int rss_indir_size =3D 64;
> +module_param(rss_indir_size, int, 0444);
> +MODULE_PARM_DESC(rss_indir_size, "Size of RSS indirection table");
> +
> +unsigned int max_rss_queues =3D 16;
> +module_param(max_rss_queues, int, 0444);
> +MODULE_PARM_DESC(max_rss_queues, "Maximum number of RSS queues (power of=
 2)");
> +
> +unsigned int max_tx_queues =3D 16;
> +module_param(max_tx_queues, int, 0444);
> +MODULE_PARM_DESC(max_tx_queues, "Maximum number of TX queues");
> +
> +unsigned int small_pkts_buf_size =3D CXI_ETH_1_MB;
> +module_param(small_pkts_buf_size, uint, 0444);
> +MODULE_PARM_DESC(small_pkts_buf_size, "Size of a small packets buffer (4=
 KiB to 1 GiB, 4 KiB aligned)");
> +
> +unsigned int small_pkts_buf_count =3D 4;
> +module_param(small_pkts_buf_count, uint, 0444);
> +MODULE_PARM_DESC(small_pkts_buf_count, "Number of small packets buffers =
(1 to 1024)");
> +
> +unsigned int large_pkts_buf_count =3D 1024;
> +module_param(large_pkts_buf_count, uint, 0444);
> +MODULE_PARM_DESC(large_pkts_buf_count, "Number of large packets buffers =
(1 to 10000)");
> +
> +unsigned int buffer_threshold =3D 256;
> +module_param(buffer_threshold, uint, 0444);
> +MODULE_PARM_DESC(buffer_threshold, "Ethernet packets with length greater=
 than"
> +		 " or equal to this threshold are large packets (0 to 16383)");
> +
> +unsigned int lpe_cdt_thresh_id =3D 2;
> +module_param(lpe_cdt_thresh_id, uint, 0444);
> +MODULE_PARM_DESC(lpe_cdt_thresh_id, "LPE append credit id to use (0 to 3=
)");
> +
> +static unsigned int rx_repost_retry_ms =3D 20;
> +module_param(rx_repost_retry_ms, uint, 0444);
> +MODULE_PARM_DESC(rx_repost_retry_ms,
> +		 "Time to wait before retrying to repost an RX buffer, in ms");

[Severity: Low]
These module parameters in cxi_eth.c (including idc_dma_threshold) and
tx_eq_count in cxi_eth_ops.c can be set on the kernel command line at boot.
Should they be documented in Documentation/admin-guide/kernel-parameters.tx=
t?

> +static struct dentry *cxieth_debug_dir;
> +unsigned long rx_repost_retry_jiffies;

[ ... ]

> +static const struct net_device_ops cxi_eth_netdev_ops =3D {
> +	.ndo_open =3D cxi_eth_open,
> +	.ndo_start_xmit =3D cxi_eth_start_xmit,
> +	.ndo_stop =3D cxi_eth_close,
> +	.ndo_set_mac_address =3D cxi_eth_mac_addr,
> +	.ndo_set_rx_mode =3D cxi_eth_set_rx_mode,
> +	.ndo_change_mtu =3D cxi_change_mtu,
> +	.ndo_hwtstamp_get =3D cxi_eth_hwtstamp_get,
> +	.ndo_hwtstamp_set =3D cxi_eth_hwtstamp_set,
> +};

[Severity: Medium]
Since cxi_eth_netdev_ops does not implement ndo_get_stats64, the driver
relies on the shared ndev->stats structure.

In cxi_eth_ops.c, eth_complete(), emit_idc(), emit_dma(), and eth_receive()
update ndev->stats.tx_packets, ndev->stats.tx_bytes, ndev->stats.tx_dropped,
ndev->stats.rx_packets, ndev->stats.rx_bytes, and ndev->stats.rx_dropped
using plain ++ and +=3D operations from concurrent per-queue TX and RX path=
s.

Can these concurrent updates race and lose counter increments? Should the
driver either use DEV_STATS_INC() / DEV_STATS_ADD() or implement
ndo_get_stats64 with per-queue statistics?

> +/* Core is adding a new device */
> +static int add_device(struct cxi_dev *cxi_dev)
> +{

[ ... ]

> +	ndev->hw_features =3D NETIF_F_HW_CSUM | NETIF_F_GSO | NETIF_F_SG |
> +		NETIF_F_GRO | NETIF_F_RXCSUM | NETIF_F_HIGHDMA |
> +		NETIF_F_RXHASH;
> +
> +	ndev->features =3D ndev->hw_features;
> +	ndev->vlan_features =3D ndev->hw_features;
> +	ndev->priv_flags |=3D IFF_UNICAST_FLT | IFF_LIVE_ADDR_CHANGE;
> +
> +	rc =3D netif_set_real_num_queues(ndev,
> +				       min_t(unsigned int, 8, max_tx_queues),
> +				       min_t(unsigned int, 8, max_rss_queues));
> +	if (rc)
> +		goto err_free_rxq;
> +
> +	rc =3D register_netdev(ndev);

[Severity: High]
Can this lock ordering between dev_list_mutex in cxi_core.c and rtnl_lock
deadlock?

In cxi_core.c, cxi_register_client(), cxi_unregister_client(),
cxi_add_device(), and cxi_remove_device() hold dev_list_mutex while calling
add_device() -> register_netdev() and remove_device() -> unregister_netdev(=
),
which acquire rtnl_lock (establishing dev_list_mutex -> rtnl_lock).

However, when cxi_eth_mac_addr() is called under rtnl_lock, it calls:

  cxi_eth_mac_addr()
    -> cxi_set_nid_from_mac()
      -> program_nid()
        -> cxi_send_async_event()

which acquires dev_list_mutex in cxi_core.c while rtnl_lock is already held
(establishing rtnl_lock -> dev_list_mutex), and can also self-deadlock if a
NETDEV_REGISTER notifier changes the MAC address during register_netdev().

[ ... ]

> +static int __init init(void)
> +{
> +	unsigned int new;
> +	int ret;
> +
> +	if (rss_indir_size && (!is_power_of_2(rss_indir_size) ||
> +			       rss_indir_size > CXI_ETH_MAX_INDIR_ENTRIES)) {
> +		rss_indir_size =3D min_t(unsigned int,
> +				       roundup_pow_of_two(rss_indir_size),
> +				       CXI_ETH_MAX_INDIR_ENTRIES);
> +		pr_info("Adjusting rss_indir_size to %d\n", rss_indir_size);
> +	}
> +
> +	if (max_rss_queues > CXI_ETH_MAX_RSS_QUEUES ||
> +	    !is_power_of_2(max_rss_queues)) {
> +		max_rss_queues =3D min_t(unsigned int,
> +				       roundup_pow_of_two(max_rss_queues),
> +				       CXI_ETH_MAX_RSS_QUEUES);
> +		pr_info("Adjusting max_rss_queues to %d\n", max_rss_queues);
> +	}
> +
> +	if (max_tx_queues > CXI_ETH_MAX_TX_QUEUES) {
> +		max_tx_queues =3D CXI_ETH_MAX_TX_QUEUES;
> +		pr_info("Adjusting max_tx_queues to %d\n", max_tx_queues);
> +	}

[Severity: Medium]
There appear to be several issues with how these module parameters are
declared and validated in init():

1. rss_indir_size, max_rss_queues, and max_tx_queues are declared as unsign=
ed
int, but registered with signed int in module_param(..., int, 0444). Does
this trigger a pointer-sign mismatch in param_check_int() and allow negative
values to wrap to large unsigned integers?

2. If max_rss_queues is 0, !is_power_of_2(0) is true and
roundup_pow_of_two(0) performs an undefined shift.

3. On 64-bit platforms, if rss_indir_size or max_rss_queues exceeds
0x80000000U (for example, when -1 is passed), roundup_pow_of_two() returns
0x100000000UL, which min_t(unsigned int, ...) truncates to 0 before compari=
ng
against CXI_ETH_MAX_INDIR_ENTRIES or CXI_ETH_MAX_RSS_QUEUES.

4. max_tx_queues is not checked for 0, which will cause alloc_etherdev_mqs()
in add_device() to fail if max_tx_queues=3D0 is passed.

5. rx_repost_retry_ms and rx_repost_retry_jiffies are computed in init(), b=
ut
never referenced anywhere else in the driver. Should they be removed?

[ ... ]

> diff --git a/drivers/net/ethernet/hpe/ss1/cxi_eth_debugfs.c b/drivers/net=
/ethernet/hpe/ss1/cxi_eth_debugfs.c
> new file mode 100644
> index 0000000000000..310a5a6484b9c
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/ss1/cxi_eth_debugfs.c
> @@ -0,0 +1,206 @@

[ ... ]

> +static void dump_cq_info(struct seq_file *s, struct cxi_cq *cq)
> +{
> +	seq_printf(s, "    id: %u\n", cxi_cq_get_cqn(cq));
> +	seq_printf(s, "    ptrs: size32=3D%u, rp32=3D%llu, hw_rp32=3D%u, wp32=
=3D%llu, hw_wp32=3D%llu\n",
> +		   cq->size32, cq->rp32, cq->status->rd_ptr * 2,
> +		   cq->wp32, cq->hw_wp32);
> +	seq_printf(s, "    free CQ slots: %d\n", __cxi_cq_free_slots(cq));
> +}

[ ... ]

> +static int dump_dev(struct seq_file *s, void *unused)
> +{
> +	struct cxi_eth *dev =3D s->private;
> +	u64 min_ts =3D UINT_MAX;
> +	u64 max_ts =3D 0;
> +	int i;
> +	int j;
> +
> +	seq_printf(s, "rss_indir_size=3D%u\n", rss_indir_size);
> +	seq_printf(s, "idc_dma_threshold=3D%u\n", idc_dma_threshold);
> +	seq_printf(s, "small_pkts_buf_size=3D%u\n", small_pkts_buf_size);
> +	seq_printf(s, "small_pkts_buf_count=3D%u\n", small_pkts_buf_count);
> +	seq_printf(s, "large_pkts_buf_count=3D%u\n", large_pkts_buf_count);
> +	seq_printf(s, "num rx_pending=3D%u\n", dev->ringparam.rx_pending);
> +	seq_printf(s, "num rx_mini_pending=3D%u\n", dev->ringparam.rx_mini_pend=
ing);
> +	seq_printf(s, "num tx_pending=3D%u\n", dev->ringparam.tx_pending);
> +	seq_printf(s, "num_prio_buffers=3D%u\n", dev->num_prio_buffers);
> +	seq_printf(s, "num_req_buffers=3D%u\n", dev->num_req_buffers);
> +
> +	if (!dev->is_active)
> +		return 0;
> +
> +	seq_printf(s, "shared TGT REQ CQ=3D%u\n",
> +		   cxi_cq_get_cqn(dev->cq_tgt_req));
> +
> +	for (i =3D 0; i < dev->res.rss_queues; i++) {
> +		seq_printf(s, "RX queue %u\n", i);
> +		dump_rx_queue(s, &dev->rxqs[i]);
> +	}
> +
> +	if (dev->res.rss_queues) {
> +		seq_printf(s, "PTP RX queue %u\n", PTP_RX_Q);
> +		dump_rx_queue(s, &dev->rxqs[PTP_RX_Q]);
> +	}
> +
> +	for (i =3D 0; i < dev->cur_txqs; i++) {
> +		seq_printf(s, "TX queue %u\n", i);
> +		dump_tx_queue(s, &dev->txqs[i], dev);
> +	}

[Severity: High]
Can reading the debugfs file race with hw_cleanup() or cxi_set_channels() a=
nd
cause a NULL pointer dereference or use-after-free?

dump_dev() checks dev->is_active and then dereferences dev->cq_tgt_req,
dev->rxqs[i] (rx->eq, rx->pt, rx->cq_tgt_prio), and dev->txqs[i]
(txq->dev->ndev, txq->eq, txq->eth1_cq, txq->eth2_cq, txq->shared_cq) witho=
ut
holding rtnl_lock() or any device lock.

Concurrently, hw_cleanup() can tear down and NULL out these pointers, or
cxi_set_rx_channels() / cxi_set_tx_channels() can shrink and free queues in
cxi_shrink_rx_channels() / cxi_shrink_tx_channels() before updating
dev->res.rss_queues and dev->cur_txqs.

In addition, dump_cq_info() calls __cxi_cq_free_slots(cq), which modifies
cq->rp32 without synchronization against the TX path.

> diff --git a/drivers/net/ethernet/hpe/ss1/cxi_eth_ops.c b/drivers/net/eth=
ernet/hpe/ss1/cxi_eth_ops.c
> new file mode 100644
> index 0000000000000..d19a6a27aa23f
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/ss1/cxi_eth_ops.c
> @@ -0,0 +1,2367 @@

[ ... ]

> +static unsigned int eth_complete(struct cxi_eth *dev, struct tx_queue *t=
xq,
> +				 const union c_event *event, int budget,
> +				 unsigned int *pkts, unsigned int *bytes)
> +{
> +	struct net_device *ndev =3D dev->ndev;
> +	struct sk_buff *skb;
> +	enum c_return_code return_code;
> +
> +	if (event->hdr.event_size =3D=3D C_EVENT_SIZE_16_BYTE) {
> +		return_code =3D event->init_short.return_code;
> +		skb =3D (void *)event->init_short.user_ptr;
> +	} else {
> +		return_code =3D event->init_long.return_code;
> +		skb =3D (void *)event->init_long.user_ptr;
> +	}
> +
> +	if (skb =3D=3D NULL) {
> +		/* Bad IDC commands will generate a SEND event on error. */
> +		if (return_code =3D=3D C_RC_OK)
> +			netdev_warn_once(dev->ndev,
> +					 "Successful command with NULL skb\n");
> +
> +		ndev->stats.tx_dropped++;
> +
> +		return 0;
> +	}
> +
> +	if (return_code =3D=3D C_RC_OK) {
> +		ndev->stats.tx_packets++;
> +		ndev->stats.tx_bytes +=3D skb->len;
> +		*pkts +=3D 1;
> +		*bytes +=3D skb->len;
> +	} else {
> +		netdev_err_once(dev->ndev,
> +				"DMA command failed to complete: %d\n",
> +				return_code);
> +		ndev->stats.tx_dropped++;
> +	}
> +
> +	if (skb_shinfo(skb)->tx_flags & SKBTX_IN_PROGRESS)
> +		finalize_tx_tstamp(dev, skb);
> +
> +	unmap_frags(&dev->cxi_dev->pdev->dev, skb);
> +
> +	napi_consume_skb(skb, budget);
> +
> +	return 1;
> +}
> +
> +static int cxi_tx_eth_poll(struct napi_struct *napi, int budget)
> +{
> +	struct tx_queue *txq =3D container_of(napi, struct tx_queue, napi);
> +	struct cxi_eth *dev =3D txq->dev;
> +	struct netdev_queue *dev_queue =3D
> +		netdev_get_tx_queue(dev->ndev, txq->id);
> +	const union c_event *event;
> +	int work_done =3D 0;
> +	unsigned int event_count =3D 0;
> +	unsigned int pkts =3D 0;
> +	unsigned int bytes =3D 0;
> +	unsigned int cdts =3D 0;
> +
> +	txq->stats.polling++;
> +
> +	while (work_done < budget && (event =3D cxi_eq_get_event(txq->eq))) {
> +		switch (event->hdr.event_type) {
> +		case C_EVENT_SEND:
> +			cdts +=3D eth_complete(dev, txq, event, budget, &pkts, &bytes);
> +			work_done++;
> +			break;
> +		default:
> +			netdev_warn(dev->ndev, "Unhandled event %u, rc %d\n",
> +				    event->hdr.event_type,
> +				    event->hdr.return_code);
> +			print_hex_dump(KERN_INFO,
> +				       "cxi eth unexpected tx event: ",
> +				       DUMP_PREFIX_ADDRESS, 16, 1, event,
> +				       (8 << event->hdr.event_size), false);
> +		}
> +
> +		event_count++;
> +		if (event_count =3D=3D 16) {
> +			cxi_eq_int_disable(txq->eq);
> +			event_count =3D 0;
> +
> +			atomic_add(cdts, &txq->dma_eq_cdt);
> +			cdts =3D 0;
> +		}
> +	}
> +
> +	BUG_ON(work_done > budget);
> +
> +	/* Check to see if the TX queue needs to be re-enabled. */
> +	if (netif_tx_queue_stopped(dev_queue)) {
> +		if (__cxi_cq_free_slots(txq->shared_cq) >=3D 16 &&
> +		    __cxi_cq_free_slots(txq->eth1_cq) >=3D 16 &&
> +		    (!dev->eth2_active || __cxi_cq_free_slots(txq->eth2_cq) >=3D 16) &&
> +		    atomic_read(&txq->dma_eq_cdt) > 0) {
> +			txq->stats.restarted++;
> +			netif_tx_wake_queue(dev_queue);
> +		}
> +	}
> +
> +	if (pkts)
> +		netdev_tx_completed_queue(dev_queue, pkts, bytes);
> +
> +	if (work_done < budget && napi_complete_done(napi, work_done)) {
> +		/* Ack events and re-enable the EQ interrupt. */
> +		cxi_eq_int_enable(txq->eq);
> +	} else if (event_count) {
> +		cxi_eq_int_disable(txq->eq);
> +	}
> +
> +	atomic_add(cdts, &txq->dma_eq_cdt);
> +
> +	return work_done;
> +}

[Severity: High]
Can a TX queue stopped for lack of EQ credits (dma_eq_cdt <=3D 0) remain
permanently stalled here?

Inside the cxi_tx_eth_poll() loop, cdts is only added to txq->dma_eq_cdt wh=
en
event_count reaches 16. For the remaining events (< 16),
atomic_add(cdts, &txq->dma_eq_cdt) happens at the very end of the function,
after the netif_tx_queue_stopped() check has already evaluated
atomic_read(&txq->dma_eq_cdt) > 0 and after napi_complete_done() has
completed NAPI.

Also, in cxi_eth_start_xmit(), netif_tx_stop_queue() is called without a
barrier and without re-checking free CQ slots or dma_eq_cdt afterwards, whi=
ch
can race with cxi_tx_eth_poll() completing the last in-flight packets.

[ ... ]

> +void free_tx_queue(struct tx_queue *tx)
> +{
> +	netif_napi_del(&tx->napi);
> +
> +	tx->untagged_cq =3D NULL;
> +
> +	cxi_cq_free(tx->shared_cq);
> +	tx->shared_cq =3D NULL;
> +
> +	cxi_cq_free(tx->eth1_cq);
> +	tx->eth1_cq =3D NULL;
> +
> +	if (tx->eth2_cq) {
> +		cxi_cq_free(tx->eth2_cq);
> +		tx->eth2_cq =3D NULL;
> +	}
> +
> +	cxi_eq_free(tx->eq);
> +	tx->eq =3D NULL;

[Severity: High]
Does free_tx_queue() leak in-flight DMA skbs and leave BQL state corrupted?

When emit_dma() transmits an skb, its fragments are DMA-mapped, bytes are
queued to BQL via __netdev_tx_sent_queue(), dev->tstamp_skb may be set, and
the skb pointer is passed to hardware in dma_eth.user_ptr.

However, free_tx_queue() frees the CQs and tx->eq without draining pending
C_EVENT_SEND events (to unmap and free in-flight skbs and clear
dev->tstamp_skb) and without calling netdev_tx_reset_queue() to reset BQL.
Additionally, in eth_complete(), when return_code !=3D C_RC_OK, the skb is
freed without adding skb->len to *bytes for netdev_tx_completed_queue(),
leaving those bytes permanently queued in dql.

[ ... ]

> +int alloc_tx_queue(struct cxi_eth *dev, unsigned int id)
> +{

[ ... ]

> +	tx->eq_attr.cpu_affinity =3D tx->cpu;
> +	tx->eq =3D cxi_eq_alloc(dev->lni, tx->eq_md, &tx->eq_attr, tx_eq_cb, tx,
> +			      NULL, NULL);
> +	if (IS_ERR(tx->eq)) {
> +		rc =3D PTR_ERR(tx->eq);
> +		goto err_unmap_eq_buf;
> +	}

[ ... ]

> +	tx->dev =3D dev;
> +	tx->id =3D id;
> +
> +	NETIF_NAPI_ADD_TX(dev->ndev, &tx->napi, cxi_tx_eth_poll);

[Severity: High]
Is it safe to call cxi_eq_alloc() before NETIF_NAPI_ADD_TX()?

In cass_eq.c, cxi_eq_alloc() attaches the EQ's event notifier onto a shared
MSI-X completion IRQ's atomic notifier chain (best_irq->nh). If another EQ
sharing that MSI-X vector triggers an interrupt before NETIF_NAPI_ADD_TX()
initializes tx->napi, cass_irq_int_handler() will invoke tx_eq_cb(tx) ->
napi_schedule(&tx->napi) while tx->napi is still zero-initialized (with
napi.poll =3D=3D NULL).

The same ordering issue appears in alloc_rx_queue() (where cxi_eq_alloc() is
called before NETIF_NAPI_ADD()) and in hw_setup() for dev->err_eq (where
err_eq_cb() reads dev->err_eq before cxi_eq_alloc() has assigned its return
value to dev->err_eq, or while dev->err_eq still holds an ERR_PTR from a
previous failed setup).

[ ... ]

> +static int alloc_rx_buffers(struct rx_queue *rx, unsigned int count,
> +			    enum c_ptl_list ptl_list)
> +{

[ ... ]

> +		if (ptl_list =3D=3D C_PTL_LIST_PRIORITY)
> +			dev->num_prio_buffers++;
> +		else
> +			dev->num_req_buffers++;
> +	}

[Severity: Medium]
alloc_rx_buffers() increments dev->num_prio_buffers and dev->num_req_buffer=
s,
but free_rx_buffers() and hw_cleanup() never decrement or reset them. Won't
these counters grow without bound across interface restarts or channel and
ring changes?

> +
> +	return i;
> +
> +out_requeue:
> +	list_add_tail(&buf->buf_list, &rx->rx_unallocated);
> +
> +	return i;
> +}
> +
> +/* Re-post an RX buffer. The buffer is on the rx_ready list. */
> +static int append_rx_buffer(struct rx_queue *rx, struct rx_buffer *buf,
> +			    gfp_t gfp)
> +{

[ ... ]

> +		cmd.start =3D buf->mapping;
> +		cmd.lac =3D dev->phys_lac;
> +		buf->cur_offset =3D 0;
> +		buf->posted_count =3D 0;
> +		posted_offset =3D 0;
> +
> +		for (i =3D 0; i < rx->page_chunks; i++) {
> +			cmd.start =3D buf->mapping + posted_offset;
> +
> +			rc =3D cxi_cq_emit_target(rx->cq_tgt_prio, &cmd);
> +			if (rc)
> +				goto fail;
> +
> +			get_page(buf->page);
> +			buf->posted_count++;
> +			posted_offset +=3D dev->eth_info.max_segment_size;
> +			rx->stats.append_prio++;
> +		}
> +	} else {

[ ... ]

> +fail:
> +	if (rc) {
> +		netdev_err_once(dev->ndev, "Append failed on list %d: %d\n",
> +				buf->ptl_list, rc);
> +		rx->stats.append_failed++;
> +	} else {
> +		list_del(&buf->buf_list);
> +		list_add_tail(&buf->buf_list, &rx->rx_in_use);
> +	}
> +
> +	return rc;
> +}

[Severity: High]
What happens in append_rx_buffer() when rx->page_chunks > 1 (i.e. PAGE_SIZE=
 >
dev->eth_info.max_segment_size) and cxi_cq_emit_target() fails on chunk i >=
 0?

Chunks 0 .. i - 1 have already been queued in rx->cq_tgt_prio and had
get_page(buf->page) called, but because rc !=3D 0, buf is left on
rx->rx_ready.

On the next post_rx_buffers() call, append_rx_buffer() sees buf->page !=3D =
NULL,
resets buf->cur_offset =3D 0 and buf->posted_count =3D 0 (leaking the i page
references from the partial post), and re-emits chunks 0 .. i - 1 to hardwa=
re
with the same DMA addresses and buffer_id. Should append_rx_buffer() verify
that rx->cq_tgt_prio has enough free slots for all rx->page_chunks before
emitting any commands?

[ ... ]

> +int hw_setup(struct cxi_eth *dev)
> +{
> +	int rc;
> +	int lac;
> +	struct net_device *ndev =3D dev->ndev;
> +	const struct cxi_rsrc_limits limits =3D {
> +		.acs =3D {
> +			.max =3D 1,
> +			.res =3D 1,
> +		},
> +		.eqs =3D {
> +			.max =3D 1 + max_rss_queues + (max_tx_queues * 2),
> +			.res =3D 1,
> +		},
> +		.cts =3D {
> +			.max =3D 0,
> +			.res =3D 0,
> +		},
> +		.ptes =3D {
> +			.max =3D 1 + max_rss_queues,
> +			.res =3D 8,
> +		},
> +		.txqs =3D {
> +			.max =3D max_tx_queues * 2,
> +			.res =3D 1,
> +		},

[Severity: High]
Are limits.ptes and limits.txqs sized properly here?

1. limits.ptes.max is 1 + max_rss_queues while limits.ptes.res is hardcoded
to 8. If max_rss_queues is 1, 2, or 4, limits.ptes.max < limits.ptes.res,
causing validate_descriptor() in cass_svc.c to fail cxi_svc_alloc() with
-EINVAL.

2. limits.txqs.max is max_tx_queues * 2, but when dev->eth2_active is true,
alloc_tx_queue() allocates 3 transmit CQs per TX queue (eth1_cq, shared_cq,
and eth2_cq). Won't cxi_cq_alloc() fail with -ENOSPC once 3 * num_tx_channe=
ls
exceeds 2 * max_tx_queues?

[ ... ]

> +	lac =3D cxi_phys_lac_alloc(dev->lni);
> +	if (lac < 0) {
> +		rc =3D -EINVAL;
> +		netdev_info(ndev, "failed to get a physical LAC: %d\n", rc);
> +		goto err_free_ni;
> +	}
> +	dev->phys_lac =3D lac;
> +
> +	/* Store PCPs for all the Eth Classes */
> +	dev->eth1_pcp =3D cxi_get_tc_req_pcp(dev->cxi_dev, CXI_ETH_TC1);
> +	if (dev->eth1_pcp < 0) {
> +		rc =3D -EINVAL;
> +		goto err_free_ni;
> +	}

[Severity: Medium]
If cxi_get_tc_req_pcp() fails here, jumping to err_free_ni instead of
err_free_lac skips cxi_phys_lac_free(dev->lni, dev->phys_lac) and leaks
dev->phys_lac.

Also, in the error unwind at the bottom of hw_setup(), if
cxi_set_tx_channels() fails, err_set_rx_queues calls
cxi_set_rx_channels(dev, 1), which overwrites dev->ndev->real_num_rx_queues
to 1 instead of preserving the configured RX queue count.

[ ... ]

> +	enable_rx_queue(&dev->rxqs[0]);
> +	enable_rx_queue(&dev->rxqs[PTP_RX_Q]);
> +	enable_tx_queue(&dev->txqs[0]);
> +
> +	dev->res.rss_queues =3D 1;
> +	rc =3D cxi_set_rx_channels(dev, dev->ndev->real_num_rx_queues);

[Severity: Medium]
Because hw_setup() sets dev->res.rss_queues =3D 1 right before calling
cxi_set_rx_channels(), if dev->ndev->real_num_rx_queues is 1,
cxi_set_rx_channels() sees num_rx_channels =3D=3D dev->res.rss_queues and r=
eturns
early without setting dev->res.rss_indir_size =3D 0 or updating
dev->res.ptn_rss[0].

If the interface was previously open with multiple RX queues, closed,
configured to 1 RX queue via ethtool -L while down, and reopened, won't
dev->res.rss_indir_size and dev->res.ptn_rss[] retain stale values that
cxi_eth_set_rx_mode() -> cxi_eth_set_indir_table() then programs into the
hardware indirection table?

[ ... ]

> +void hw_cleanup(struct cxi_eth *dev)
> +{

[ ... ]

> +	cxi_phys_lac_free(dev->lni, dev->phys_lac);
> +	dev->phys_lac =3D 0;
> +	cxi_lni_free(dev->lni);
> +	dev->lni =3D NULL;
> +	cxi_svc_destroy(dev->cxi_dev, dev->svc_id);
> +}

[Severity: High]
Does calling cxi_svc_destroy() immediately after cxi_lni_free() leak
dev->svc_id when LNI cleanup is deferred?

In cass_lni.c, if try_cleanup_lni() finds that any CQ or PTE has not finish=
ed
hardware drain, cxi_lni_free() queues lni_priv onto hw->lni_cleanups_list f=
or
delayed work without decrementing the service rgroup refcount yet. The
immediate call to cxi_svc_destroy() in hw_cleanup() (and in hw_setup()'s
error path) then sees cxi_rgroup_refcount() > 1 and returns -EBUSY, leaving
the service and its resource reservations permanently leaked.

> +
> +static struct sk_buff *eth_rx_copy(struct rx_queue *rx,
> +				   struct rx_buffer *buf,
> +				   const struct c_event_target_enet *event)
> +{

[ ... ]

> +static struct sk_buff *eth_rx_frags(struct rx_queue *rx,
> +				    struct rx_buffer *buf,
> +				    const struct c_event_target_enet *event)
> +{
> +	struct cxi_eth *eth_dev =3D rx->dev;
> +	struct device *dev =3D &eth_dev->cxi_dev->pdev->dev;
> +	struct sk_buff *skb;
> +	struct page *page;
> +	int frag_len;
> +
> +	if (unlikely(!buf->page || !buf->posted_count ||
> +		     buf->cur_offset >=3D PAGE_SIZE ||
> +		     event->length > PAGE_SIZE - buf->cur_offset ||
> +		     event->length > eth_dev->eth_info.max_segment_size))
> +		return NULL;
> +
> +	skb =3D napi_get_frags(&rx->napi);
> +	if (unlikely(!skb))
> +		return NULL;
> +
> +	/* The SKB may already be full, due to the adapter
> +	 * being configured to fragment too much.
> +	 */
> +	if (unlikely(skb_shinfo(skb)->nr_frags =3D=3D MAX_SKB_FRAGS))
> +		return NULL;
> +
> +	page =3D buf->page;
> +	frag_len =3D event->length;
> +
> +	if (rx->frag_state =3D=3D FRAG_NONE)
> +		prefetch(page_address(page));
> +
> +	skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
> +			page, buf->cur_offset, frag_len,
> +			eth_dev->eth_info.max_segment_size);
> +	dma_sync_single_for_cpu(dev, buf->mapping + buf->cur_offset, frag_len,
> +				DMA_FROM_DEVICE);
> +
> +	buf->cur_offset +=3D eth_dev->eth_info.max_segment_size;
> +	buf->posted_count--;
> +
> +	if (buf->posted_count =3D=3D 0) {
> +		dma_unmap_page(dev, dma_unmap_addr(buf, mapping), PAGE_SIZE,
> +			       DMA_FROM_DEVICE);
> +		put_page(page);
> +		buf->page =3D NULL;
> +	}
> +
> +	return skb;
> +}

[ ... ]

> +static bool eth_receive(struct rx_queue *rx,
> +			const struct c_event_target_enet *event)
> +{
> +	struct cxi_eth *dev =3D rx->dev;
> +	struct net_device *ndev =3D dev->ndev;
> +	struct sk_buff *skb =3D NULL;
> +	struct rx_buffer *buf;
> +	bool packet_complete =3D false;
> +
> +	/* Find the target buffer */
> +	if (event->ptlte_index !=3D rx->pt->id) {
> +		netdev_err(ndev, "Unknown portal target in RX event (%d instead of %d)=
\n",
> +			   event->ptlte_index, rx->pt->id);
> +		return packet_complete;
> +	}
> +
> +	buf =3D &rx->rx_bufs[event->buffer_id];
> +
> +	if (unlikely(event->return_code !=3D C_RC_OK ||
> +		     (event->is_roce && !event->more_frags &&
> +		      !event->roce_icrc_ok) ||
> +		     event->parser_err ||
> +		     rx->frag_state =3D=3D FRAG_DROP)) {
> +		goto drop;
> +	}
> +
> +	if (event->ptl_list =3D=3D C_PTL_LIST_PRIORITY)
> +		skb =3D eth_rx_frags(rx, buf, event);
> +	else
> +		skb =3D eth_rx_copy(rx, buf, event);
> +
> +	if (unlikely(!skb))
> +		goto drop;
> +
> +	if (dev->is_c2) {
> +		if (event->seg_cnt =3D=3D 0) {
> +			/* It's a new packet */
> +			rx->pkt_cnt =3D event->pkt_cnt;
> +			rx->next_seg_cnt =3D 1;
> +
> +			/* Free existing incomplete segments if any */
> +			if (rx->frag_state !=3D FRAG_NONE) {
> +				ndev->stats.rx_dropped++;
> +				rx->frag_state =3D FRAG_NONE;
> +				napi_free_frags(&rx->napi);
> +			}
> +		} else if (event->pkt_cnt !=3D rx->pkt_cnt ||
> +			   event->seg_cnt !=3D rx->next_seg_cnt) {
> +			goto drop;
> +		} else {
> +			rx->next_seg_cnt++;
> +		}
> +	}

[Severity: Critical]
In eth_receive(), does the dev->is_c2 segment check run too late and cause a
use-after-free and NULL pointer dereference?

When a previous multi-segment packet was incomplete (leaving rx->frag_state=
 =3D=3D
FRAG_MORE and rx->napi.skb non-NULL) and the first segment of a new packet
arrives with event->seg_cnt =3D=3D 0, eth_rx_frags() or eth_rx_copy() is ca=
lled
before the dev->is_c2 check. Both functions see rx->frag_state !=3D FRAG_NO=
NE,
append the new packet's first segment onto rx->napi.skb via
napi_get_frags(&rx->napi), and return skb =3D rx->napi.skb.

Immediately afterwards, the dev->is_c2 block sees event->seg_cnt =3D=3D 0 a=
nd
rx->frag_state !=3D FRAG_NONE, and calls napi_free_frags(&rx->napi), freeing
the exact skb held in local variable skb and setting rx->napi.skb =3D NULL.
When event->more_frags =3D=3D 0, execution continues below, writing to the =
freed
skb and calling napi_gro_frags(&rx->napi) (which dereferences rx->napi.skb =
=3D=3D
NULL) or napi_gro_receive(&rx->napi, skb) on the freed skb. Also, if
rx->frag_state =3D=3D FRAG_DROP when a new packet starts with event->seg_cn=
t =3D=3D 0,
the earlier check jumps to drop before the dev->is_c2 block can reset
rx->frag_state.

> +
> +	if (event->more_frags =3D=3D 0) {
> +		__be16 csum;
> +
> +		ndev->stats.rx_packets++;
> +		ndev->stats.rx_bytes +=3D skb->len;
> +
> +		csum =3D (__force __be16)event->checksum;
> +		skb->csum =3D (__force __wsum)be16_to_cpu(csum);
> +		skb->ip_summed =3D CHECKSUM_COMPLETE;

[Severity: Medium]
Should setting skb->csum and skb->ip_summed =3D CHECKSUM_COMPLETE be gated =
on
(ndev->features & NETIF_F_RXCSUM), similar to how NETIF_F_RXHASH is checked
below?

> +
> +		/* Cassini ERRATA-3258. This should test event->timestamp, but
> +		 * Cassini 1/1.1 doesn't set it.
> +		 */
> +		if (dev->ptp_ts_enabled &&
> +		    event->ptlte_index =3D=3D dev->res.ptn_ptp) {
> +			struct c_ts ts;
> +			int rc;
> +
> +			rc =3D skb_copy_bits(skb, skb->len - sizeof(ts),
> +					   &ts, sizeof(ts));
> +			if (rc)
> +				goto drop;
> +
> +			/* Cassini ERRATA-3276. Ignore the timestamp on Cassini 1
> +			 * if ns is close to 1s, as RX timestamp can
> +			 * be off by one second in that case. No issue
> +			 * on Cassini 2.
> +			 */
> +			if (dev->is_c2 || ts.ns < 999999700)
> +				skb_hwtstamps(skb)->hwtstamp =3D
> +					ktime_set(ts.sec, ts.ns);
> +
> +			pskb_trim(skb, skb->len - sizeof(ts));
> +		}

[ ... ]

> +		if (skb_is_nonlinear(skb)) {
> +			napi_gro_frags(&rx->napi);
> +
> +			rx->frag_state =3D FRAG_NONE;
> +		} else {
> +			napi_gro_receive(&rx->napi, skb);
> +		}
> +
> +		packet_complete =3D true;
> +	} else {
> +		rx->frag_state =3D FRAG_MORE;
> +	}
> +
> +requeue:
> +	if (event->ptl_list =3D=3D C_PTL_LIST_PRIORITY) {
> +		rx->stats.unlinked_prio++;
> +
> +		if (buf->page =3D=3D NULL) {
> +			list_del(&buf->buf_list);
> +			list_add_tail(&buf->buf_list, &rx->rx_ready);
> +		}
> +	} else if (event->auto_unlinked) {
> +		rx->stats.unlinked_req++;
> +		list_del(&buf->buf_list);
> +		list_add_tail(&buf->buf_list, &rx->rx_ready);
> +	}
> +
> +	return packet_complete;
> +
> +drop:
> +	/* Error on receive, NIC dropped this frag, or driver dropped a previous
> +	 * frag, or skb allocation failure
> +	 */
> +	netdev_dbg(dev->ndev,
> +		   "received return_code=3D%d more=3D%d state=3D%d ptl_list=3D%d roce=
=3D%d\n",
> +		   event->return_code, event->more_frags, rx->frag_state,
> +		   event->ptl_list, event->is_roce);
> +
> +	if (event->return_code !=3D C_RC_OK)
> +		rx->last_bad_frag_drop_rc =3D event->return_code;
> +
> +	/* Not always a whole packet, so in theory a single packet
> +	 * could be counted several times, one for each segment.
> +	 */
> +	ndev->stats.rx_dropped++;
> +
> +	if (rx->frag_state !=3D FRAG_DROP)
> +		napi_free_frags(&rx->napi);

[Severity: High]
Does the drop path in eth_receive() leak standalone skbs and leave rx->napi=
.skb
dangling after pskb_trim()?

1. When eth_rx_copy() receives a single-fragment packet (rx->frag_state =3D=
=3D
FRAG_NONE && !event->more_frags), it allocates a standalone skb via
napi_alloc_skb(), which is not stored in rx->napi.skb. If eth_receive() then
jumps to drop (either from the dev->is_c2 check when event->seg_cnt !=3D 0 =
or
when skb_copy_bits() fails on a short frame on the PTP queue), drop only ca=
lls
napi_free_frags(&rx->napi) and leaks skb.

2. If a multi-segment packet on the PTP queue has its first segment copied =
into
linear skb->data in eth_rx_copy() and <=3D sizeof(struct c_ts) bytes in
frags[0], pskb_trim(skb, skb->len - sizeof(ts)) reduces skb->data_len to 0 =
so
skb_is_nonlinear(skb) becomes false. Then eth_receive() calls
napi_gro_receive(&rx->napi, skb) instead of napi_gro_frags(&rx->napi),
consuming skb while leaving a dangling pointer in rx->napi.skb and leaving
rx->frag_state as FRAG_MORE.

[Severity: High]
Does dropping an event on C_PTL_LIST_PRIORITY leak the priority RX buffer?

Each C_EVENT_ETHERNET on C_PTL_LIST_PRIORITY consumes one use_once LE posted
by append_rx_buffer(). However, advancing buf->cur_offset, decrementing
buf->posted_count, and unmapping/putting buf->page when posted_count reache=
s 0
only happen at the end of eth_rx_frags().

If eth_receive() jumps to drop before calling eth_rx_frags() (e.g., on
return_code !=3D C_RC_OK, !roce_icrc_ok, parser_err, or rx->frag_state =3D=
=3D
FRAG_DROP), or if eth_rx_frags() returns NULL early (when napi_get_frags()
fails or nr_frags =3D=3D MAX_SKB_FRAGS), buf->posted_count is never decreme=
nted
and buf->cur_offset is not advanced. At requeue, buf->page remains non-NULL,
so buf is never moved back to rx->rx_ready and is leaked on rx->rx_in_use.

> +
> +	if (event->more_frags)
> +		rx->frag_state =3D FRAG_DROP;
> +	else
> +		rx->frag_state =3D FRAG_NONE;
> +
> +	goto requeue;
> +}

[ ... ]

> +int cxi_eth_open(struct net_device *ndev)
> +{
> +	struct cxi_eth *dev =3D netdev_priv(ndev);
> +	struct hwtstamp_config ts_cfg =3D {
> +		.flags =3D 0,
> +		.tx_type =3D HWTSTAMP_TX_OFF,
> +		.rx_filter =3D HWTSTAMP_FILTER_NONE,
> +	};

[ ... ]

> +	cxi_eth_cfg_timestamp(dev->cxi_dev, &ts_cfg);
> +
> +	return hw_setup(dev);
> +}

[Severity: High]
If hardware timestamping was enabled via cxi_eth_hwtstamp_set() before
cxi_eth_open() (or prior to a close/open cycle), cxi_eth_open() disables
timestamping in hardware via cxi_eth_cfg_timestamp(dev->cxi_dev, &ts_cfg)
without updating dev->tstamp_config or clearing dev->ptp_ts_enabled.

When PTP L2 packets subsequently arrive on dev->res.ptn_ptp, hardware will =
not
append the 10-byte struct c_ts timestamp, but eth_receive() will still see
dev->ptp_ts_enabled =3D=3D true and strip the last 10 bytes of the PTP pack=
et
payload via pskb_trim().

Also, in tstamp_xmit(), should the driver check that
dev->tstamp_config.tx_type =3D=3D HWTSTAMP_TX_ON before arming SKBTX_IN_PRO=
GRESS
and reserving dev->tstamp_skb?

[ ... ]

> +static void cxi_eth_get_skb_checksum_settings(struct sk_buff *skb,
> +					      struct cxi_eth *dev,
> +					      enum c_checksum_ctrl *ctrl,
> +					      unsigned int *start,
> +					      unsigned int *offset)
> +{
> +	__be16 proto;
> +
> +	if (skb->ip_summed !=3D CHECKSUM_PARTIAL)
> +		goto no_crc;
> +
> +	*start =3D skb_checksum_start_offset(skb) / 2;
> +	*offset =3D skb->csum_offset / 2;
> +
> +	if (eth_type_vlan(skb->protocol))
> +		proto =3D vlan_get_protocol(skb);
> +	else
> +		proto =3D skb->protocol;
> +
> +	if (proto =3D=3D htons(ETH_P_IP)) {
> +		struct iphdr *iph =3D ip_hdr(skb);
> +
> +		if (iph->protocol =3D=3D IPPROTO_UDP) {
> +			if ((dev->priv_flags & CXI_ETH_PF_ROCE_OPT) &&
> +			    ntohs(udp_hdr(skb)->dest) =3D=3D ROCE_V2_UDP_DPORT)
> +				*ctrl =3D C_CHECKSUM_CTRL_ROCE;
> +			else
> +				*ctrl =3D C_CHECKSUM_CTRL_UDP;
> +		} else if (iph->protocol =3D=3D IPPROTO_TCP) {
> +			*ctrl =3D C_CHECKSUM_CTRL_TCP;
> +		}
> +	} else if (proto =3D=3D htons(ETH_P_IPV6)) {
> +		struct ipv6hdr *iph =3D ipv6_hdr(skb);
> +
> +		if (iph->nexthdr =3D=3D IPPROTO_UDP) {
> +			if ((dev->priv_flags & CXI_ETH_PF_ROCE_OPT) &&
> +			    ntohs(udp_hdr(skb)->dest) =3D=3D ROCE_V2_UDP_DPORT)
> +				*ctrl =3D C_CHECKSUM_CTRL_ROCE;
> +			else
> +				*ctrl =3D C_CHECKSUM_CTRL_UDP;
> +		} else if (iph->nexthdr =3D=3D IPPROTO_TCP) {
> +			*ctrl =3D C_CHECKSUM_CTRL_TCP;
> +		}
> +	} else {
> +		netdev_warn_once(dev->ndev,
> +				 "Checksum type not supported. Protocol=3D%u\n",
> +				 skb->protocol);
> +		goto no_crc;
> +	}
> +
> +	return;
> +
> +no_crc:
> +	*ctrl =3D C_CHECKSUM_CTRL_NONE;
> +	*start =3D 0;
> +	*offset =3D 0;
> +}

[Severity: High]
When skb->ip_summed =3D=3D CHECKSUM_PARTIAL and the packet is IPv4 or IPv6,=
 what
happens if iph->protocol or iph->nexthdr is neither IPPROTO_UDP nor
IPPROTO_TCP (for example, IPPROTO_ICMPV6 Neighbor Discovery or ping6, which
the stack sends with CHECKSUM_PARTIAL because ndev->hw_features advertises
NETIF_F_HW_CSUM)?

Neither the UDP nor TCP branch is taken, so cxi_eth_get_skb_checksum_settin=
gs()
returns without initializing *ctrl. Both emit_idc() and emit_dma() pass an
uninitialized stack variable checksum_ctrl and write it into
idc_eth.checksum_ctrl / dma_eth.checksum_ctrl, and the packet's L4 checksum=
 is
never computed in software via skb_checksum_help().

[ ... ]

> +int cxi_eth_mac_addr(struct net_device *ndev, void *p)
> +{
> +	struct cxi_eth *dev =3D netdev_priv(ndev);
> +	int rc;
> +
> +	rc =3D eth_mac_addr(ndev, p);
> +	if (rc)
> +		return rc;
> +
> +	dev->mac_addr =3D ether_addr_to_u64(ndev->dev_addr);
> +	ether_addr_copy(dev->cxi_dev->mac_addr, ndev->dev_addr);
> +
> +	cxi_eth_set_rx_mode(ndev);

[Severity: High]
Should cxi_eth_mac_addr() only call cxi_eth_set_rx_mode(ndev) when
dev->is_active is true?

When the interface is down (!dev->is_active), RX queues and portals have not
been allocated (or have already been freed by hw_cleanup()), so calling
cxi_eth_set_rx_mode() programs live hardware RMU set_list filters with 0 or
freed portal IDs and leaks hw->set_list_table IDA entries if the device is
removed without being opened.

> +
> +	/* We expect the NID to be configured before the MAC address is set.
> +	 * To be backwards compatible, we will attempt to set the NID from the =
MAC address.
> +	 * If the NID was not set, it will be derived from the MAC. Otherwise t=
his will be ignored
> +	 */
> +	cxi_set_nid_from_mac(dev->cxi_dev, ndev->dev_addr);
> +
> +	return 0;
> +}
> +
> +/* Program MAC filters.
> + *
> + * Since the ethernet driver is the only thing using the MAC filter
> + * (set_list), we can reset the whole list when entering this
> + * function, and reprogram everything.
> + */
> +void cxi_eth_set_rx_mode(struct net_device *ndev)
> +{
> +	struct cxi_eth *dev =3D netdev_priv(ndev);
> +	struct netdev_hw_addr *ha;
> +	int rc;
> +
> +	/* Invalidate all existing filters. */
> +	cxi_eth_set_list_invalidate_all(dev->cxi_dev, &dev->res);
> +
> +	/* Cassini ERRATA-3258. Workaround timestamp bug. Program the PTP MAC
> +	 * address first so all the PTP packets will land on the PTP
> +	 * RX queue, even if promiscuous mode is enabled.
> +	 */
> +	cxi_eth_add_mac(dev->cxi_dev, &dev->res, dev->ptp_mac_addr, true);

[Severity: High]
Can cxi_eth_set_rx_mode() sleep in atomic context when called via
.ndo_set_rx_mode?

The networking core calls .ndo_set_rx_mode while holding
netif_addr_lock_bh(ndev) (a bottom-half spinlock). cxi_eth_set_rx_mode() ca=
lls
cxi_eth_add_mac(), cxi_eth_set_promiscuous(), and cxi_eth_set_all_multi(), =
all
of which call cxi_eth_set_list() -> ida_alloc_max(..., GFP_KERNEL).

Conversely, when hw_setup() and cxi_eth_mac_addr() call
cxi_eth_set_rx_mode(ndev) directly, they do not hold netif_addr_lock_bh(nde=
v)
while iterating ndev->uc and ndev->mc and mutating dev->res.

> diff --git a/drivers/net/ethernet/hpe/ss1/cxi_ethtool.c b/drivers/net/eth=
ernet/hpe/ss1/cxi_ethtool.c
> new file mode 100644
> index 0000000000000..67d8a0d23b903
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/ss1/cxi_ethtool.c
> @@ -0,0 +1,916 @@

[ ... ]

> +static void cxi_get_strings(struct net_device *ndev, u32 stringset, u8 *=
data)
> +{
> +	char *p =3D data;
> +	struct cxi_eth *dev =3D netdev_priv(ndev);
> +	char *dst;
> +
> +	switch (stringset) {
> +	case ETH_SS_PRIV_FLAGS:
> +		memcpy(p, priv_flags_str, PRIV_FLAGS_COUNT * ETH_GSTRING_LEN);
> +		if (cassini_version(&dev->cxi_dev->prop, CASSINI_1)) {
> +			dst =3D p + 7 * ETH_GSTRING_LEN;
> +			memset(dst, 0, ETH_GSTRING_LEN);
> +			strscpy(dst, "disable-pml-recovery", ETH_GSTRING_LEN);
> +		}
> +		break;
> +	case ETH_SS_STATS:
> +		memcpy(p, cxi_get_ethtool_stats_name, CXI_GLOBAL_STATS_LEN *
> +		       ETH_GSTRING_LEN);
> +		break;
> +
> +	}
> +}

[ ... ]

> +static int cxi_set_channels(struct net_device *ndev,
> +			    struct ethtool_channels *ch)
> +{
> +	struct cxi_eth *dev =3D netdev_priv(ndev);
> +	unsigned int old_tx_channels =3D dev->cur_txqs;
> +	int rc;
> +
> +	if (ch->combined_count || ch->other_count)
> +		return -EINVAL;
> +	if (!valid_rx_channel_count(ch->rx_count) || !ch->tx_count ||
> +	    ch->tx_count > ndev->num_tx_queues)
> +		return -EINVAL;
> +
> +	/* If interface is not running, update the real TX/RX queue count. The
> +	 * real TX/RX queue count is used to initialize TX/RX channels during
> +	 * hardware setup.
> +	 */
> +	if (!netif_running(dev->ndev)) {
> +		return netif_set_real_num_queues(ndev, ch->tx_count, ch->rx_count);
> +	}

[Severity: High]
What happens in cxi_set_channels() if a prior cxi_change_mtu() or
cxi_set_ringparam() failed inside hw_setup(dev)?

In that state, netif_running(dev->ndev) is still true, but hw_cleanup(dev) =
has
set dev->is_active =3D false and freed dev->lni, dev->eth1_cp, and all queu=
es.
Checking !netif_running(dev->ndev) instead of !dev->is_active allows
cxi_set_channels() to call cxi_set_tx_channels() and cxi_set_rx_channels(),
dereferencing NULL pointers.

[ ... ]

> +static int cxi_get_module_eeprom(struct net_device *ndev,
> +				 struct ethtool_eeprom *eeprom, u8 *data)
> +{
> +	struct cxi_eth *dev =3D netdev_priv(ndev);
> +	int ret;
> +
> +	ret =3D cxi_get_qsfp_data(dev->cxi_dev, eeprom->offset, eeprom->len,
> +				0, data);
> +
> +	if (ret > 0)
> +		return 0;
> +	else
> +		return -EINVAL;
> +}

[Severity: Medium]
For SFF-8636 transceivers, cxi_get_module_info() sets modinfo->eeprom_len to
ETH_MODULE_SFF_8636_LEN (640).

In cxi_get_module_eeprom(), eeprom->offset (0..639) is passed directly to
cxi_get_qsfp_data() with page hardcoded to 0, where offset is stored into t=
he
u8 field req_data->addr. Won't offsets >=3D 256 truncate to 8 bits and read=
 page
0 instead of translating linear offsets 256..639 to pages 1..3?

[ ... ]

> +static int cxi_set_priv_flags(struct net_device *ndev, u32 flags)
> +{

[ ... ]

> +	link_info.flags =3D flags;
> +	cxi_link_mode_set(dev->cxi_dev, &link_info);
> +
> +	if (changes & CXI_ETH_PF_FEC_MONITOR) {

[ ... ]

> +static u32 cxi_get_priv_flags(struct net_device *ndev)
> +{
> +	struct cxi_eth *dev =3D netdev_priv(ndev);
> +	struct cxi_link_info link_info;
> +	u32 debug_flags;
> +
> +	cxi_link_mode_get(dev->cxi_dev, &link_info);
> +	cxi_link_flags_get(dev->cxi_dev, &debug_flags);
> +
> +	return dev->priv_flags | link_info.flags | debug_flags;
> +}

[Severity: Medium]
In cxi_set_priv_flags(), cxi_link_mode_set() is called before the remaining
flag changes (such as CXI_ETH_PF_PML_REC, CXI_ETH_PF_ALD, and cable/media
flags) are applied to the device.

Also, on Cassini 2, cass_sl_config_init() enables pml-recovery and
auto-lane-degrade by default, but neither CXI_ETH_PF_PML_REC nor
CXI_ETH_PF_ALD is set in dev->priv_flags or returned by cxi_link_mode_get(),
so cxi_get_priv_flags() reports them as off.

> +
> +static void cxi_get_ethtool_stats(struct net_device *ndev,
> +				  struct ethtool_stats *stats, u64 *data)
> +{
> +	struct cxi_eth *dev =3D netdev_priv(ndev);
> +	struct cxi_dev *cdev =3D dev->cxi_dev;
> +	int retval;
> +	int i;
> +
> +	retval =3D cxi_telem_get_selected(cdev, cxi_get_ethtool_stats_set, data,
> +					CXI_GLOBAL_STATS_LEN);
> +	if (retval !=3D 0)
> +		for (i =3D 0 ; i < CXI_GLOBAL_STATS_LEN ; ++i)
> +			data[i] =3D 0;
> +}

[Severity: Medium]
cxi_get_ethtool_stats() and cxi_get_ethtool_stats_name expose standard IEEE
802.3 MAC and FEC codeword counters in ethtool -S, including rx_ok_ieee,
rx_bad_ieee, tx_ok_ieee, corrected_cw, and uncorrected_cw.

Per netdev statistics policy (Documentation/networking/statistics.rst),
shouldn't standard MAC and FEC statistics be reported through the dedicated
standard ethtool_ops callbacks (such as get_eth_mac_stats and get_fec_stats)
rather than duplicating them in ethtool -S?

[ ... ]

> +static int cxi_set_ringparam(struct net_device *ndev,
> +			     struct ethtool_ringparam *ring,
> +			     struct kernel_ethtool_ringparam *kernel_ring,
> +			     struct netlink_ext_ack *extack)
> +{
> +	struct cxi_eth *dev =3D netdev_priv(ndev);
> +	int rc =3D 0;
> +
> +	if (ring->rx_jumbo_pending)
> +		return -EINVAL;
> +
> +	dev->ringparam.rx_pending =3D clamp(ring->rx_pending,
> +					  LARGE_PKTS_BUF_COUNT_MIN,
> +					  LARGE_PKTS_BUF_COUNT_MAX);
> +
> +	dev->ringparam.rx_mini_pending =3D num_small_packets(
> +		clamp(round_up(ring->rx_mini_pending, 4096) /
> +		      (small_pkts_buf_size / buffer_threshold),
> +		      SMALL_PKTS_BUF_COUNT_MIN, SMALL_PKTS_BUF_COUNT_MAX));
> +
> +	dev->ringparam.tx_pending =3D clamp_t(unsigned int, ring->tx_pending,
> +					    1, CXI_MAX_CQ_COUNT);

[Severity: High]
Can cxi_set_ringparam() divide by zero here when small_pkts_buf_size <
buffer_threshold?

In init(), small_pkts_buf_size can be as small as PAGE_SIZE (4096) while
buffer_threshold can be up to 16383. When small_pkts_buf_size <
buffer_threshold, (small_pkts_buf_size / buffer_threshold) evaluates to 0 in
both cxi_set_ringparam() and num_small_packets().

In addition, while cxi_set_ringparam() updates dev->ringparam.rx_mini_pendi=
ng
and dev->ringparam.tx_pending, alloc_rx_queue() always uses
small_pkts_buf_count and alloc_tx_queue() always uses
min_t(unsigned int, CXI_MAX_CQ_COUNT, 2 * dev->ndev->tx_queue_len) (which a=
lso
sets force_dma_interval =3D 0 and CQ size < 16 if tx_queue_len < 8).

> diff --git a/drivers/net/ethernet/hpe/ss1/cxi_rxtx_profile.c b/drivers/ne=
t/ethernet/hpe/ss1/cxi_rxtx_profile.c
> new file mode 100644
> index 0000000000000..f5c978efd183d
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/ss1/cxi_rxtx_profile.c
> @@ -0,0 +1,418 @@

[ ... ]

> +/* Make sure the VNI space is unique */
> +bool unique_vni_space(struct cass_dev *hw,
> +		      struct cxi_rxtx_profile_list *list,
> +		      const struct cxi_rxtx_vni_attr *attr)
> +{
> +	int rc;
> +	struct cxi_rxtx_profile rxtx_prof =3D {
> +		.vni_attr.match =3D attr->match,
> +		.vni_attr.ignore =3D attr->ignore,
> +	};
> +
> +	cxi_rxtx_profile_list_lock(list);
> +
> +	rc =3D cxi_rxtx_profile_list_iterate(list,
> +					   vni_overlap_test,
> +					   &rxtx_prof);
> +
> +	cxi_rxtx_profile_list_unlock(list);
> +
> +	return !rc;
> +}

[Severity: High]
When updating attributes on an existing RX or TX profile in the list (via
cxi_dev_set_rx_profile_attr() or cxi_dev_set_tx_profile_attr()), won't
unique_vni_space() compare the profile against its own entry in list?

Once a profile has a non-zero match value set, any subsequent update to
attr/ignore or attr/match will visit that same profile in vni_overlap_test(=
),
collide with itself, and fail with -EINVAL.

[Severity: Medium]
Also, because unique_vni_space() releases cxi_rxtx_profile_list_lock(list)
before cxi_dev_set_rx_profile_attr() / cxi_dev_set_tx_profile_attr() writes
the updated match and ignore values (and because cxi_rxtx_profile_list_inse=
rt()
passes GFP_KERNEL to __xa_alloc(), which can drop xa_lock to allocate a node
after the caller's overlap check), can two concurrent callers race and conf=
igure
overlapping VNI spaces?

> +
> +static int valid_vni_operator(struct cxi_rxtx_profile *rxtx_profile,
> +			      void *user_data)
> +{
> +	int rc;
> +	bool valid =3D false;
> +	unsigned int ac_entry_id;
> +	struct cxi_rxtx_vni_attr vni_attr;
> +	struct cxi_rxtx_profile_state state;
> +	struct valid_user_data *data =3D user_data;
> +	struct cxi_rxtx_vni_attr user_vni =3D {
> +		.match =3D data->vni,
> +	};

[ ... ]

> +bool cxi_valid_vni(struct cxi_dev *dev, enum cxi_profile_type type,
> +		   unsigned int vni)
> +{
> +	struct cxi_rxtx_profile_list *list;
> +	bool valid;
> +	struct cass_dev *hw =3D container_of(dev, struct cass_dev, cdev);
> +	struct valid_user_data user_data =3D {
> +		.vni =3D vni,
> +		.ac_data =3D {
> +			.uid =3D __kuid_val(current_euid()),
> +			.gid =3D __kgid_val(current_egid()),
> +			.netns =3D CURRENT_NETNS_ID(),
> +		},
> +	};

[Severity: Medium]
Should cxi_valid_vni() check is_vni_valid(vni) before searching the profile
list?

Currently, user_vni.match in valid_vni_operator() is a uint16_t, so an
out-of-range unsigned int vni (such as 0x10001 passed via cxi_cp_modify()) =
is
silently truncated to 16 bits and can match an enabled profile.

> diff --git a/drivers/net/ethernet/hpe/ss1/cxi_rxtx_profile_list.c b/drive=
rs/net/ethernet/hpe/ss1/cxi_rxtx_profile_list.c
> new file mode 100644
> index 0000000000000..605f08abe53c2
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/ss1/cxi_rxtx_profile_list.c
> @@ -0,0 +1,249 @@

[ ... ]

> +void cxi_rxtx_profile_list_destroy(struct cxi_rxtx_profile_list *list,
> +				   void (*cleanup)(struct cxi_rxtx_profile *profile,
> +						   void *user_arg),
> +				   void *user_arg)
> +{
> +	unsigned long              index;
> +	struct cxi_rxtx_profile    *profile;
> +
> +	index =3D list->limits->min;
> +
> +	xa_lock(&list->xarray);
> +
> +	xa_for_each(&list->xarray, index, profile) {
> +		__xa_erase(&list->xarray, index);
> +		if (cleanup)
> +			cleanup(profile, user_arg);
> +	}
> +
> +	xa_unlock(&list->xarray);
> +	xa_destroy(&list->xarray);
> +}

[Severity: High]
Does holding xa_lock(&list->xarray) across cleanup(profile, user_arg) cause=
 a
spinlock self-deadlock (or refcount underflow and profile leak) when called
from cass_dev_rx_tx_profiles_fini()?

In cass_rx_tx_profile.c, cass_dev_rx_tx_profiles_fini() passes
rx_profile_destroy() as the cleanup callback:

  cxi_rxtx_profile_list_destroy() [holds list->xarray.xa_lock]
    -> rx_profile_destroy()
      -> refcount_dec(&rxtx_profile->state.refcount)
      -> cxi_rx_profile_dec_refcount()
        -> cxi_rxtx_profile_list_remove()
          -> xa_erase(&list->xarray, rxtx_profile_id)

When refcount_dec_and_test() in cxi_rx_profile_dec_refcount() reaches 0,
xa_erase() tries to acquire list->xarray.xa_lock while it is already held on
the same CPU. And if rxtx_profile->state.refcount was 1 on entry to
rx_profile_destroy(), the extra refcount_dec() drops it to 0 before
cxi_rx_profile_dec_refcount() calls refcount_dec_and_test(), underflowing t=
he
refcount and returning -EBUSY without freeing the profile.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-cxi-netdev=
-submission-v1-0-8c2c391cc283@hpe.com?part=3D22
