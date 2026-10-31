Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480525;
	b=S0ESmSu/Gc0asQQGbiRLEwnhsW0S+q2nwrCSayd3O8p1DP6YC+GQB/eBJVU+fXhnvMeF
	 RscBvkzl59iBkHS1LyQJKlFsdD3jAmkSAkzrDjECinmBj5JtYqij+KRX9SpMVDU3pJ6s0
	 rDnXNhzuqxlD9eHiby+eLz7OYFua1EpZdttamaX43DXmJUyKPDgbGiAOl6elfyiilZg6W
	 InCee8C642Y3fvhpNbvxLTgH1aNd2UBCxJ9cmn8DZSkOXUWNZiBwZ8I5UDuF8CccmGpBj
	 PFUOmxxJaZz61VAoHEDEjR7ouXsM+ytl4oH5uJ7G5cYa9fjWDND+mepOgsD86U6rDwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480525;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+rQFUyu0b4EY5agMI1camGEuCZbNK2XlC60VM4FiWWk=;
	b=pSk1qCoU2Gys7wLKctuqqLfNVFINriDnWiy37rEobbaJyfmaL79S33F6wr754gL647im
	 aWrOlrkbBIyMObzLlkkJItQore6/+PSY3vzr7rfmQgVvHPWfReWeaKAEwVyaWkRcOMRrD
	 sit3OL7tAldfpR+gvrHwIxfV1VJBKXcZnC3x4zt5dGJN1BVZapOAOFUuXZJ/IsTiHELTh
	 0BSwvg1TxH6uAP41ARqiBb+CidqOb05kJUj3yO70A1Z/skWLvvTTdvJiXta+yVNl1TbMt
	 Qq2NzgnbkYdcB34J/jNUJ5toSM/JaHlCYEwsts7i2nGhMaNQ4XE7luTOYKGA7gX3gHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QUDKwi9G;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E3A606A31C
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 21:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QUDKwi9G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 718D11F000C1;
	Sat, 31 Oct 2026 21:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793480524;
	bh=+rQFUyu0b4EY5agMI1camGEuCZbNK2XlC60VM4FiWWk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QUDKwi9GGXkhbIcLDDLMNVyb6XyGBBEKB0GgjhzVng/ODUwWakng/n4lUFd4p7hNj
	 JYsXHrSX1K1UMbx931fmJ0o9AC0/GP//nUpkg1XWUYfh2f0I2fwJ/e8xVcWhwpeab1
	 prVvA+VFRW0EhYFO4UDKLFekWIqT8ZltnAyhoQcsBOfTckmDb9VyGogs6BEqQmKspq
	 O8l3PMtpyCFE2fOuL/QxxKO1FkvGPACs7OXQNobUJmAPIJkbhjbtdJtt9vm1TMAAaV
	 eptw9v4qF4AEXccLXiU3BeN67avcus+AW6ViP29ncfjDdxcrSGWe2lrydaDIxVW4bb
	 CpsVMEYdzkkVw==
Message-ID: <sashiko-outbox-192134@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/23] net: hpe: sbl: add the Slingshot Base Link
 headers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Doug Ledford" <doug.ledford@hpe.com>, "Slingshot Open Source Team" <slingshot-os-team@groups.ext.hpe.com>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Richard
 Cochran" <richardcochran@gmail.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Guenter
 Roeck" <linux@roeck-us.net>
Cc: linux-kbuild@vger.kernel.org, "Sandeep Bhoot" <sandeep.bhoot@hpe.com>, "Iraimani
 P" <iraimani.pavadai@hpe.com>
In-Reply-To: <20261030-cxi-netdev-submission-v1-2-8c2c391cc283@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030-cxi-netdev-submission-v1-2-8c2c391cc283@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 21:02:03 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Low] net: hpe: sbl: non-static inline helpers in sbl_sbm.h break linkage
- [Low] net: hpe: sbl: missing include guard and type headers in sbl_fec.h
- [Low] net: hpe: sbl: duplicate sbl_platform.h and redundant macro definit=
ions
- [Low] net: hpe: sbl: broken and duplicate macro definitions in sbl headers
--

