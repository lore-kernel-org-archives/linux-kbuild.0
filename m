Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480542;
	b=a7/p8mhfxwlDDeogUG9Bc7P54pHoz2rFhir2RYdC2skvqfpnUBTEU+7T5UQRY4TgBUCB
	 8GtA9wd3JWXBEeVQYavqtlETCzr20fsXTLyybhpHR1Ps+CPpNGxUqy7YFadHwvAd9aBcX
	 rEgAaE/pnz2AwUg8NX9rFp0dhMrZ5VjNE/u1X6y+//jhfuhf4UyAAwp5VL5FuEw1wI34l
	 aqbjaqWRrPr+WcE7wzfrULUVaN5ZJeVhEB+BRBGHn+yHs81yizEZ3sBI9KWtqfh6yDNpo
	 WBZ+cQCrErQenFwrdoX77GosIB6he3e8TC4jztu68tqavPyucspC8U3DMsj/7eMddMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480542;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Th9K0YYQpF48PblvGzy/NTp2ubP6ZgsmSIBs2+pDy9Q=;
	b=gZu14pRSPKTwIN3oLTQAukNUD82cZcfveTxrMHV1Ofi5brwbX2dhsLmBVDfRCMquM7pT
	 nhim36+brW3p3JXktOVDkg0PGiMN07HfHB8AyZpjGnsJtL1atzNHXrD5/nfFqsL7jE87q
	 gNK7lkLjpPXakZS+FfCJtD/Ri8LqlP3lh9/+lhfb7y/l+GgRaRrK5mN6ZNklrrxduT6Fi
	 MEzx/Qn0G1CvSwiYO2on9sIABTfG+su4VsO/xCptMNtaMGmlyhUZHAhN3z37FSgBTokq6
	 ypLEStT0sP1375ZhjoSl4l2B67t9JmVTKuAdV54As/iciYVWUSRIQi021LLd+K0X6iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HfW+cvzj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFF7606A320
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 21:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HfW+cvzj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D34D1F000C1;
	Sat, 31 Oct 2026 21:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793480542;
	bh=Th9K0YYQpF48PblvGzy/NTp2ubP6ZgsmSIBs2+pDy9Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HfW+cvzj6LrBv0jJ1P9tpOmL3kCm22waJ52hA6Z5AtlXQWywOzl+t1Mm6IWAbb9Ks
	 3h2Y5RkK93Ft83vZ+jHqCBynlFoPaQs4JH4V+HkQVRrj+8C6cj84voh9Tyt5DyOa2K
	 HLUXoZLoGMJQkeN5h4egWQDnn336D2MFQCkLJj9mOWWe9Cj6k7uhCDMDptV1x+sfMH
	 cYAsA8DE+e70DLx0NehsCSjX1ydWAi0Ew+ZlEY79I8YpqcuuepZwUrDRR0Lp6MnYi/
	 HTZHx50bPZPy2NInSqFnpeyJAnlXccbQEh2XRUzGlutldZ3nVoZ5/ChpxDuwoa/Iku
	 JU9l5VTo59Qkw==
Message-ID: <sashiko-outbox-192149@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 23/23] net: hpe: wire up the Slingshot NIC drivers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Doug Ledford" <doug.ledford@hpe.com>, "Slingshot Open Source Team" <slingshot-os-team@groups.ext.hpe.com>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Richard
 Cochran" <richardcochran@gmail.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Guenter
 Roeck" <linux@roeck-us.net>
