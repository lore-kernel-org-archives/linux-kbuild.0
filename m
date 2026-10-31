Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480538;
	b=s4dN4jroL6E4Eno8keifQ00q19Rj+pg5q8HWzwq2v0pm7UOiMEuVkakYf99TkZczfKXP
	 guxDSe9wvVG/IIWBSWIh6Hkm5zzlMyfLnzp+mEXhmFm+l8tETtg+HHphLt90MDKCP6S01
	 Y14fXIO3hm9q8KtxLQX30Bo91wPJ+AdIFCNiWhlzwdbdjZtfcBPVcKwuR+m151ub5437F
	 0Opwpyx8ULKyGzw85IkpVx8T7mW7fi5nIYV7CF/9j9zI7DtasrWg1rDqb9YBXPU1WTknr
	 Ao5mKsTZEtYlutwNwJLTi9IJCKaFAw/YAG+KUG2ZhEdMTnyPGVhfUQKYFnrumteH8eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480538;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5fxkHaKFyvtCD2WljUtoruCL+yJvIzbtm4B6NbbwJ0s=;
	b=ELykBf+SysKD9agkEbDjA9B3KOS1KSH/BrZ99fg4RwFWcoFKt4IY3sNX0PjvrzU8Il7k
	 dmsVXFjHVNp7J1tHVL+IW3FRFpFbclY2CUebQmkYYvB+NZlY/47s5JIhahd2KoR3wJXGh
	 MkifdRj2oSeKQVhc6xh0GWF4JxC86jVsU99MdSyvliWp0biCdtjUYb1w7HkwXHn5RGzcz
	 kn+oHZeKY17lNmEKaQYLICkxEOGMlKJkRbIAxEW+ZDMBkvtJQoZrccb2LKHuQ9bj5jXx7
	 MD+N+sdGxwJn3FEjf+o7vG1xYrMBbKtLmb9TjkEonefQH9Caara4Q11yA0xYnfJR/0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=juNxlD0K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E9E606A31C
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 21:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=juNxlD0K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F121F00919;
	Sat, 31 Oct 2026 21:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793480537;
	bh=5fxkHaKFyvtCD2WljUtoruCL+yJvIzbtm4B6NbbwJ0s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=juNxlD0K8U4YhL3e3pLpf9RFsDYSpvJRlisSwJNx1/dNA6U/BGGHL/+ROdd06PiR6
	 1eFzms3bMXQ66iuI1p97ci622i3GqZgr4Vh6FFSzwHsZ99VWICcRBFlx/MyVULyabB
	 iuc61Ujho4b9gByiDaBW9JetVAD1OcbYQ7Dd2MbPDnWnSYrhowZ0NXvipcSp3iZyUK
	 V0DLWB7ijzo/o0D9GrGrmSEynv4buW7WFWkYukksFASsngmulYUtyfG9c9avCiPQNZ
	 hcZNym5dmGvwfzeqljgiv//Mtfx1o5zMMVgx9H5GKK14zwyzp1pnRPlzKqplbaB4n5
	 el4MP/nL+aZSw==
Message-ID: <sashiko-outbox-192145@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 18/23] net: hpe: ss1: add the link layer glue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Doug Ledford" <doug.ledford@hpe.com>, "Slingshot Open Source Team" <slingshot-os-team@groups.ext.hpe.com>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Richard
 Cochran" <richardcochran@gmail.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Guenter
 Roeck" <linux@roeck-us.net>
Cc: linux-kbuild@vger.kernel.org, "Sandeep Bhoot" <sandeep.bhoot@hpe.com>, "Mamila
 Santosh" <santosh-kumar.mamila@hpe.com>
In-Reply-To: <20261030-cxi-netdev-submission-v1-18-8c2c391cc283@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030-cxi-netdev-submission-v1-18-8c2c391cc283@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 21:02:16 +0000
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
- [High] net: hpe: ss1: mismatched PHY state and link events in SBL and SL
- [High] net: hpe: ss1: missing STARTING/STOPPING states in cass_sl_link_up=
()
- [High] net: hpe: ss1: broken SerDes match masks in cass_sbl_serdes_config=
_defaults()
- [High] net: hpe: ss1: IRQ deadlock on hw->port->lock via cass_sbl_async_a=
lert()
- [High] net: hpe: ss1: cass_sl_link_down() returns -EBUSY on -EALREADY
- [High] net: hpe: ss1: link_state and step_complete races in cass_sl_link_=
up/down()
- [Medium] net: hpe: ss1: cass_sbl_reset() uses wrong lock for port state u=
pdates
- [Medium] net: hpe: ss1: cass_sbl_mode_set() ignores link_info->speed
- [Medium] net: hpe: ss1: cass_sl_init() passes monotonic cxi_num to sl_lde=
v_new()
- [Medium] net: hpe: ss1: cass_sl_dt_info_get() omits default RX lane mappi=
ng
- [Medium] net: hpe: ss1: unserialized shared DMA buffer copy in cass_sl_dm=
ac_xfer()
- [Medium] net: hpe: ss1: unlocked concurrent access to cass_dev->sl config=
 structs
- [Medium] net: hpe: ss1: cass_sl_mode_set() overwrites saved autoneg/LT on=
 loopback
- [Medium] net: hpe: ss1: uninitialized read data and -1 return in cass_sl_=
pmi_rd()
- [Medium] net: hpe: ss1: inconsistent PML recovery state and polarity in S=
BL and SL
- [Low] net: hpe: ss1: undocumented module parameters in cass_sbl.c and cas=
s_sl.c
--

commit bde39545549e590832e0ff7bfa02d02603cda726
Author: Doug Ledford <doug.ledford@hpe.com>

net: hpe: ss1: add the link layer glue

This commit adds the glue layer connecting the Cassini core driver with the
SBL and SL link layers, along with PHY state machine and port helper
functions.