commit 16e18859cf46bda5dac6f9baa31ae685653174a5
Author: Doug Ledford <doug.ledford@hpe.com>

net: hpe: sbl: add the Slingshot Base Link headers

This commit adds the internal, kernel, and UAPI header files for the HPE
Slingshot Base Link (SBL) 200 Gb/s link layer driver used by the first
generation Cassini NIC.

> diff --git a/drivers/net/ethernet/hpe/sbl/sbl_constants.h b/drivers/net/e=
thernet/hpe/sbl/sbl_constants.h
> new file mode 100644
> index 0000000000000..a21a43f84a047
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sbl/sbl_constants.h

[ ... ]

> +#define SPICO_INT_DATA_TXEQ_DATA_MASK   0x00ff
> +#define SPICO_INT_DATA_RXEQ_VAL_MASK    0x00ff
> +#define SPICO_INT_DATA_PRBS_SUCCESS     0x0002

[ ... ]

> +#define SPICO_INT_DATA_RXEQ_SIGN_MASK   0x8000
> +#define SPICO_INT_DATA_RXEQ_VAL_MASK    0x00ff
> +
> +#define SPICO_INT_DATA_HAL_DFE_APPLY    0x0018

[ ... ]

> diff --git a/drivers/net/ethernet/hpe/sbl/sbl_platform.h b/drivers/net/et=
hernet/hpe/sbl/sbl_platform.h
> new file mode 100644
> index 0000000000000..d47630f9e84a1
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sbl/sbl_platform.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +/* Copyright 2025 Hewlett Packard Enterprise Development LP */
> +
> +#ifndef _SBL_PLATFORM_H_
> +#define _SBL_PLATFORM_H_
> +
> +#define SBUS_RING_MTX(sbl, ring) ((sbl)->sbus_ring_mtx)
> +#define SBM_FW_MTX(sbl, ring) ((sbl)->sbm_fw_mtx)
> +
> +#define sbl_dev_log(_logfn, _dev, _fmt, ...)						\
> +	do {									\
> +		char __sbl_inst[sizeof(sbl->iattr.inst_name)];			\
> +		char __sbl_eth[sizeof(sbl->iattr.eth_if_name)];		\
> +		sbl_inst_names_get(sbl, __sbl_inst, __sbl_eth);			\
> +		_logfn((_dev), "%s[%s]: " _fmt, __sbl_inst, __sbl_eth, ##__VA_ARGS__);=
	\
> +	} while (0)
> +
> +#define sbl_dev_err(_dev, _fmt, ...) sbl_dev_log(dev_err, _dev, _fmt, ##=
__VA_ARGS__)
> +#define sbl_dev_dbg(_dev, _fmt, ...) sbl_dev_log(dev_dbg, _dev, _fmt, ##=
__VA_ARGS__)
> +#define sbl_dev_warn(_dev, _fmt, ...) sbl_dev_log(dev_warn, _dev, _fmt, =
##__VA_ARGS__)
> +#define sbl_dev_info(_dev, _fmt, ...) sbl_dev_log(dev_info, _dev, _fmt, =
##__VA_ARGS__)
> +#define sbl_dev_err_ratelimited(_dev, _fmt, ...) \
> +	sbl_dev_log(dev_err_ratelimited, _dev, _fmt, ##__VA_ARGS__)
> +#define sbl_dev_dbg_ratelimited(_dev, _fmt, ...) \
> +	sbl_dev_log(dev_dbg_ratelimited, _dev, _fmt, ##__VA_ARGS__)
> +/* Configuration passing into SBL init */
> +struct sbl_init_attr {
> +	u32 magic;
> +	u32 uc_nic;
> +	u32 uc_platform;
> +	bool is_hw;
> +};
> +
> +#endif /* _SBL_PLATFORM_H_ */

[Severity: Low]
This isn't a bug, but drivers/net/ethernet/hpe/sbl/sbl_platform.h and
include/linux/hpe/sbl/sbl_platform.h are byte-for-byte identical files with
the same _SBL_PLATFORM_H_ include guard. Since include/linux/hpe/sbl/sbl.h
includes sbl_platform.h from its own directory, one copy can shadow the oth=
er
depending on include order. Could the duplicate file in
drivers/net/ethernet/hpe/sbl/sbl_platform.h be dropped?

In addition, sbl_dev_log() takes _dev as a macro parameter but implicitly
references an undeclared caller variable named sbl, calls
sbl_inst_names_get() which is only defined later in
include/linux/hpe/sbl/sbl.h, and unconditionally acquires and releases
sbl->name_lock even when dynamic debug logging is disabled. Could sbl be
passed explicitly (or derived from _dev) and sbl_dev_log() moved after
sbl_inst_names_get()?

There are also several other duplicated definitions across the headers in
this patch:
- SPICO_INT_DATA_RXEQ_VAL_MASK is defined twice in
  drivers/net/ethernet/hpe/sbl/sbl_constants.h.
- SBUS_ADDR, SBUS_RING, SBUS_RX_ADDR, LEVEL_ERR, LEVEL_WARN, LEVEL_INFO,
  LEVEL_DBG, SPICO_SBR_DATA_BE_012, SPICO_SBR_DATA_BE_01,
  SPICO_SBR_DATA_BE_0, SPICO_SBR_DATA_W0_OFFSET, SPICO_SBR_DATA_W1_OFFSET,
  SPICO_SBR_DATA_W2_OFFSET, and SPICO_INT_DATA_NONE are defined in both
  drivers/net/ethernet/hpe/sbl/sbl_constants.h and
  include/uapi/ethernet/sbl_sbm_constants.h.
- sbl_pml_pcs_sysfs_sprint() and sbl_pml_pcs_lane_degrade_sysfs_sprint() are
  declared in both drivers/net/ethernet/hpe/sbl/sbl_link.h and
  include/linux/hpe/sbl/sbl.h.

Could these duplicate definitions be consolidated?

> diff --git a/drivers/net/ethernet/hpe/sbl/sbl_sbm.h b/drivers/net/etherne=
t/hpe/sbl/sbl_sbm.h
> new file mode 100644
> index 0000000000000..73b97081a5d77
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sbl/sbl_sbm.h
> @@ -0,0 +1,73 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright 2019-2026 Hewlett Packard Enterprise Development LP. All ri=
ghts reserved. */
> +
> +#ifndef SBL_SBM_H
> +#define SBL_SBM_H
> +
> +#include <linux/kernel.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +
> +#include <linux/hpe/sbl/sbl.h>
> +
> +#include "sbl_internal.h"
> +
> +#define SBL_ERR(dev, format, args...)    sbl_dev_err(dev, format, ## arg=
s)
> +#define SBL_WARN(dev, format, args...)   sbl_dev_warn(dev, format, ## ar=
gs)
> +#define SBL_INFO(dev, format, args...)   sbl_dev_info(dev, format, ## ar=
gs)
> +#define SBL_TRACE1(dev, format, args...) dev_dbg(dev, format, ## args)
> +#define SBL_TRACE2(dev, format, args...) DEV_TRACE2(dev, format, ## args)
> +#define SBL_TRACE3(dev, format, args...) DEV_TRACE3(dev, format, ## args)
> +
> +inline int sbl_sbm_sbus_op(struct sbl_inst *sbl, int ring, u32 req_data,
> +			     u8 data_addr, u8 rx_addr, u8 command,
> +			     u32 *rsp_data, u8 *result_code, u8 *overrun,
> +			     int timeout, u32 flags)
> +{
> +	return sbl_sbus_op(sbl, ring, req_data, data_addr, rx_addr, command,
> +			   rsp_data, result_code, overrun, timeout, flags);
> +}
> +
> +inline int sbl_sbm_sbus_op_reset(struct sbl_inst *sbl, int ring)
> +{
> +	return sbl_sbus_op_reset(sbl, ring);
> +}
> +
> +inline int sbl_sbm_pml_serdes_op(struct sbl_inst *sbl, int port_num,
> +				   u64 serdes_sel, u64 op, u64 data,
> +				   u16 *result, int timeout, u32 flags)
> +{
> +	return sbl_pml_serdes_op(sbl, port_num, serdes_sel, op, data, result,
> +				 timeout, flags);
> +}
> +
> +inline int sbl_sbm_get_sbus_op_timeout_ms(struct sbl_inst *sbl)
> +{
> +	return sbl->iattr.sbus_op_timeout_ms;
> +}
> +
> +inline int sbl_sbm_get_sbus_int_timeout(struct sbl_inst *sbl)
> +{
> +	return sbl->iattr.sbus_int_timeout;
> +}
> +
> +inline int sbl_sbm_get_sbus_int_poll_interval(struct sbl_inst *sbl)
> +{
> +	return sbl->iattr.sbus_int_poll_interval;
> +}
> +
> +inline int sbl_sbm_get_serdes_op_timeout_ms(struct sbl_inst *sbl)
> +{
> +	return sbl->iattr.serdes_op_timeout_ms;
> +}
> +
> +inline int sbl_sbm_get_sbus_op_flags(struct sbl_inst *sbl)
> +{
> +	return sbl->sbus_op_flags;
> +}
> +
> +inline int sbl_sbm_get_serdes_op_flags(struct sbl_inst *sbl)
> +{
> +	return sbl->iattr.serdes_op_flags;
> +}
> +#endif /* SBL_SBM_H */