Cc: linux-kbuild@vger.kernel.org
In-Reply-To: <20261030-cxi-netdev-submission-v1-23-8c2c391cc283@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030-cxi-netdev-submission-v1-23-8c2c391cc283@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 21:02:20 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [Medium] net: hpe: ss1: missing HMM_MIRROR Kconfig selection for cass_hmm=
.c
- [Medium] net: hpe: ss1: missing IOMMU_IOVA Kconfig selection for cass_nta=
_iova_init()
- [Medium] net: hpe: ss1: missing I2C and HWMON Kconfig dependencies for ca=
ss_uc.c
- [Medium] net: hpe: ss1: missing PTP_1588_CLOCK_OPTIONAL dependency for ca=
ss_ptp.c
- [Medium] net: hpe: ss1: missing DMA_SHARED_BUFFER dependency on HPE_SS1_P=
2P_DMABUF
- [Low] MAINTAINERS: missing include/uapi/ethernet/ entry for Slingshot NIC=
 driver
- [Low] net: hpe: missing IOMMU_IOVA select in HPE_SS1 breaks cass_nta.c
- [Low] net: hpe: missing SYSFS dependency in HPE_SS1 breaks SBL sprint cal=
ls
- [Low] net: hpe: compiling cass_sriov.o without CONFIG_KVM_VFIO fails -Wer=
ror
- [Low] net: hpe: cass_iommu_init() accesses pri_reqs_alloc without PCI_PRI
- [Low] net: hpe: sl: dead duplicate stub file sl_media_nic.c left unbuilt
- [Low] net: hpe: ss1: Makefile links unused cass_ats_inval.o dead code
--

commit 5de1fa07eeee00c1ea3705142e52d3babf03e9f2
Author: Doug Ledford <doug.ledford@hpe.com>

net: hpe: wire up the Slingshot NIC drivers

This commit hooks the HPE Slingshot SBL, SL, and SS1 drivers into Kconfig a=
nd
Kbuild and adds the corresponding MAINTAINERS entry.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7336600952c8e..4974717d22c15 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11608,6 +11608,13 @@ S:	Supported
>  F:	Documentation/watchdog/hpwdt.rst
>  F:	drivers/watchdog/hpwdt.c
> =20
> +HEWLETT PACKARD ENTERPRISE SLINGSHOT NIC DRIVER
> +M:	Slingshot Open Source Team <slingshot-os-team@groups.ext.hpe.com>
> +L:	netdev@vger.kernel.org
> +S:	Supported
> +F:	include/linux/hpe
> +F:	drivers/net/ethernet/hpe

[Severity: Low]
Earlier commits in this series also introduce ten Slingshot and Cassini UAPI
headers under include/uapi/ethernet/ (cassini_user_defs.h, sbl-abi.h,
sbl_cassini.h, sbl_counters.h, sbl_platform_config.h, sbl_sbm_constants.h,
sbl_serdes.h, sbl_serdes_defaults.h, sbl_serdes_map.h, and
sbl_serdes_map_init.h).

Should this MAINTAINERS entry also include include/uapi/ethernet/ so
scripts/get_maintainer.pl routes changes to those UAPI headers to the driver
maintainers?

[ ... ]

> diff --git a/drivers/net/ethernet/hpe/sl/Makefile b/drivers/net/ethernet/=
hpe/sl/Makefile
> new file mode 100644
> index 0000000000000..1930da475e599
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sl/Makefile

[ ... ]

> +# Everything after here is specific to NICs
> +cxi-sl-$(CONFIG_HPE_SL)	+=3D nic/sl_ldev.o nic/sl_media.o \

[Severity: Low]
Here cxi-sl-$(CONFIG_HPE_SL) builds nic/sl_media.o, which provides the real
NIC implementations of sl_media_cable_insert() and sl_media_cable_remove() =
in
drivers/net/ethernet/hpe/sl/nic/sl_media.c.

However, drivers/net/ethernet/hpe/sl/sl_media_nic.c (added earlier in the
series) defines stub placeholder versions of the same two exported symbols:

drivers/net/ethernet/hpe/sl/sl_media_nic.c:
    int sl_media_cable_insert(struct sl_lgrp *lgrp, u8 *eeprom_page0,
                              u8 *eeprom_page1, u32 flags)
    {
            /* placeholder for future functionality */
            return 0;
    }
    EXPORT_SYMBOL(sl_media_cable_insert);