> diff --git a/drivers/net/ethernet/hpe/ss1/cass_sbl.c b/drivers/net/ethern=
et/hpe/ss1/cass_sbl.c
> new file mode 100644
> index 0000000000000..3b39e917fd5a4
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/ss1/cass_sbl.c
> @@ -0,0 +1,1706 @@

[ ... ]

> +static unsigned int pml_rec_timeout =3D SBL_DFLT_PML_REC_TIMEOUT;
> +module_param(pml_rec_timeout, uint, 0644);
> +MODULE_PARM_DESC(pml_rec_timeout, "PML recovery timeout in ms");
> +
> +static unsigned int pml_rec_rl_max_dur =3D SBL_DFLT_PML_REC_RL_MAX_DURAT=
ION;
> +module_param(pml_rec_rl_max_dur, uint, 0644);
> +MODULE_PARM_DESC(pml_rec_rl_max_dur, "PML recovery max time in ms per wi=
ndow");
> +
> +static unsigned int pml_rec_rl_win_size =3D SBL_DFLT_PML_REC_RL_WINDOW_S=
IZE;
> +module_param(pml_rec_rl_win_size, uint, 0644);
> +MODULE_PARM_DESC(pml_rec_rl_win_size, "PML recovery rate limiter window =
in ms");

[Severity: Low]
Should these new module parameters in cass_sbl.c (pml_rec_timeout,
pml_rec_rl_max_dur, and pml_rec_rl_win_size), as well as the corresponding
ones in cass_sl.c (cass_sl_pml_rec_timeout_ms,
cass_sl_pml_rec_rate_limit_max_time_ms, and
cass_sl_pml_rec_rate_limit_win_size_ms), be documented in
Documentation/admin-guide/kernel-parameters.txt?

[ ... ]

> +void cass_sbl_mode_set(struct cass_dev *hw, const struct cxi_link_info *=
link_info)
> +{
> +	struct cass_link_attr attrs =3D hw->port->lattr;
> +
> +	switch (link_info->flags & LOOPBACK_MODE) {
> +	case 0:
> +		attrs.bl.loopback_mode =3D SBL_LOOPBACK_MODE_OFF;
> +		break;
> +	case CXI_ETH_PF_INTERNAL_LOOPBACK:
> +		attrs.bl.loopback_mode =3D SBL_LOOPBACK_MODE_LOCAL;
> +		break;
> +	case CXI_ETH_PF_EXTERNAL_LOOPBACK:
> +		attrs.bl.loopback_mode =3D SBL_LOOPBACK_MODE_REMOTE;
> +		break;
> +	default:
> +		/* Invalid configuration, no change */
> +		break;
> +	}
> +
> +	if (link_info->flags & CXI_ETH_PF_LLR)
> +		attrs.bl.llr_mode =3D SBL_LLR_MODE_ON;
> +	else
> +		attrs.bl.llr_mode =3D SBL_LLR_MODE_OFF;
> +
> +	if (link_info->flags & CXI_ETH_PF_PRECODING)
> +		attrs.bl.precoding =3D SBL_PRECODING_ON;
> +	else
> +		attrs.bl.precoding =3D SBL_PRECODING_OFF;
> +
> +	if (link_info->flags & CXI_ETH_PF_IFG_HPC)
> +		attrs.bl.ifg_config =3D SBL_IFG_CONFIG_HPC;
> +	else
> +		attrs.bl.ifg_config =3D SBL_IFG_CONFIG_IEEE_200G;
> +
> +	if (link_info->flags & CXI_ETH_PF_PML_REC)
> +		attrs.bl.options |=3D SBL_DISABLE_PML_RECOVERY;
> +	else
> +		attrs.bl.options &=3D ~SBL_DISABLE_PML_RECOVERY;
> +
> +	if (attrs.mattr.media !=3D SBL_LINK_MEDIA_OPTICAL) {
> +		if (link_info->autoneg =3D=3D AUTONEG_DISABLE)
> +			attrs.bl.pec.an_mode =3D SBL_AN_MODE_OFF;
> +		else
> +			attrs.bl.pec.an_mode =3D SBL_AN_MODE_ON;
> +	}
> +
> +	if (!cass_sbl_link_attr_cmp(hw, &attrs))
> +		hw->link_config_dirty =3D false;
> +	else
> +		hw->link_config_dirty =3D true;
> +
> +	if (hw->link_config_dirty) {
> +		hw->port->lattr =3D attrs;
> +		/* Bounce the link to apply the new config */
> +		cass_phy_bounce(hw);
> +	}
> +}

[Severity: Medium]
Should cass_sbl_mode_set() also update attrs.bl.link_mode from
link_info->speed using cass_sbl_link_speed_to_mode()?

When cxi_set_link_ksettings() calls cxi_link_mode_set() with a new
link_info.speed, cass_sbl_mode_set() never checks link_info->speed, leaving
requested link speed changes ignored and cass_sbl_link_speed_to_mode() unus=
ed.

> +
> +void cass_sbl_pml_recovery_set(struct cass_dev *hw, bool set)
> +{
> +	sbl_disable_pml_recovery(hw->sbl, 0, set);
> +}

[ ... ]

> +static void cass_sbl_async_alert(void *accessor, int port_num, int alert=
_type,
> +				 void *alert_data, int size)
> +{
> +	struct cass_dev *hw =3D (struct cass_dev *)accessor;
> +	int down_origin;
> +
> +	cxidev_dbg(&hw->cdev, "(sbl): %s alert", sbl_async_alert_str(alert_type=
));
> +
> +	switch (alert_type) {
> +	case SBL_ASYNC_ALERT_LINK_DOWN:
> +		cxidev_warn(&hw->cdev, "(sbl): %d: link down alert\n",
> +			    port_num);
> +		down_origin =3D (int)(uintptr_t)alert_data;
> +		cass_sbl_link_down_async_handler(hw, port_num, down_origin);
> +		break;

[Severity: High]
Can this cause a spinlock deadlock on hw->port->lock when called from the S=
BL
PML recovery timer?

In sbl_pml_recovery_init(), recovery->timer is set up with TIMER_IRQSAFE and
calls:

  sbl_pml_recovery_monitor_fallback_timer()
    -> sbl_pml_link_down_async_alert()
      -> sbl_async_alert()
        -> cass_sbl_async_alert()
          -> cass_sbl_link_down_async_handler()
            -> cass_link_async_down()

cass_link_async_down() and its callees (cass_lmon_get_dirn(),
cass_link_get_down_origin(), and cass_lmon_request_down()) acquire
hw->port->lock using plain spin_lock(). Because process-context callers such
as cass_link_get_state(), cass_link_set_state(), cass_link_async_down_wait(=
),
and cass_link_sysfs_sprint() also acquire hw->port->lock with plain
spin_lock() without disabling interrupts or softirqs, if recovery->timer
fires on a CPU already holding hw->port->lock, the timer handler will spin
forever on the same lock (and under PREEMPT_RT, acquiring a sleeping
spinlock_t from a TIMER_IRQSAFE handler is invalid).

[ ... ]

> +int cass_sbl_power_on(struct cass_dev *hw)
> +{

[ ... ]

> +	atomic_inc(&hw->sbl_counters[link_up]);
> +
> +	/* report success */
> +out:
> +	cass_link_set_state(hw, CASS_LINK_STATUS_UP, 0);
> +	cass_phy_link_up(hw);
> +
> +	hw->port->start_time =3D ktime_get_seconds();
> +
> +	return 0;

[ ... ]

> +static int cass_sbl_serdes_config_defaults(struct cass_dev *hw)
> +{
> +	struct sbl_sc_values vals =3D { 0 };
> +	int rc, err;
> +
> +	/* CONFIG 1: 200G and 100G PEC to switch */
> +	u64 port_mask =3D 0x1;
> +	u8  serdes_mask =3D 0xf;
> +	u64 tp_state_mask0 =3D sbl_create_tp_hash0((u8)CASS_SBL_SC_MASKED_IN,
> +						 (u8)CASS_SBL_SC_MASKED_IN,
> +						 (u8)CASS_SBL_SC_MASKED_OUT,
> +						 (u8)CASS_SBL_SC_MASKED_OUT,
> +						 (u8)CASS_SBL_SC_MASKED_IN,
> +						 (u16)CASS_SBL_SC_MASKED_OUT);
> +	u64 tp_state_mask1 =3D sbl_create_tp_hash1(CASS_SBL_SC_MASKED_IN);
> +	u64 tp_state_match0 =3D sbl_create_tp_hash0(CASS_SBL_SC_LP_SWITCH,
> +						 CASS_SBL_SC_LBM_ANY,
> +						 CASS_SBL_SC_NA,
> +						 CASS_SBL_SC_NA,
> +						 CASS_SBL_SC_MT_ELEC,
> +						 CASS_SBL_SC_NA);
> +	u64 tp_state_match1 =3D sbl_create_tp_hash1(CASS_SBL_SC_NA);

[ ... ]

> +	// CONFIG 2: 100G AOC to switch
> +	// All the same mask/match params, save for the following:
> +	tp_state_match0 =3D sbl_create_tp_hash0((u8)CASS_SBL_SC_LP_SWITCH,
> +					      (u8)CASS_SBL_SC_LBM_ANY,
> +					      (u8)CASS_SBL_SC_NA,
> +					      (u8)CASS_SBL_SC_LM_100,
> +					      (u8)CASS_SBL_SC_MT_OPT_ANY,
> +					      (u16)CASS_SBL_SC_NA);

[ ... ]

> +	err =3D sbl_serdes_add_config(hw->sbl, tp_state_mask0, tp_state_mask1,
> +				    tp_state_match0, tp_state_match1, port_mask,
> +				   serdes_mask, &vals, false);
> +	if ((err =3D=3D 0) || (err =3D=3D -EEXIST))
> +		rc +=3D 0;
> +	else
> +		rc +=3D err;
> +
> +	// CONFIG 3: 200G AOC to switch
> +	// All the same mask/match params, save for the following:
> +	tp_state_match0 =3D sbl_create_tp_hash0((u8)CASS_SBL_SC_LP_SWITCH,
> +					      (u8)CASS_SBL_SC_LBM_ANY,
> +					      (u8)CASS_SBL_SC_NA,
> +					      (u8)CASS_SBL_SC_LM_200,
> +					      (u8)CASS_SBL_SC_MT_OPT_ANY,
> +					      (u16)CASS_SBL_SC_NA);

[ ... ]

> +	err =3D sbl_serdes_add_config(hw->sbl, tp_state_mask0, tp_state_mask1,
> +				    tp_state_match0, tp_state_match1, port_mask,
> +				   serdes_mask, &vals, false);
> +	if ((err =3D=3D 0) || (err =3D=3D -EEXIST))
> +		rc +=3D 0;
> +	else
> +		rc +=3D err;
> +
> +	if (rc)
> +		cxidev_err(&hw->cdev, "Failed to update SBL config [%d]\n", rc);
> +	return rc;
> +}

[Severity: High]
Are the state masks in cass_sbl_serdes_config_defaults() inverted or missing
fields?

First, tp_state_mask1 is set to sbl_create_tp_hash1(CASS_SBL_SC_MASKED_IN)
(~0ULL) while tp_state_match1 is sbl_create_tp_hash1(CASS_SBL_SC_NA) (0). In
sbl_get_serdes_config_values(), an entry matches hash1 only when:

  (((sc->tp_state_mask1 & hash1) & ~(sc->tp_state_mask1 & sc->tp_state_matc=
h1)) =3D=3D 0)

With tp_state_mask1 =3D ~0ULL and tp_state_match1 =3D 0, this requires hash1
(which is sbl->link[port_num].mattr.len) to be 0, preventing any cable with=
 a
non-zero length from matching any of the three configs. Should tp_state_mas=
k1
use CASS_SBL_SC_MASKED_OUT instead?

Second, CONFIG 2 (CASS_SBL_SC_LM_100) and CONFIG 3 (CASS_SBL_SC_LM_200) mat=
ch
on link_mode in tp_state_match0, but reuse tp_state_mask0 from CONFIG 1 whe=
re
the 4th argument (link_mode_mask) is CASS_SBL_SC_MASKED_OUT. Because
link_mode is masked out, sbl_get_serdes_config_values() ignores link_mode a=
nd
CONFIG 3 (inserted at the head of serdes_config_list after CONFIG 2) always
shadows CONFIG 2.

Finally, accumulating errors via rc +=3D err sums negative errno values if =
more
than one sbl_serdes_add_config() call fails, returning a corrupted error co=
de.

[ ... ]

> +int cass_sbl_reset(struct cass_dev *hw)
> +{
> +	int bl_state;
> +	int err;
> +
> +	cxidev_dbg(&hw->cdev, "link: reset (from %s)\n",
> +		   cass_link_state_str(cass_link_get_state(hw)));
> +
> +	atomic_inc(&hw->sbl_counters[link_reset_tries]);
> +
> +	cass_link_set_state(hw, CASS_LINK_STATUS_RESETTING, 0);
> +
> +	/* reset the base link */
> +	sbl_base_link_get_status(hw->sbl, 0, &bl_state, NULL, NULL, NULL,
> +				 NULL, NULL);
> +
> +	if (bl_state !=3D SBL_BASE_LINK_STATUS_UNCONFIGURED) {
> +		err =3D sbl_base_link_reset(hw->sbl, 0);
> +		if (err)
> +			cxidev_err(&hw->cdev,
> +				   "link: reset, base link reset failed [%d]\n",
> +				   err);
> +	}
> +
> +	spin_lock(&hw->sbl_state_lock);
> +	hw->port->prev_lstate =3D hw->port->lstate;
> +	hw->port->lstate =3D CASS_LINK_STATUS_UNCONFIGURED;
> +	hw->port->lerr =3D 0;
> +	hw->port->config_state &=3D ~CASS_LINK_CONFIGURED;
> +	spin_unlock(&hw->sbl_state_lock);

[Severity: Medium]
Should cass_sbl_reset() acquire hw->port->lock (or call cass_link_set_state=
())
instead of hw->sbl_state_lock here?

Every other reader and writer of hw->port->lstate, hw->port->prev_lstate, a=
nd
hw->port->lerr (including cass_link_set_state() earlier in cass_sbl_reset())
synchronizes on hw->port->lock, while hw->sbl_state_lock is not used anywhe=
re
else in the driver.

[ ... ]

> diff --git a/drivers/net/ethernet/hpe/ss1/cass_sl.c b/drivers/net/etherne=
t/hpe/ss1/cass_sl.c
> new file mode 100644
> index 0000000000000..72c8724a33276
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/ss1/cass_sl.c
> @@ -0,0 +1,1524 @@

[ ... ]

> +void cass_sl_mode_set(struct cass_dev *cass_dev, const struct cxi_link_i=
nfo *link_info)
> +{

[ ... ]

> +	/* loopback */
> +	cxidev_dbg(&cass_dev->cdev, "sl mode set (loopback_mode =3D %lu)\n",
> +		   link_info->flags & LOOPBACK_MODE);
> +	switch (link_info->flags & LOOPBACK_MODE) {
> +	case 0:
> +		if (!(lgrp_config->options & SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE=
) &&
> +		    !(link_config->options & SL_LINK_CONFIG_OPT_REMOTE_LOOPBACK_ENABLE=
))
> +			break;
> +		cxidev_dbg(&cass_dev->cdev, "sl mode set loopback to off\n");
> +		lgrp_config->options &=3D ~SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE;
> +		link_config->options &=3D ~SL_LINK_CONFIG_OPT_REMOTE_LOOPBACK_ENABLE;
> +		if (cass_dev->sl.old_an_mode =3D=3D AUTONEG_ENABLE)
> +			cass_sl_mode_set_autoneg_enable(cass_dev);
> +		else
> +			cass_sl_mode_set_autoneg_disable(cass_dev);
> +		if (cass_dev->sl.old_lt_mode)
> +			link_config->hpe_map |=3D SL_LINK_CONFIG_HPE_LINKTRAIN;
> +		else
> +			link_config->hpe_map &=3D ~SL_LINK_CONFIG_HPE_LINKTRAIN;
> +		is_mode_changed =3D true;
> +		break;
> +	case CXI_ETH_PF_INTERNAL_LOOPBACK:
> +		if (lgrp_config->options & SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE)
> +			break;
> +		cxidev_dbg(&cass_dev->cdev, "sl mode set serdes loopback to on\n");
> +		lgrp_config->options |=3D SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE;
> +		cass_sl_mode_set_autoneg_disable(cass_dev);
> +		link_config->options &=3D ~SL_LINK_CONFIG_OPT_REMOTE_LOOPBACK_ENABLE;
> +		cass_dev->sl.old_an_mode =3D link_info->autoneg;
> +		cass_dev->sl.old_lt_mode =3D (link_config->hpe_map & SL_LINK_CONFIG_HP=
E_LINKTRAIN);
> +		link_config->hpe_map &=3D ~SL_LINK_CONFIG_HPE_LINKTRAIN;
> +		is_mode_changed =3D true;
> +		break;
> +	case CXI_ETH_PF_EXTERNAL_LOOPBACK:
> +		if (link_config->options & SL_LINK_CONFIG_OPT_REMOTE_LOOPBACK_ENABLE)
> +			break;
> +		cxidev_dbg(&cass_dev->cdev, "sl mode set remote loopback to on\n");
> +		link_config->options |=3D SL_LINK_CONFIG_OPT_REMOTE_LOOPBACK_ENABLE;
> +		cass_sl_mode_set_autoneg_disable(cass_dev);
> +		lgrp_config->options &=3D ~SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE;
> +		cass_dev->sl.old_an_mode =3D link_info->autoneg;
> +		cass_dev->sl.old_lt_mode =3D (link_config->hpe_map & SL_LINK_CONFIG_HP=
E_LINKTRAIN);
> +		link_config->hpe_map &=3D ~SL_LINK_CONFIG_HPE_LINKTRAIN;
> +		is_mode_changed =3D true;
> +		break;
> +	}

[Severity: Medium]
If a user switches directly from internal loopback to external loopback (or
vice versa) without turning loopback off first, won't this overwrite
cass_dev->sl.old_an_mode and cass_dev->sl.old_lt_mode with the
loopback-disabled values (AUTONEG_DISABLE and 0), preventing case 0 from
restoring the original autonegotiation and link-training settings when
loopback is later disabled?

[ ... ]

> +void cass_sl_pml_recovery_set(struct cass_dev *cass_dev, bool set)
> +{
> +	cxidev_dbg(&cass_dev->cdev, "pml recovery set\n");
> +
> +	if (set)
> +		cass_dev->sl.link_config.options |=3D SL_LINK_CONFIG_OPT_PML_REC_ENABL=
E;
> +	else
> +		cass_dev->sl.link_config.options &=3D ~SL_LINK_CONFIG_OPT_PML_REC_ENAB=
LE;
> +}

[Severity: Medium]
How are PML recovery state and polarity meant to work across SBL and SL?

1. In cass_sbl_pml_recovery_set(), passing set =3D=3D true calls
sbl_disable_pml_recovery(hw->sbl, 0, true), which disables PML recovery
(without updating hw->port->lattr.bl.options). In cass_sl_pml_recovery_set(=
),
passing set =3D=3D true sets SL_LINK_CONFIG_OPT_PML_REC_ENABLE, which enabl=
es PML
recovery. Both implement the exported cxi_pml_recovery_set() API with oppos=
ite
boolean semantics.

2. In cass_sl_config_init(), SL_LINK_CONFIG_OPT_PML_REC_ENABLE is set by
default, but cass_sl_mode_get() never sets CXI_ETH_PF_PML_REC in
link_info->flags, and cass_sl_mode_set() never handles CXI_ETH_PF_PML_REC. =
As
a result, ethtool private flags always report pml-recovery as off on Cassin=
i 2,
and attempting to disable it via ethtool sees no flag change.

3. Neither cass_sl_pml_recovery_set() nor cass_sl_mode_set() calls
sl_link_config_set() or bounces the link when toggling PML recovery, so cha=
nges
to cass_dev->sl.link_config.options are not applied to an active SL link.

[ ... ]

> +static int cass_sl_dt_info_get(void *dt_accessor, u8 ldev_num, u8 lgrp_n=
um,
> +			       struct sl_dt_lgrp_info *info)
> +{

[ ... ]

> +	default:  /* straight */
> +		info->lane_info[3].tx_source =3D 3;
> +		info->lane_info[3].tx_invert =3D 0;
> +		info->lane_info[2].tx_source =3D 2;
> +		info->lane_info[2].tx_invert =3D 0;
> +		info->lane_info[1].tx_source =3D 1;
> +		info->lane_info[1].tx_invert =3D 0;
> +		info->lane_info[0].tx_source =3D 0;
> +		info->lane_info[0].tx_invert =3D 0;
> +		break;
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
In the default straight-mapping case of cass_sl_dt_info_get(), should
rx_source and rx_invert also be initialized for info->lane_info[0..3]?

Without initializing rx_source in the default branch,
sl_core_data_lgrp_new() and sl_core_hw_serdes_swizzles() leave all four RX
lanes mapped to physical lane 0 (or with stale values after SerDes loopback=
).

[ ... ]

> +static int cass_sl_dmac_xfer(void *dmac_accessor, void *data)
> +{
> +	int              rtn;
> +	struct cass_dev *cass_dev =3D dmac_accessor;
> +
> +	cxidev_dbg(&cass_dev->cdev, "sl dmac xfer\n");
> +
> +	rtn =3D cxi_dmac_xfer(&cass_dev->cdev, cass_dev->sl.fec.dma_id);
> +	if (rtn) {
> +		cxidev_err(&cass_dev->cdev, "Unable to get fec cntrs [%d]\n", rtn);
> +		return rtn;
> +	}
> +
> +	memcpy(data, cass_dev->sl.fec.cntrs, cass_dev->sl.fec.cntrs_size);
> +
> +	return 0;
> +}

[Severity: Medium]
Can concurrent callers of cass_sl_dmac_xfer() race on the shared DMA buffer
cass_dev->sl.fec.cntrs?

cxi_dmac_xfer() releases hw->dmac.lock before returning, so if a sysfs FEC
counter read (such as ccw_show() or ucw_show()) and the periodic FEC monitor
work item call sl_core_hw_fec_dmac_xfer() -> cass_sl_dmac_xfer() concurrent=
ly,
a second DMA transfer into cass_dev->sl.fec.cntrs can overwrite the buffer
while the first caller is still running memcpy().

[ ... ]

> +static void cass_sl_callback(void *tag, struct sl_lgrp_notif_msg *msg)
> +{
> +	struct cass_dev *cass_dev =3D tag;
> +
> +	cxidev_dbg(&cass_dev->cdev, "callback (type =3D 0x%X)\n", msg->type);
> +
> +	switch (msg->type) {
> +	case SL_LGRP_NOTIF_MEDIA_PRESENT:
> +		cass_dev->sl.media_attr =3D msg->info.media_attr;
> +		if (msg->info.media_attr.type & SL_MEDIA_TYPE_ACTIVE) {
> +			cass_dev->sl.link_config.hpe_map &=3D ~SL_LINK_CONFIG_HPE_LINKTRAIN;
> +			cass_sl_mode_set_autoneg_disable(cass_dev);
> +		} else {
> +			cass_dev->sl.link_config.hpe_map |=3D SL_LINK_CONFIG_HPE_LINKTRAIN;
> +			cass_sl_mode_set_autoneg_enable(cass_dev);
> +		}
> +		cass_dev->sl.has_cable =3D true;
> +		break;
> +	case SL_LGRP_NOTIF_MEDIA_NOT_PRESENT:
> +		memset(&cass_dev->sl.media_attr, 0, sizeof(cass_dev->sl.media_attr));
> +		cass_dev->sl.has_cable =3D false;
> +		break;

[Severity: Medium]
What serializes access to cass_dev->sl.link_config, cass_dev->sl.lgrp_confi=
g,
cass_dev->sl.link_policy, and cass_dev->sl.media_attr?

cass_sl_callback() runs on SL's notification workqueue and updates
media_attr, link_config.hpe_map, link_config.options, and
lgrp_config.tech_map without locking, while cass_sl_mode_set(),
cass_sl_mode_get(), cass_sl_pml_recovery_set(), the debugfs handlers in
cxi_link.c, and cass_sl_link_up() concurrently read and modify those same
fields.

[ ... ]

> +int cass_sl_init(struct cass_dev *cass_dev)
> +{

[ ... ]

> +	cass_dev->sl.ldev =3D sl_ldev_new(cass_dev->cdev.cxi_num,
> +					NULL, &(cass_dev->sl.ldev_config));
> +	if (IS_ERR(cass_dev->sl.ldev)) {
> +		rtn =3D PTR_ERR(cass_dev->sl.ldev);
> +		cxidev_err(&cass_dev->cdev, "sl_ldev_new failed [%d]\n", rtn);
> +		goto out_kobject_put_port_num;
> +	}

[Severity: Medium]
Can passing cass_dev->cdev.cxi_num as ldev_num to sl_ldev_new() cause probe
failures after 16 device probes?

In cass_probe(), hw->cdev.cxi_num is assigned via atomic_inc_return(&cxi_nu=
m)
for every PF and VF probe and is never decremented or recycled. However,
sl_ldev_new() requires ldev_num < SL_ASIC_MAX_LDEVS (16) and returns -EINVAL
once cxi_num reaches 16 (for example, after enabling SR-IOV VFs or unbinding
and rebinding PFs).

[ ... ]

> +int cass_sl_link_up(struct cass_dev *cass_dev)
> +{
> +	int          rtn;
> +	unsigned int timeleft;
> +
> +	cxidev_dbg(&cass_dev->cdev, "sl link up\n");
> +
> +	if (!cass_dev->sl.has_cable)
> +		return 0;
> +
> +	if (cass_dev->sl.is_canceled)
> +		return 0;
> +
> +	/* initial delay between attempts */
> +	msleep(1000);
> +
> +	cass_dev->sl.link_state       =3D SL_LINK_STATE_DOWN;
> +	cass_dev->sl.llr_state        =3D SL_LLR_STATE_OFF;
> +	cass_dev->sl.link_up_mode     =3D 0;
> +	cass_dev->sl.link_up_fec_type =3D 0;

[Severity: High]
Should cass_sl_link_up() transition hw->port->lstate to
CASS_LINK_STATUS_STARTING before sleeping, and should cass_sl_link_down() s=
et
CASS_LINK_STATUS_STOPPING (matching cass_sbl_power_on() and
cass_sbl_power_off())?

Because cass_sl_link_up() leaves hw->port->lstate at CASS_LINK_STATUS_DOWN
throughout link bring-up (which can sleep for tens of seconds across
msleep(1000), sl_ldev_serdes_init(), sl_link_up(), sl_llr_setup(), and
sl_llr_start()), any concurrent caller of cass_link_async_down_wait() (such=
 as
cass_phy_stop(hw, true) during cass_phy_bounce() or cass_remove(), or
cass_link_headshell_down_no_media() on cable removal) or
cass_lmon_request_down() sees hw->port->lstate =3D=3D CASS_LINK_STATUS_DOWN=
 and
returns 0 immediately while cass_sl_link_up() is still running on the lmon
kthread.

[ ... ]

> +	if (cass_dev->sl.is_canceled)
> +		goto out_llr_stop;
> +
> +	cass_link_set_state(cass_dev, CASS_LINK_STATUS_UP, 0);
> +
> +	return 0;
> +
> +out_llr_stop:
> +	sl_llr_stop(cass_dev->sl.llr);
> +	/* need to stop twice to make sure both setup and start are stopped */
> +	sl_llr_stop(cass_dev->sl.llr);
> +
> +out_mac_rx_stop:
> +	sl_mac_rx_stop(cass_dev->sl.mac);
> +
> +out_mac_tx_stop:
> +	sl_mac_tx_stop(cass_dev->sl.mac);
> +
> +out_link_down:
> +	reinit_completion(&(cass_dev->sl.step_complete));
> +	rtn =3D sl_link_down(cass_dev->sl.link);
> +	switch (rtn) {
> +	case -EALREADY:
> +		break;
> +	case -EINPROGRESS:
> +		msleep(500);
> +		break;
> +	case 0:
> +		timeleft =3D wait_for_completion_timeout(&(cass_dev->sl.step_complete),
> +			msecs_to_jiffies(2 * CASS_SL_LINK_DOWN_TIMEOUT_MS));
> +		if (timeleft =3D=3D 0)
> +			cxidev_dbg(&cass_dev->cdev, "sl_link_down (link_up) timeout\n");
> +		break;
> +	default:
> +		cxidev_warn(&cass_dev->cdev, "sl_link_down (link_up) failed [%d]\n", r=
tn);
> +		break;
> +	}
> +
> +out_no_link:
> +
> +	return -ENOLINK;
> +}
> +
> +int cass_sl_link_down(struct cass_dev *cass_dev)
> +{

[ ... ]

> +	/* down link */
> +	if (cass_dev->sl.link_state !=3D SL_LINK_STATE_DOWN) {
> +		reinit_completion(&(cass_dev->sl.step_complete));
> +		rtn =3D sl_link_down(cass_dev->sl.link);
> +		switch (rtn) {
> +		case -EALREADY:
> +			break;
> +		case -EINPROGRESS:
> +		case 0:
> +			timeleft =3D wait_for_completion_timeout(&(cass_dev->sl.step_complete=
),
> +				msecs_to_jiffies(2 * CASS_SL_LINK_DOWN_TIMEOUT_MS));
> +			if (timeleft =3D=3D 0) {
> +				cxidev_err(&cass_dev->cdev,
> +					   "sl_link_down (link_down) timed out\n");
> +				return -ETIMEDOUT;
> +			}
> +			break;
> +		default:
> +			cxidev_warn(&cass_dev->cdev, "sl_link_down (link_down) failed [%d]\n"=
, rtn);
> +			return rtn;
> +		}
> +		if (cass_dev->sl.link_state !=3D SL_LINK_STATE_DOWN)
> +			return -EBUSY;
> +	}
> +
> +	if (err)
> +		return err;
> +
> +	cass_link_set_state(cass_dev, CASS_LINK_STATUS_DOWN, 0);
> +
> +	return 0;
> +}

[Severity: High]
Won't cass_sl_link_down() return -EBUSY whenever sl_link_down() returns
-EALREADY, causing cass_sl_link_fini() to abort teardown and leak SL and po=
rt
resources?

In cass_sl_init(), memset(&(cass_dev->sl), 0, sizeof(cass_dev->sl)) sets
cass_dev->sl.link_state to 0 (SL_LINK_STATE_INVALID), whereas sl_link_new()
initializes the underlying ctrl_link->state to SL_LINK_STATE_DOWN (1). If no
cable is present (!cass_dev->sl.has_cable), cass_sl_link_up() returns early
before setting cass_dev->sl.link_state =3D SL_LINK_STATE_DOWN.

When cass_sl_link_fini() then calls cass_sl_link_down(),
cass_dev->sl.link_state !=3D SL_LINK_STATE_DOWN (0 !=3D 1) is true, so it c=
alls
sl_link_down(). Because ctrl_link->state is already SL_LINK_STATE_DOWN,
sl_link_down() returns -EALREADY without queuing a notification. The
-EALREADY case breaks out of the switch without setting
cass_dev->sl.link_state =3D SL_LINK_STATE_DOWN, and the check immediately a=
fter
the switch returns -EBUSY, aborting cass_sl_link_fini() and leaking ldev,
lgrp, link, mac, llr, port_num_kobj, port_kobj, and cass_dev->port.

[Severity: High]
Can cass_dev->sl.link_state and cass_dev->sl.step_complete also get out of
sync with SL's asynchronous notifications?

1. When an async link-down or fault occurs in SL, ctrl_link->state is set to
SL_LINK_STATE_DOWN before the notification workqueue runs cass_sl_callback()
to update cass_dev->sl.link_state. If cass_sl_link_down() runs during that
window, cass_dev->sl.link_state is still SL_LINK_STATE_UP, sl_link_down()
returns -EALREADY, and cass_sl_link_down() returns -EBUSY.

2. Conversely, while sl_link_up() is in progress (SL_LINK_STATE_STARTING),
cass_dev->sl.link_state is SL_LINK_STATE_DOWN, so cass_sl_link_down() sees
cass_dev->sl.link_state =3D=3D SL_LINK_STATE_DOWN and skips calling
sl_link_down().

3. Because a single step_complete completion is shared between link
notifications (SL_LGRP_NOTIF_LINK_*) and LLR notifications
(SL_LGRP_NOTIF_LLR_*), and out_link_down in cass_sl_link_up() only sleeps
500ms on -EINPROGRESS instead of waiting for completion, an in-flight
notification from one step can prematurely satisfy wait_for_completion_time=
out()
in a later step.

[Severity: High]
There also appear to be several mismatches between how SBL, SL, and the PHY
state machine handle link up/down events:

1. On Cassini 1 (SBL), cass_sbl_power_on() sets CASS_LINK_STATUS_UP and cal=
ls
cass_phy_link_up(hw) directly while hw->phy.state is still CASS_PHY_NOLINK.
When cass_phy_state_machine() runs its next poll, cass_phy_check_link_statu=
s()
sees hw->phy.state !=3D CASS_PHY_RUNNING, transitions to CASS_PHY_RUNNING, =
and
calls cass_phy_link_up(hw) a second time, emitting a duplicate
CXI_EVENT_LINK_UP.

2. Once hw->phy.state reaches CASS_PHY_RUNNING, cass_phy_state_machine() in
cass_phy.c stops rescheduling hw->phy.state_queue:

	new_state =3D hw->phy.state;
	if (new_state !=3D CASS_PHY_RUNNING)
		cass_phy_queue_locked(hw, HZ);

On Cassini 2 (SL), cass_sl_link_down() only calls cass_link_set_state() and
never calls cass_phy_link_down(). When cass_phy_stop() cancels state_queue =
and
brings the link down, or when the link goes down while state_queue is not
polling, cass_phy_link_down() is never called and CXI_EVENT_LINK_DOWN is ne=
ver
sent.

3. Unlike cass_sbl_power_on(), cass_sl_link_up() does not check if
cass_link_get_state(cass_dev) =3D=3D CASS_LINK_STATUS_UP at entry (so calli=
ng it
when already up resets cass_dev->sl.link_state to SL_LINK_STATE_DOWN, fails
sl_link_up() with -EALREADY, and tears the link down in out_link_down), nor
does it update cass_dev->port->start_time =3D ktime_get_seconds().

[ ... ]

> diff --git a/drivers/net/ethernet/hpe/ss1/cass_sl_io.c b/drivers/net/ethe=
rnet/hpe/ss1/cass_sl_io.c
> new file mode 100644
> index 0000000000000..5eca53cb09691
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/ss1/cass_sl_io.c
> @@ -0,0 +1,368 @@

[ ... ]

> +int cass_sl_sbus_rd(void *sbus_accessor, u32 sbus_addr, u8 reg_addr, u32=
 *rd_data)
> +{

[ ... ]

> +	mutex_lock(&cass_dev->sl.sbus_lock);
> +
> +	rtn =3D cxi_sbus_op(&cass_dev->cdev, &params, rd_data, &result_code, &o=
verrun);
> +	if (rtn !=3D 0) {
> +		cxidev_err(&cass_dev->cdev, "sl sbus rd - cxi_sbus_op failed [%d]\n", =
rtn);
> +		goto out;
> +	}

[ ... ]

> +int cass_sl_pmi_rd(void *pmi_accessor, u8 lgrp_num, u32 addr, u16 *data)
> +{
> +	int                           rtn;
> +	struct cass_dev              *cass_dev =3D pmi_accessor;
> +	int                           x;
> +	union c2_hni_serdes_pmi_ctl   pmi_ctl;
> +	union c2_hni_serdes_pmi_data  pmi_data;
> +
> +	mutex_lock(&cass_dev->sl.pmi_lock);
> +
> +	/* check ready */
> +	for (x =3D 0; x < CASS_SL_PMI_RD_READY_MAX_COUNT; ++x) {
> +		cass_read(cass_dev, C2_HNI_SERDES_PMI_CTL, &pmi_ctl, sizeof(pmi_ctl));
> +		if (!pmi_ctl.pmi_lp_ack)
> +			break;
> +		msleep(CASS_SL_PMI_RD_READY_DELAY_MS);
> +	}
> +	if (x >=3D CASS_SL_PMI_RD_READY_MAX_COUNT) {
> +		cxidev_err(&cass_dev->cdev,
> +			   "sl pmi rd - ready timeout (ctl =3D 0x%016llX)\n", pmi_ctl.qw);
> +		rtn =3D -1;
> +		goto out;
> +	}
> +
> +	/* start */
> +	pmi_ctl.qw          =3D 0ULL;
> +	pmi_ctl.pmi_lp_addr =3D addr;
> +	pmi_ctl.pmi_lp_en   =3D 1;
> +	cxidev_dbg(&cass_dev->cdev, "sl pmi rd - ctrl 0x%016llX -> 0x%08X\n",
> +		   pmi_ctl.qw, C2_HNI_SERDES_PMI_CTL);
> +	cass_write(cass_dev, C2_HNI_SERDES_PMI_CTL, &pmi_ctl, sizeof(pmi_ctl));
> +
> +	/* poll for done */
> +	for (x =3D 0; x < CASS_SL_PMI_RD_MAX_COUNT; ++x) {
> +		cass_read(cass_dev, C2_HNI_SERDES_PMI_CTL, &pmi_ctl, sizeof(pmi_ctl));
> +		cxidev_dbg(&cass_dev->cdev, "sl pmi rd - check #%d 0x%08X =3D 0x%016ll=
X\n",
> +			   x, C2_HNI_SERDES_PMI_CTL, pmi_ctl.qw);
> +		if (pmi_ctl.pmi_lp_error) {
> +			cxidev_err(&cass_dev->cdev, "sl pml rd - error\n");
> +			rtn =3D -1;
> +			goto out;
> +		}
> +		if (pmi_ctl.pmi_lp_ack)
> +			break;
> +		msleep(CASS_SL_PMI_RD_DELAY_MS);
> +	}
> +	if (x >=3D CASS_SL_PMI_RD_MAX_COUNT) {
> +		cxidev_err(&cass_dev->cdev, "sl pmi rd - timeout\n");
> +		rtn =3D -ETIMEDOUT;
> +		goto out;
> +	}
> +
> +	/* check valid */
> +	if (!pmi_ctl.pmi_lp_read_vld) {
> +		cxidev_err(&cass_dev->cdev, "sl pmi rd - data not valid\n");
> +		rtn =3D -1;
> +		goto out;
> +	}

[Severity: Medium]
When cass_sl_pmi_rd() or cass_sl_sbus_rd() fails and jumps to out without
initializing *data or *rd_data, can uninitialized kernel stack memory be
exposed via sysfs and trace logs?

Callers such as sl_core_hw_serdes_lane_pre1_get() pass uninitialized stack
variables into SL_CORE_HW_PMI_RD() -> pmi_rd() -> sl_core_pmi_rd() ->
cass_sl_pmi_op() -> cass_sl_pmi_rd() and SL_CORE_HW_SBUS_FIELD_RD() ->
sbus_field_rd() -> sl_core_sbus_rd() -> cass_sl_sbus_op() ->
cass_sl_sbus_rd(). On error, sl_core_pmi_rd(), pmi_rd(), sl_core_sbus_rd(),
sbus_rd(), and sbus_field_rd() still dereference *data, log it, and store it
into core_lgrp->pmi.rd.data and core_lgrp->sbus.rd.data, which are readable=
 by
unprivileged users via 0444 sysfs attributes.

Also, in cass_sl_pmi_rd() and cass_sl_pmi_wr(), should the ready-timeout,
pmi_lp_error, and !pmi_lp_read_vld error paths return standard negative err=
no
codes (-ETIMEDOUT / -EIO) instead of -1 (-EPERM)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-cxi-netdev=
-submission-v1-0-8c2c391cc283@hpe.com?part=3D18