[Severity: Low]
Should these nine inline helper functions in
drivers/net/ethernet/hpe/sbl/sbl_sbm.h (sbl_sbm_sbus_op() through
sbl_sbm_get_serdes_op_flags()) be declared static inline instead of bare
inline?

In the kernel, inline expands with __gnu_inline, so a bare inline definition
without static or a prior prototype emits an externally visible out-of-line
function symbol in every translation unit that includes sbl_sbm.h. That
triggers -Wmissing-prototypes and -Wmissing-declarations warnings (breaking
the build under CONFIG_WERROR=3Dy) when compiling sbl_sbm_serdes.c, and will
cause multiple-definition linker errors if more than one translation unit
includes this header.

> diff --git a/include/linux/hpe/sbl/sbl_fec.h b/include/linux/hpe/sbl/sbl_=
fec.h
> new file mode 100644
> index 0000000000000..23594d79a91a9
> --- /dev/null
> +++ b/include/linux/hpe/sbl/sbl_fec.h
> @@ -0,0 +1,88 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +/* Copyright 2024 Hewlett Packard Enterprise Development LP */
> +
> +/* FEC up check */
> +#define SBL_FEC_UP_SETTLE_PERIOD	 250	   /* ms */
> +#define SBL_FEC_UP_WINDOW		 250	   /* ms */
> +#define SBL_FEC_UP_COUNT_FABRIC		 4
> +#define SBL_FEC_UP_COUNT_EDGE		 1
> +#define SBL_FEC_MON_PERIOD		 1000	   /* 1sec*/
> +#define SBL_FEC_LLR_TX_REPLAY_THRESH	 100000	   /* llr_tx_replays/s */
> +#define SBL_PCS_NUM_FECL_CNTRS		 8
> +#define SBL_MAX_FEC_WARNINGS		 3	   /* number of warnings issued */
> +
> +struct sbl_pcs_fec_cntrs {
> +	u64 ccw;				  /* corrected code words */
> +	u64 ucw;				  /* uncorrected code words */
> +	u64 llr_tx_replay;			  /* llr_tx_replay_event count */
> +	u64 fecl[SBL_PCS_NUM_FECL_CNTRS];	  /* lane errors */
> +	unsigned long time;			  /* either abs or interval */
> +};