and is left unreferenced by this Makefile. Is
drivers/net/ethernet/hpe/sl/sl_media_nic.c a leftover stub file that should=
 be
removed?

[ ... ]

> diff --git a/drivers/net/ethernet/hpe/ss1/Kconfig b/drivers/net/ethernet/=
hpe/ss1/Kconfig
> new file mode 100644
> index 0000000000000..d154506749d17
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/ss1/Kconfig
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Kernel config for HPE/Cray Net Cassini Slingshot 200/400Gbs hardware
> +# Copyright 2025 Hewlett Packard Enterprise Development LP
> +
> +config HPE_SS1
> +	tristate "HPE/Cray Slingshot 200/400Gbs NIC driver"
> +	depends on PCI && ETHERNET && NETDEVICES && INET
> +	depends on (ARM64 && CPU_LITTLE_ENDIAN) || X86_64

[Severity: Medium]
Can this fail to build or link when CONFIG_I2C or CONFIG_HWMON is disabled =
or
built as a module while CONFIG_HPE_SS1=3Dy?

drivers/net/ethernet/hpe/ss1/Makefile unconditionally builds cass_uc.o into
cxi-ss1. In drivers/net/ethernet/hpe/ss1/cass_uc.c, create_sensors_intf() a=
nd
cass_unregister_uc() call hwmon_device_register_with_info() and
hwmon_device_unregister():

drivers/net/ethernet/hpe/ss1/cass_uc.c:create_sensors_intf()
    hw->hwmon.dev =3D hwmon_device_register_with_info(&hw->cdev.pdev->dev,
                                                    hw->cdev.name,
                                                    hw,
                                                    &hw->hwmon.chip_info,
                                                    NULL);

and uc_register_i2c() and uc_unregister_i2c() call i2c_add_adapter() and
i2c_del_adapter():

drivers/net/ethernet/hpe/ss1/cass_uc.c:uc_register_i2c()
    ret =3D i2c_add_adapter(&hw->uc_i2c);

In include/linux/i2c.h, i2c_add_adapter() and i2c_del_adapter() are guarded=
 by
#if IS_ENABLED(CONFIG_I2C) with no fallback stubs, and in
include/linux/hwmon.h, hwmon_device_register_with_info() and
hwmon_device_unregister() are declared extern without inline stubs when
CONFIG_HWMON=3Dn. Should HPE_SS1 depend on I2C and HWMON?

[Severity: Medium]
Does HPE_SS1 also need a dependency on PTP_1588_CLOCK_OPTIONAL?

drivers/net/ethernet/hpe/ss1/Makefile unconditionally compiles cass_ptp.o a=
nd
cass_eth.o into cxi-ss1. In drivers/net/ethernet/hpe/ss1/cass_ptp.c,
cass_ptp_init() and cass_ptp_fini() call ptp_clock_register() and
ptp_clock_unregister(), and in drivers/net/ethernet/hpe/ss1/cass_eth.c,
cxi_eth_devinfo() calls ptp_clock_index():

drivers/net/ethernet/hpe/ss1/cass_ptp.c:cass_ptp_init()
    hw->ptp_clock =3D ptp_clock_register(&hw->ptp_info,
                                       &hw->cdev.pdev->dev);

drivers/net/ethernet/hpe/ss1/cass_eth.c:cxi_eth_devinfo()
    eth_info->ptp_clock_index =3D ptp_clock_index(hw->ptp_clock);

When CONFIG_HPE_SS1=3Dy and CONFIG_PTP_1588_CLOCK=3Dm,
IS_ENABLED(CONFIG_PTP_1588_CLOCK) is true in include/linux/ptp_clock_kernel=
.h,
so built-in cxi-ss1 references symbols from the loadable ptp module and fai=
ls
to link vmlinux.

[Severity: Low]
What happens if CONFIG_HPE_SS1 is built with CONFIG_SYSFS=3Dn (under
CONFIG_EXPERT=3Dy)?

In include/linux/hpe/sbl/sbl.h and drivers/net/ethernet/hpe/sbl/*.c, the
sbl_*_sysfs_sprint() declarations and definitions are guarded by
#ifdef CONFIG_SYSFS:

include/linux/hpe/sbl/sbl.h:
    #ifdef CONFIG_SYSFS
    int sbl_media_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *bu=
f, size_t size);

However, drivers/net/ethernet/hpe/ss1/cass_sbl.c (in link_layer_retry_show(=
),
loopback_show(), media_show(), and speed_show()) and
drivers/net/ethernet/hpe/ss1/cass_ss1_debugfs.c (in port_debugfs_print() and
sbl_counters_print()) call sbl_base_link_llr_sysfs_sprint(),
sbl_media_sysfs_sprint(), and related helpers outside #ifdef CONFIG_SYSFS.
Should HPE_SS1 depend on SYSFS (or guard those callers with CONFIG_SYSFS)?

> +	select HPE_SBL
> +	select HPE_SL
> +	select CONFIGFS_FS
> +	select AUXILIARY_BUS

[Severity: Medium]
Should HPE_SS1 also select HMM_MIRROR?

drivers/net/ethernet/hpe/ss1/Makefile unconditionally includes cass_hmm.o in
cxi-ss1-objs. In drivers/net/ethernet/hpe/ss1/cass_hmm.c, cass_range_fault()
calls hmm_range_fault():

drivers/net/ethernet/hpe/ss1/cass_hmm.c:cass_range_fault()
    if (range->default_flags & HMM_PFN_REQ_FAULT)
            return hmm_range_fault(range);

and cass_notifier_cleanup(), cass_mirror_fault(), cass_sync_pagetables(), a=
nd
cass_mmu_notifier_insert() call mmu_interval_notifier_insert(),
mmu_interval_notifier_remove(), mmu_interval_read_begin(),
mmu_interval_read_retry(), mmu_notifier_range_blockable(), and
mmu_interval_set_seq():

drivers/net/ethernet/hpe/ss1/cass_hmm.c:cass_mmu_notifier_insert()
    ret =3D mmu_interval_notifier_insert(&md_priv->mn_sub,
                                       current->mm,
                                       m_opts->va_start,
                                       m_opts->va_len,
                                       &cass_notifier_ops);

Both HMM_MIRROR (which selects MMU_NOTIFIER) and MMU_NOTIFIER are promptless
bool symbols in mm/Kconfig with no fallback stubs in include/linux/hmm.h or
include/linux/mmu_notifier.h when disabled, so building CONFIG_HPE_SS1 when
nothing else selects HMM_MIRROR fails to compile and link cass_hmm.o.

[Severity: Medium]
Should HPE_SS1 also select IOMMU_IOVA?

drivers/net/ethernet/hpe/ss1/Makefile unconditionally includes cass_nta.o in
cxi-ss1-objs, and drivers/net/ethernet/hpe/ss1/cxi_core.h unconditionally
defines HAVE_IOVA_INIT_RCACHES. In drivers/net/ethernet/hpe/ss1/cass_nta.c,
cass_nta_iova_init() calls iova_domain_init_rcaches():

drivers/net/ethernet/hpe/ss1/cass_nta.c:cass_nta_iova_init()
    #ifdef HAVE_IOVA_INIT_RCACHES
            ret =3D iova_domain_init_rcaches(cac->iovad);
            if (ret) {
                    cass_nta_iova_fini(cac);
                    return ret;
            }
    #endif

In include/linux/iova.h, iova_domain_init_rcaches() is only declared under
#if IS_REACHABLE(CONFIG_IOMMU_IOVA) with no stub in the #else branch, and
IOMMU_IOVA is a promptless tristate symbol in drivers/iommu/Kconfig. When
CONFIG_IOMMU_IOVA is not reachable, cass_nta.c fails to compile with an
implicit declaration of iova_domain_init_rcaches().

[ ... ]

> +config HPE_SS1_P2P_DMABUF
> +	bool "Enable Peer-2-Peer dmabuf support"
> +	depends on HPE_SS1 && PCI_P2PDMA

[Severity: Medium]
Does HPE_SS1_P2P_DMABUF need a dependency on (or select of) DMA_SHARED_BUFF=
ER?

When CONFIG_HPE_SS1_P2P_DMABUF=3Dy, drivers/net/ethernet/hpe/ss1/Makefile
builds cass_dma_buf.o into cxi-ss1. In
drivers/net/ethernet/hpe/ss1/cass_dma_buf.c, cxi_dmabuf_get_pages() and
cxi_dmabuf_put_pages() call dma_buf_get(), dma_buf_put(),
dma_buf_dynamic_attach(), dma_buf_detach(), dma_buf_map_attachment(),
dma_buf_unmap_attachment(), dma_resv_get_singleton(), and
dma_resv_wait_timeout():

drivers/net/ethernet/hpe/ss1/cass_dma_buf.c:cxi_dmabuf_get_pages()
    md_priv->dmabuf =3D dma_buf_get(md_priv->dmabuf_fd);

Neither HPE_SS1 nor PCI_P2PDMA selects or depends on DMA_SHARED_BUFFER, and
include/linux/dma-buf.h declares those symbols extern without stubs when
CONFIG_DMA_SHARED_BUFFER=3Dn, causing link failures when DMA_SHARED_BUFFER =
is
not enabled by another driver.

[ ... ]

> diff --git a/drivers/net/ethernet/hpe/ss1/Makefile b/drivers/net/ethernet=
/hpe/ss1/Makefile
> new file mode 100644
> index 0000000000000..538ac762cff22
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/ss1/Makefile
> @@ -0,0 +1,28 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for HPE/Cray Net Cassini Slingshot version 200/400Gbs hardware
> +# Copyright 2025 Hewlett Packard Enterprise Development LP
> +
> +subdir-ccflags-y +=3D -I$(src)
> +
> +obj-$(CONFIG_HPE_SS1) +=3D cxi-ss1.o cxi-eth.o
> +
> +cxi-ss1-objs :=3D cxi_core.o cass_core.o cass_lni.o cass_rmu.o cass_eq.o=
 \
> +		cass_cpt.o cass_cq.o cass_pt.o cass_atu.o cass_ct.o \
> +		cass_errors.o cass_sriov.o cass_nta.o cass_ptp.o \

[Severity: Low]
Will compiling cass_sriov.o fail under CONFIG_WERROR=3Dy when CONFIG_KVM_VF=
IO is
not enabled?

In drivers/net/ethernet/hpe/ss1/cass_core.h, CXI_DISABLE_SRIOV is defined
whenever CONFIG_KVM_VFIO is not set:

drivers/net/ethernet/hpe/ss1/cass_core.h:
    #if !defined(CONFIG_KVM_VFIO)
    #define CXI_DISABLE_SRIOV
    #endif

and drivers/net/ethernet/hpe/ss1/cass_sriov.c then emits a preprocessor
#warning:

drivers/net/ethernet/hpe/ss1/cass_sriov.c:
    #if defined(CXI_DISABLE_SRIOV)
    #warning "SR-IOV support is disabled."

With CONFIG_WERROR=3Dy, this #warning causes -Werror=3Dcpp to fail the build
whenever CONFIG_KVM_VFIO is unset.

[Severity: Low]
In addition to the iova_domain_init_rcaches() build issue in cass_nta.o when
CONFIG_IOMMU_IOVA is not reachable, does cass_nta_init() also fail at runti=
me
if alloc_iova_fast() falls back to the stub in include/linux/iova.h?

In drivers/net/ethernet/hpe/ss1/cass_nta.c, cass_nta_init() calls
cass_nta_iova_alloc() -> alloc_iova_fast():

drivers/net/ethernet/hpe/ss1/cass_nta.c:cass_nta_init()
    m_opts->iova =3D cass_nta_iova_alloc(cac, m_opts);
    if (!m_opts->iova) {
            if (cac->iovad) {
                    pr_debug("cass_iova_alloc failed %lld\n", m_opts->iova);
                    ret =3D -ENOENT;
                    goto alloc_iova_fail;
            }
    }

When !IS_REACHABLE(CONFIG_IOMMU_IOVA), alloc_iova_fast() and iova_cache_get=
()
resolve to stubs returning 0 and -ENOTSUPP, causing NTA IOVA allocation in
cass_nta_init() to fail with -ENOENT unless IOMMU_IOVA is selected by HPE_S=
S1.

> +		cass_hni.o cass_eth.o cass_rmu_eth.o cass_ats.o cass_uc.o \

[Severity: Low]
Can building cass_ats.o fail on ARM64 when CONFIG_IOMMU_SVA=3Dy and
CONFIG_PCI_PRI=3Dn?

In drivers/net/ethernet/hpe/ss1/cass_ats.c, cass_iommu_init() accesses
pdev->pri_reqs_alloc inside an #ifdef CONFIG_IOMMU_SVA block:

drivers/net/ethernet/hpe/ss1/cass_ats.c:cass_iommu_init()
    #ifdef CONFIG_IOMMU_SVA
            ...
            pdev->pri_reqs_alloc =3D max_requests;

In include/linux/pci.h, struct pci_dev only defines pri_reqs_alloc under
#ifdef CONFIG_PCI_PRI:

include/linux/pci.h:struct pci_dev
    #ifdef CONFIG_PCI_PRI
            u16             pri_cap;        /* PRI Capability offset */
            u32             pri_reqs_alloc; /* Number of PRI requests alloc=
ated */
            unsigned int    pasid_required:1; /* PRG Response PASID Require=
d */
    #endif