[Severity: Low]
Unlike the other headers in this patch, include/linux/hpe/sbl/sbl_fec.h does
not have an #ifndef / #define / #endif include guard, and it uses u64, u32,
s32, bool, spinlock_t, struct timer_list, and struct work_struct without
including linux/types.h, linux/spinlock.h, linux/timer.h, or
linux/workqueue.h.

If sbl_fec.h is included more than once in a translation unit, or included
before those kernel headers, compilation will fail with redefinition or
unknown type errors. Could an include guard and the required header includes
be added to sbl_fec.h?

> diff --git a/include/linux/hpe/sbl/sbl_pml.h b/include/linux/hpe/sbl/sbl_=
pml.h
> new file mode 100644
> index 0000000000000..92b32f1dcf220
> --- /dev/null
> +++ b/include/linux/hpe/sbl/sbl_pml.h

[ ... ]

> +#define SBL_PML_CFG_PCS_PCS_MODE_UPDATE(a, b) \
> +	C_UPDATE(a, b, c1_hni_pml_cfg_pcs, pcs_mode)
> +#define SBL_PML_CFG_PCS_BY_25G_FEC_MODE_UPDATE(a, b) \
> +	C_UPDATE(a, b, c1_hni_pml_cfg_pcs, by_25g_fec_mode)
> +#define SBL_PML_CFG_PCS_TIMESTAMP_SHIFT_UPDATE(a, b) \
> +	C_UPDATE(a, b, c1_hni_pml_cfg_pcs, timestamp_shift)