On ARM64, CONFIG_ARM_SMMU_V3_SVA selects IOMMU_SVA without selecting PCI_PR=
I,
so compiling cass_ats.c with CONFIG_IOMMU_SVA=3Dy and CONFIG_PCI_PRI=3Dn fa=
ils.

> +		cass_hmm.o cxi_qos_profiles.o cass_tc.o cass_svc.o \
> +		cass_telem.o cxi_link.o cass_sbl.o cass_sl.o \
> +		cass_sl_io.o cass_sysfs.o cass_sbus.o cass_phy.o \
> +		cass_dmac.o cass_link.o cass_link_misc.o cass_port_misc.o \
> +		cass_lmon.o cass_ixe.o cass_irq.o cass_cable.o \
> +		cass_odp_decouple.o cass_ats_inval.o cass_pcie_mon.o \

[Severity: Low]
Is cass_ats_inval.o needed in cxi-ss1-objs?

Its only non-static function is cass_amd_iommu_inval_cb_init() in
drivers/net/ethernet/hpe/ss1/cass_ats_inval.c:

drivers/net/ethernet/hpe/ss1/cass_ats_inval.c:cass_amd_iommu_inval_cb_init()
    void cass_amd_iommu_inval_cb_init(struct pci_dev *pdev)
    {
            int (*set_inval_range_cb)(struct pci_dev *pdev,
                                      amd_iommu_invalidate_range cb);
            struct cass_dev *hw =3D pci_get_drvdata(pdev);
            int ret;

            /* Only set up invalidation callback for Cassini 1 */
            if (!cass_version(hw, CASSINI_1))
                    return;

            set_inval_range_cb =3D symbol_get(amd_iommu_set_invalidate_rang=
e_cb);

cass_amd_iommu_inval_cb_init() has no callers anywhere in the tree, and
amd_iommu_set_invalidate_range_cb does not exist in the mainline kernel. Sh=
ould
cass_ats_inval.o (and cass_ats_inval.c) be dropped?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-cxi-netdev=
-submission-v1-0-8c2c391cc283@hpe.com?part=3D23