[ ... ]

> +/* DFLT defines */
> +#define SBL_PML_CFG_LLR_MAC_IF_CREDITS C1_HNI_CFG_LLR_MAC__IF_CREDITS
> +#define SBL_PML_CFG_TX_MAC_PCS_CREDITS C1_HNI_CFG_TX_MAC__PCS_CREDITS
> +#define SBL_PML_CFG_TX_PCS_CDC_READY_LEVEL C1_HNI_CFG_TX_PCS__CDC_READY_=
LEVEL
> +#define SBL_PML_CFG_TX_PCS_GEARBOX_CREDITS C1_HNI_CFG_TX_PCS__GEARBOX_CR=
EDITS
> +#define SBL_PML_CFG_TX_PCS_CDC_READY_LEVEL_DFLT \
> +	C1_HNI_PML_CFG_TX_PCS__CDC_READY_LEVEL

[ ... ]

> +#define SBL_PML_CFG_SERDES_CORE_INTERRUPT_CAPTURE_INTERRUPT_DATA_DELAY_S=
ET(a) \
> +	C_SET(a, c1_hni_pml_cfg_serdes_core_interrupt,                        \
> +	      capture_interrupt_data_delay)
> +#define SBL_PML_CFG_SERDES_CORE_INTERRUPT_CLEAR_INTERRUPT_DELAY_SET(a) \
> +	C_SET(a, c1_hni_pml_cfg_serdes_core_interrupt, clear_interrupt_delay)
> +#define SBL_PML_CFG_SERDES_CORE_INTERRUPT_SET_INTERRUPT_DELAY_SET(a) \
> +	C_SET(a, c1_hni_pml_cfg_serdes_core_interrupt, set_interrupt_delay)

[ ... ]

> +#define SBL_PML_CFG_SERDES_CORE_INTERRUPT_CAPTURE_INTERRUPT_DATA_DELAY_S=
ET(a) \
> +	C_SET(a, c1_hni_pml_cfg_serdes_core_interrupt,                        \
> +	      capture_interrupt_data_delay)
> +#define SBL_PML_CFG_SERDES_CORE_INTERRUPT_CLEAR_INTERRUPT_DELAY_SET(a) \
> +	C_SET(a, c1_hni_pml_cfg_serdes_core_interrupt, clear_interrupt_delay)
> +#define SBL_PML_CFG_SERDES_CORE_INTERRUPT_SET_INTERRUPT_DELAY_SET(a) \
> +	C_SET(a, c1_hni_pml_cfg_serdes_core_interrupt, set_interrupt_delay)

[ ... ]

> +/* GET defines */
> +#define SBL_PML_CFG_LLR_LINK_DOWN_BEHAVIOR_GET(a) \
> +	C_GET(a, c1_hni_pml_cfg_llr, link_down_behavior)
> +#define SBL_PML_CFG_LLR_LLR_MODE_GET(a) C_GET(a, c1_hni_pml_cfg_llr, llr=
_mode)
> +#define SBL_PML_CFG_LLR_SM_REPLAY_CT_MAX_GET(a) \
> +	C_GET(a, c_hni_pml_cfg_llr_sm, replay_ct_max)
> +#define SBL_PML_CFG_PCS_AUTONEG_NEXT_PAGE_LOADED_GET(a) \
> +	C_GET(a, c1_hni_pml_cfg_pcs_autoneg, next_page_loaded)

[ ... ]

> +#define SS2_PORT_PML_CFG_TX_PCS_SUBPORT_GEARBOX_CREDITS_UPDATE(a, b) \
> +	C_UPDATE(a, b, ss2_port_pml_cfg_tx_pcs_subport, gearbox_credits)
> +#define SS2_PORT_PML_CFG_TX_PCS_KEEP_ALL_LANES_ACTIVE_UPDATE(a, b) \
> +	C_UPDATE(a, b, ss2_port_pml_cfg_tx_pcs, keep_all_lanes_active)

[ ... ]

> diff --git a/include/uapi/ethernet/sbl_serdes_defaults.h b/include/uapi/e=
thernet/sbl_serdes_defaults.h
> new file mode 100644
> index 0000000000000..440ee8631ce79
> --- /dev/null
> +++ b/include/uapi/ethernet/sbl_serdes_defaults.h

[ ... ]

> +#define SBL_DFLT_CORE_STATUS_RD_TIMEOUT                     1
> +#define SBL_DFLT_CORE_STATUS_RD_POLL_INTERVAL              50
> +#define SBL_DFLT_PLATFORM                   SBL_PLAT_HARDWARE

[Severity: Low]
Several macro definitions in include/linux/hpe/sbl/sbl_pml.h and
include/uapi/ethernet/sbl_serdes_defaults.h reference nonexistent types,
members, or constants, or are duplicated:

1. SBL_PML_CFG_PCS_AUTONEG_NEXT_PAGE_LOADED_GET(a) references union
   c1_hni_pml_cfg_pcs_autoneg, whereas include/uapi/ethernet/cassini_user_d=
efs.h
   defines union c_hni_pml_cfg_pcs_autoneg (as used by
   SBL_PML_CFG_PCS_AUTONEG_NEXT_PAGE_LOADED_UPDATE and
   SBL_PML_CFG_PCS_AUTONEG_NEXT_PAGE_LOADED_SET).
2. SBL_PML_CFG_PCS_BY_25G_FEC_MODE_UPDATE(a, b) accesses member
   by_25g_fec_mode on union c1_hni_pml_cfg_pcs, which does not have that
   field in cassini_user_defs.h (only union ss2_port_pml_cfg_pcs has
   by_25g_fec_mode).
3. SS2_PORT_PML_CFG_TX_PCS_KEEP_ALL_LANES_ACTIVE_UPDATE(a, b) accesses memb=
er
   keep_all_lanes_active on union ss2_port_pml_cfg_tx_pcs, which does not
   exist in cassini_user_defs.h.
4. SBL_PML_CFG_LLR_MAC_IF_CREDITS, SBL_PML_CFG_TX_MAC_PCS_CREDITS,
   SBL_PML_CFG_TX_PCS_CDC_READY_LEVEL, and
   SBL_PML_CFG_TX_PCS_GEARBOX_CREDITS expand to C1_HNI_CFG_* identifiers th=
at
   omit _PML_ and do not exist in
   include/linux/hpe/cxi/cassini_csr_defaults.h (unlike the _DFLT variants
   right below them).
5. SBL_PML_CFG_SERDES_CORE_INTERRUPT_CAPTURE_INTERRUPT_DATA_DELAY_SET,
   SBL_PML_CFG_SERDES_CORE_INTERRUPT_CLEAR_INTERRUPT_DELAY_SET, and
   SBL_PML_CFG_SERDES_CORE_INTERRUPT_SET_INTERRUPT_DELAY_SET are defined
   twice in include/linux/hpe/sbl/sbl_pml.h.
6. In include/uapi/ethernet/sbl_serdes_defaults.h, SBL_DFLT_PLATFORM expands
   to SBL_PLAT_HARDWARE, which is not defined in any UAPI or kernel header.

Should these macro definitions be fixed or removed if unused?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-cxi-netdev=
-submission-v1-0-8c2c391cc283@hpe.com?part=3D2
