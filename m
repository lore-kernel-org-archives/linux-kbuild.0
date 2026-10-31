Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480530;
	b=zIWJ1831q27wokp+U5BwTYl320wnoLgW/OxY823g65RPnKGZ7NaRQ+44ObzOVmiM9wCQ
	 9EKxaPIGl5tk96qe/hzXfPl22t4NRTFG9pbRfH3RaPg8D8SLsBrQcPNdk/exrUVCOY4J7
	 oza4c3lQ2B52i50G2B+zT/dTP1Y9IuCsuiInhlNye8knShr9XjhS6opjKzlPMQpCVuHB5
	 5D+Rec7WjwBAeGEPMA8uD+ca5jXMp0b02IgAanF2coFgPkxIMczcHP4FTXH0zO5MrGZM4
	 JnlFLn9Lwvz9mettE+dOSWni9Xo4TnF8WjYIR00mF2YMrRUWHv1619q8N2MnOK/wAEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480530;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pmkDCsPt+cdn74gAS1ddtJZfeNe2/9+z7SjQ2HUqATQ=;
	b=NAOosLKDpDzxVgHWr2xfZQ05WKriU4psWinYwvJKsM34WwJzq+AJGK6Un/AKAFS5IcDp
	 gWX4HvKRaFr0I5buVjCq6FqQ6i5qphC6gMFeLhLvxAaabF+4OD/PfbpMsbLN3bgQtrqgY
	 eqFKvBVYUh+uCIpd4eJI0snF0M88VEAo4trcG5rkURrSCAR937JkWKk4CXzLC1rSj9bmJ
	 UPu4D7qzDnwDjqbXby+gajnu9KgTW+IC7LRokqJglTwUIJmXheJXpWTEkLIVmYO3Dxd2V
	 jItmeZ94lIfPW6P1X0hOCPRguAk0oHxGoOzytu+bkspZ10Df3UE3t11q/uNC5HkC3EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B3vf+dM+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6B7606A31C
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 21:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B3vf+dM+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 647311F000C1;
	Sat, 31 Oct 2026 21:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793480529;
	bh=pmkDCsPt+cdn74gAS1ddtJZfeNe2/9+z7SjQ2HUqATQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B3vf+dM+jpGPHeb0xWT3gr9tDNjyUNILukGNVcMjXOGGlGsLq7n+GBLWiqItYcUQ4
	 BCBah/zm+DyiiBiXRJP4cTl17FuLhE2LbIb7KXUKLcr2cVo9GA/Oc7qlT1vo4ZmHdZ
	 LXYcoZxtL+GKHAzKRJvkju4u4ZGd/rKIfeAyuotY49rDWmUIJMr7YfCv5c7337aiMV
	 AVebrSNrF4WaYqyKFP7Qy9+yfZNXyA7rDI+IVFB9e1a5hyn0fhFLI0bvGoS8JYtk3Q
	 F8KO127itNNUdU8+1CjTp83qSNsfyXyAIHH/zwRDSTGn5do8CvTgMF++XhLKCaxphA
	 bZWhqNcq2J8Ig==
Message-ID: <sashiko-outbox-192138@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/23] net: hpe: sbl: add link state management
Reply-To: sashiko-reviews@lists.linux.dev
To: "Doug Ledford" <doug.ledford@hpe.com>, "Slingshot Open Source Team" <slingshot-os-team@groups.ext.hpe.com>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Richard
 Cochran" <richardcochran@gmail.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Guenter
 Roeck" <linux@roeck-us.net>
Cc: linux-kbuild@vger.kernel.org, "Mamila Santosh" <santosh-kumar.mamila@hpe.com>
In-Reply-To: <20261030-cxi-netdev-submission-v1-6-8c2c391cc283@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030-cxi-netdev-submission-v1-6-8c2c391cc283@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 21:02:07 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [High] net: hpe: sbl: broken non-next-page handling in sbl_an_page_exchan=
ge()
- [High] net: hpe: sbl: inconsistent IRQ locking on link->lock
- [Medium] net: hpe: sbl: broken PCS and SerDes error unwind in sbl_base_li=
nk_start()
- [Medium] net: hpe: sbl: missing PML recovery cancel in sbl_link_fault_mon=
itor_start()
- [Medium] net: hpe: sbl: all-port tuning invalidation in sbl_base_link_try=
_start_fail_cleanup()
- [Medium] net: hpe: sbl: stale DOWN state in sbl_base_link_config() withou=
t media
- [Medium] net: hpe: sbl: lost SerDes reset error in sbl_base_link_reset()
- [Medium] net: hpe: sbl: inconsistent link->lock synchronization on link s=
tate and attrs
- [Medium] net: hpe: sbl: unchecked sbl_an_serdes_stop() in sbl_link_autone=
g()
- [Low] net: hpe: sbl: unlocked read of link->blerr in sbl_base_link_stop()
- [Low] net: hpe: sbl: missing %s format in sbl_base_link_loopback_sysfs_sp=
rint()
--

commit 6a4ede20cdb63d19f2857dcbfd73ffcd9b42af61
Author: Doug Ledford <doug.ledford@hpe.com>

net: hpe: sbl: add link state management

This commit adds the Slingshot base link state machine, including link
bring-up, auto-negotiation, and NIC-specific link operations tying the
PML and SerDes layers together.

> diff --git a/drivers/net/ethernet/hpe/sbl/sbl_link.c b/drivers/net/ethern=
et/hpe/sbl/sbl_link.c
> new file mode 100644
> index 0000000000000..706fa9ba9676c
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sbl/sbl_link.c
> @@ -0,0 +1,1739 @@

[ ... ]

> +static int sbl_link_fault_monitor_start(struct sbl_inst *sbl, int port_n=
um)
> +{
> +	int err;
> +	u32 base =3D SBL_PML_BASE(port_num);
> +	u64 val64;
> +	u64 err_flags;
> +
> +	val64 =3D sbl_read64(sbl, base | SBL_PML_CFG_LLR_SM_OFFSET);
> +	if (SBL_PML_CFG_LLR_SM_REPLAY_CT_MAX_GET(val64) < SBL_LLR_REPLAY_CT_MAX=
_UNLIMITED)
> +		err_flags =3D SBL_PML_FAULT_ERR_FLAGS;
> +	else
> +		err_flags =3D SBL_PML_REC_FAULT_ERR_FLAGS;
> +
> +	/* make sure we have not already had an error */
> +	if (sbl_pml_err_flgs_test(sbl, port_num, err_flags)) {
> +		sbl_dev_err(sbl->dev, "fm %d: start - errors already present\n",
> +			    port_num);
> +		err =3D -ENETDOWN;
> +		goto out;
> +	}
> +
> +	sbl_pml_recovery_enable(sbl, port_num);
> +
> +	err =3D sbl_pml_install_intr_handler(sbl, port_num, err_flags);
> +	if (err) {
> +		sbl_dev_err(sbl->dev, "fm %d: intr install failed [%d]\n", port_num, e=
rr);
> +		goto out;
> +	}
> +
> +	err =3D sbl_pml_enable_intr_handler(sbl, port_num, err_flags);
> +	if (err) {
> +		sbl_dev_err(sbl->dev, "fm %d: intr enable failed [%d]\n", port_num, er=
r);
> +		goto out_uninstall;
> +		return err;
> +	}
> +
> +	if (sbl_pml_err_flgs_test(sbl, port_num, err_flags)) {
> +		sbl_dev_err(sbl->dev, "fm %d: link down during start\n", port_num);
> +		err =3D -ENETDOWN;
> +		goto out_disable;
> +	} else {
> +		/* all up and running */
> +		sbl_link_info_set(sbl, port_num, SBL_LINK_INFO_FAULT_MON);
> +	}
> +	return 0;
> +
> +out_disable:
> +	sbl_pml_disable_intr_handler(sbl, port_num, err_flags);
> +out_uninstall:
> +	sbl_pml_remove_intr_handler(sbl, port_num);
> +out:
> +	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_FAULT_MON);
> +
> +	return err;
> +}
> +
> +static int sbl_link_fault_monitor_stop(struct sbl_inst *sbl, int port_nu=
m)
> +{
> +	int err;
> +	u32 base =3D SBL_PML_BASE(port_num);
> +	u64 val64;
> +	u64 err_flags;
> +
> +	val64 =3D sbl_read64(sbl, base | SBL_PML_CFG_LLR_SM_OFFSET);
> +	if (SBL_PML_CFG_LLR_SM_REPLAY_CT_MAX_GET(val64) < SBL_LLR_REPLAY_CT_MAX=
_UNLIMITED)
> +		err_flags =3D SBL_PML_FAULT_ERR_FLAGS;
> +	else
> +		err_flags =3D SBL_PML_REC_FAULT_ERR_FLAGS;
> +
> +	err =3D sbl_pml_disable_intr_handler(sbl, port_num, err_flags);
> +	if (err) {
> +		sbl_dev_err(sbl->dev, "fm %d: intr disable failed [%d]\n", port_num, e=
rr);
> +		return err;
> +	}
> +
> +	err =3D sbl_pml_remove_intr_handler(sbl, port_num);
> +	if (err) {
> +		sbl_dev_err(sbl->dev, "fm %d: intr remove failed [%d]\n", port_num, er=
r);
> +		return err;
> +	}
> +
> +	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_FAULT_MON);
> +	return 0;
> +}

[Severity: Medium]
In sbl_link_fault_monitor_start(), sbl_pml_recovery_enable() sets
link->pml_recovery.enabled =3D true before installing and enabling the fault
interrupt handler. Once sbl_pml_enable_intr_handler() succeeds, a fault
interrupt can fire in sbl_pml_hdlr() -> sbl_pml_recovery_monitor() and arm
link->pml_recovery.timer.

If sbl_pml_install_intr_handler(), sbl_pml_enable_intr_handler(), or the
subsequent sbl_pml_err_flgs_test() check fails, the error unwind labels
(out_disable, out_uninstall, and out) do not call sbl_pml_recovery_cancel(),
 nor does sbl_link_fault_monitor_stop(). If SBL_DEBUG_INHIBIT_CLEANUP is set
when sbl_base_link_start() unwinds, or if sbl_link_fault_monitor_stop()
fails in sbl_base_link_stop(), sbl_pml_link_down() and
sbl_pml_recovery_cancel() are skipped, leaving PML recovery enabled and any
armed pml_recovery.timer running.

Should sbl_link_fault_monitor_start() cancel PML recovery on its error
unwind paths (and sbl_link_fault_monitor_stop() do the same), and should the
unreachable return err statement after goto out_uninstall be removed?

[ ... ]

> +int sbl_base_link_config(struct sbl_inst *sbl, int port_num, struct sbl_=
base_link_attr *blattr)
> +{
> +	struct sbl_link *link;
> +	int err;

[ ... ]

> +	spin_lock(&link->lock);
> +
> +	if (!(link->blstate & (SBL_BASE_LINK_STATUS_DOWN | SBL_BASE_LINK_STATUS=
_UNCONFIGURED))) {
> +
> +		sbl_dev_err(sbl->dev, "bl %d: wrong state (%s) for config", port_num,
> +			    sbl_link_state_str(link->blstate));
> +		spin_unlock(&link->lock);
> +		return -EUCLEAN;
> +	}
> +
> +	memcpy(&link->blattr, blattr, sizeof(struct sbl_base_link_attr));
> +
> +	link->blconfigured =3D true;
> +
> +	if (link->blattr.loopback_mode =3D=3D SBL_LOOPBACK_MODE_LOCAL) {
> +		/* we dont need media to go to down */
> +		link->blstate =3D SBL_BASE_LINK_STATUS_DOWN;
> +	} else if (link->mconfigured) {
> +		/* we need media as well if not loopback */
> +		link->blstate =3D SBL_BASE_LINK_STATUS_DOWN;
> +	}
> +
> +	spin_unlock(&link->lock);
> +
> +	return 0;
> +}

[Severity: Medium]
If a port without configured media (link->mconfigured =3D=3D false) is first
configured in SBL_LOOPBACK_MODE_LOCAL, sbl_base_link_config() transitions
link->blstate to SBL_BASE_LINK_STATUS_DOWN.

If sbl_base_link_config() is later called to reconfigure the port to a
non-local loopback mode while link->mconfigured is still false, neither
branch is taken and link->blstate remains SBL_BASE_LINK_STATUS_DOWN instead
of reverting to SBL_BASE_LINK_STATUS_UNCONFIGURED, causing subsequent
sbl_base_link_start() calls to fail in sbl_media_validate_config() with
-EUCLEAN.

Should there be an else branch setting link->blstate to
SBL_BASE_LINK_STATUS_UNCONFIGURED when neither local loopback nor media is
configured?

[ ... ]

> +int sbl_base_link_start(struct sbl_inst *sbl, int port_num)
> +{

[ ... ]

> +	err =3D mutex_lock_interruptible(&link->busy_mtx);
> +	if (err)
> +		return -ERESTARTSYS;
> +
> +	if (link->blstate =3D=3D SBL_BASE_LINK_STATUS_UP) {
> +		/* link came up while waiting for the mutex */
> +		mutex_unlock(&link->busy_mtx);
> +		return 0;
> +	}
> +
> +	if (link->blstate !=3D SBL_BASE_LINK_STATUS_DOWN) {
> +
> +		sbl_dev_err(sbl->dev, "bl %d: wrong state (%s) for start", port_num,
> +			    sbl_link_state_str(link->blstate));
> +		mutex_unlock(&link->busy_mtx);
> +		return -EUCLEAN;
> +	}
> +
> +	/* only local loopback is possible without media */
> +	if (link->blattr.loopback_mode !=3D SBL_LOOPBACK_MODE_LOCAL) {
> +		err =3D sbl_media_validate_config(sbl, port_num);
> +		if (err) {
> +			sbl_dev_err(sbl->dev, "bl %d: config unsuitable for media type", port=
_num);
> +			mutex_unlock(&link->busy_mtx);
> +			return err;
> +		}
> +	}
> +
> +	link->blstate =3D SBL_BASE_LINK_STATUS_STARTING;

[Severity: Medium]
Can sbl_base_link_config() and sbl_base_link_dump_attr() race with
sbl_base_link_start(), sbl_base_link_reset(), and
sbl_base_link_try_start_fail_cleanup() on link->blstate, link->blconfigured,
link->blattr, and link->start_cancelled?

sbl_base_link_config() only acquires spin_lock(&link->lock) (not
link->busy_mtx) and relies on link->blstate being SBL_BASE_LINK_STATUS_DOWN
or SBL_BASE_LINK_STATUS_UNCONFIGURED to serialize updates to link->blattr
and link->blconfigured.

However, sbl_base_link_start(), sbl_base_link_reset(), and
sbl_base_link_try_start_fail_cleanup() read and write link->blstate,
link->blerr, link->blconfigured, and link->start_cancelled under
link->busy_mtx without holding link->lock. For example, in
sbl_base_link_reset():

	link->blstate =3D SBL_BASE_LINK_STATUS_UNCONFIGURED;
	link->blerr =3D 0;
	link->blconfigured =3D false;
	link->pcs_config =3D false;
	link->llr_loop_time =3D 0;
	link->start_cancelled =3D false;

setting link->blstate to SBL_BASE_LINK_STATUS_UNCONFIGURED before clearing
link->blconfigured allows a concurrent sbl_base_link_config() to observe
SBL_BASE_LINK_STATUS_UNCONFIGURED, copy new attributes, and set
link->blconfigured =3D true, only for sbl_base_link_reset() to overwrite
link->blconfigured =3D false. Similarly, sbl_base_link_start() validates
link->blattr before setting link->blstate =3D SBL_BASE_LINK_STATUS_STARTING
without holding link->lock, and sbl_base_link_dump_attr() reads
link->blconfigured and link->blattr without acquiring link->lock.

Should state and attribute accesses across these functions be consistently
serialized with link->lock (or link->busy_mtx)?

[ ... ]

> +	/* start sending alignment markers for lp to tune against */
> +	err =3D sbl_pml_pcs_am_start(sbl, port_num);
> +	if (err) {
> +		sbl_dev_err(sbl->dev, "bl %d: am_start failed [%d]\n", port_num, err);
> +		goto out;
> +	}
> +
> +	/* wait until we detect the link partner */
> +	err =3D sbl_base_link_lp_detect(sbl, port_num);
> +	if (err) {
> +		sbl_base_link_report_err(sbl, "lpd", port_num, err);
> +		goto out;
> +	}
> +
> +	/* record when we really start to bring up the link */
> +	sbl_link_up_begin(sbl, port_num);
> +
> +	/* start the serdes */
> +	err =3D sbl_serdes_start(sbl, port_num);
> +	if (err) {
> +		sbl_base_link_report_err(sbl, "serdes_start", port_num, err);
> +		goto out;
> +	}
> +
> +	/* start the pml block (pcs,mac,llr) */
> +	err =3D sbl_pml_start(sbl, port_num);
> +	if (err) {
> +		sbl_base_link_report_err(sbl, "pml_start", port_num, err);
> +		goto out_serdes;
> +	}

[ ... ]

> +	/* failed */
> +out_fm:
> +	sbl_link_fault_monitor_stop(sbl, port_num);
> +out_pcs:
> +	if (!sbl_debug_option(sbl, port_num, SBL_DEBUG_INHIBIT_CLEANUP))
> +		sbl_pml_link_down(sbl, port_num);
> +out_serdes:
> +	if (!sbl_debug_option(sbl, port_num, SBL_DEBUG_INHIBIT_CLEANUP))
> +		sbl_serdes_stop(sbl, port_num);
> +out:

[Severity: Medium]
Does the error unwind in sbl_base_link_start() leave the PCS enabled in
hardware on failure?

First, sbl_pml_pcs_am_start() configures and enables the PCS (setting
PCS_ENABLE in SBL_PML_CFG_PCS_OFFSET and forcing TX remote fault in
SBL_PML_DBG_PCS_OFFSET). If sbl_base_link_lp_detect() or sbl_serdes_start()
subsequently fails, control jumps to out, and if sbl_pml_start() fails,
control jumps to out_serdes. Because sbl_pml_start() only stops the MAC and
disables PCS alignment on error, jumping to out or out_serdes skips out_pcs
(sbl_pml_link_down()) and leaves the PCS enabled.

Second, when a later step jumps to out_fm or out_pcs, out_pcs calls
sbl_pml_link_down() before out_serdes calls sbl_serdes_stop(). At that point
link->sstate is still SBL_SERDES_STATUS_RUNNING, so on optical media
sbl_pml_link_down() -> sbl_pml_pcs_stop() hits:

	if ((link->sstate !=3D SBL_SERDES_STATUS_DOWN) &&
	    (link->mattr.media =3D=3D SBL_LINK_MEDIA_OPTICAL)) {
		sbl_dev_err(sbl->dev, "%d: not stopping pcs because serdes is running",
			    port_num);
		return;
	}

and returns without stopping the PCS. By contrast, sbl_base_link_stop(),
sbl_base_link_reset(), and sbl_base_link_try_start_fail_cleanup() stop the
SerDes before calling sbl_pml_link_down().

Should out_serdes run before out_pcs, and should failures after
sbl_pml_pcs_am_start() unwind through out_pcs?

[ ... ]

> +void sbl_disable_pml_recovery(struct sbl_inst *sbl, int port_num, bool d=
isable)
> +{
> +	struct sbl_link *link =3D sbl->link + port_num;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&link->lock, flags);
> +	if (disable)
> +		link->blattr.options |=3D SBL_DISABLE_PML_RECOVERY;
> +	else
> +		link->blattr.options &=3D ~SBL_DISABLE_PML_RECOVERY;
> +	spin_unlock_irqrestore(&link->lock, flags);
> +}
> +EXPORT_SYMBOL(sbl_disable_pml_recovery);
> +
> +/**
> + * sbl_set_degraded_flag() - Set degraded flag
> + * @sbl: A slingshot base link device instance
> + * @port_num: port number
> + *
> + * Context: Process context, Acquires lock and releases is_degraded_lock=
 <spin_lock>
> + */
> +void sbl_set_degraded_flag(struct sbl_inst *sbl, int port_num)
> +{
> +	struct sbl_link *link =3D sbl->link + port_num;
> +
> +	spin_lock(&link->is_degraded_lock);
> +	link->is_degraded =3D true;
> +	spin_unlock(&link->is_degraded_lock);
> +}
> +EXPORT_SYMBOL(sbl_set_degraded_flag);

[ ... ]

> +int sbl_base_link_cancel_start(struct sbl_inst *sbl, int port_num)
> +{
> +	struct sbl_link *link =3D sbl->link + port_num;
> +
> +	sbl_dev_dbg(sbl->dev, "bl %d: cancelling start\n", port_num);
> +
> +	spin_lock(&link->lock);
> +	link->start_cancelled =3D true;
> +	complete_all(&link->an_hw_change);
> +	spin_unlock(&link->lock);
> +	sbl_fec_monitor_stop(sbl, port_num);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(sbl_base_link_cancel_start);
> +
> +bool sbl_base_link_start_cancelled(struct sbl_inst *sbl, int port_num)
> +{
> +	struct sbl_link *link =3D sbl->link + port_num;
> +	bool cancelled;
> +
> +	spin_lock(&link->lock);
> +	cancelled =3D link->start_cancelled;
> +	spin_unlock(&link->lock);
> +
> +	return cancelled;
> +}

[Severity: High]
Can mixing spin_lock() and spin_lock_irqsave() on link->lock cause a
deadlock?

Several callers acquire link->lock with spin_lock_irqsave(), including
sbl_base_link_start(), sbl_ignore_save_tuning_param(),
sbl_enable_opt_lane_degrade(), sbl_disable_pml_recovery(),
sbl_an_hw_wait_prepare(), and sbl_fec_monitor_stop(). Other callers acquire
link->lock with plain spin_lock(), including sbl_base_link_config(),
sbl_base_link_enable_start(), sbl_base_link_cancel_start(),
sbl_base_link_start_cancelled(), sbl_base_link_stop(),
sbl_base_link_sysfs_sprint(), sbl_base_link_llr_sysfs_sprint(), and
sbl_base_link_loopback_sysfs_sprint().

When the TIMER_IRQSAFE callback sbl_pml_recovery_monitor_fallback_timer()
fails, it invokes:

  sbl_pml_recovery_monitor_fallback_timer()
    -> sbl_pml_link_down_async_alert()
      -> sbl_async_alert()
        -> cass_sbl_async_alert()
          -> cass_sbl_link_down_async_handler()
            -> cass_link_async_down()
              -> cass_lmon_request_down()
                -> sbl_base_link_cancel_start()

which acquires link->lock from IRQ-disabled timer context. If that timer
fires on a CPU where a process-context caller holds link->lock via plain
spin_lock() (with interrupts enabled), the CPU will deadlock on link->lock.

Similarly, sbl_set_degraded_flag(), sbl_clear_degraded_flag(), and
sbl_get_degraded_flag() use plain spin_lock(&link->is_degraded_lock) while
sbl_pml_hdlr() accesses link->is_degraded in interrupt context.

Should all acquisitions of link->lock (and link->is_degraded_lock) use
spin_lock_irqsave() and spin_unlock_irqrestore()?

[ ... ]

> +int sbl_base_link_stop(struct sbl_inst *sbl, int port_num)
> +{

[ ... ]

> +out:
> +	spin_lock(&link->lock);
> +	if (err)
> +		link->blstate =3D SBL_BASE_LINK_STATUS_ERROR;
> +	/* if keep serdes up, don't change state to down */
> +	else if (!sbl_debug_option(sbl, port_num, SBL_DEBUG_KEEP_SERDES_UP))
> +		link->blstate =3D SBL_BASE_LINK_STATUS_DOWN;
> +	link->blerr =3D err;
> +	spin_unlock(&link->lock);
> +
> +	mutex_unlock(&link->busy_mtx);
> +
> +	sbl_dev_dbg(sbl->dev, "bl %d: stop done", port_num);
> +
> +	return link->blerr;
> +}

[Severity: Low]
In sbl_base_link_stop(), link->blerr is read for the return value after both
link->lock and link->busy_mtx have been unlocked, so a concurrent caller
acquiring link->busy_mtx can modify link->blerr before sbl_base_link_stop()
returns. Should this return err instead of link->blerr?

[ ... ]

> +int sbl_base_link_reset(struct sbl_inst *sbl, int port_num)
> +{

[ ... ]

> +	err =3D sbl_serdes_reset(sbl, port_num);
> +	if (err)
> +		sbl_dev_err(sbl->dev, "bl %d: reset: serdes_reset failed [%d]", port_n=
um, err);
> +
> +	err =3D sbl_pml_link_down(sbl, port_num);
> +	if (err)
> +		sbl_dev_warn(sbl->dev, "bl %d: reset: pcs_link_down failed [%d]", port=
_num, err);
> +
> +	link->blstate =3D SBL_BASE_LINK_STATUS_UNCONFIGURED;
> +	link->blerr =3D 0;
> +	link->blconfigured =3D false;
> +	link->pcs_config =3D false;
> +	link->llr_loop_time =3D 0;
> +	link->start_cancelled =3D false;
> +	WRITE_ONCE(link->link_info, 0);
> +	link->lp_subtype =3D SBL_LP_SUBTYPE_INVALID;
> +	/* dont reset media attribute */
> +
> +	/* reset hw */
> +	sbl_pml_set_defaults(sbl, port_num);
> +
> +	sbl_pml_err_flgs_clear_all(sbl, port_num);
> +
> +	mutex_unlock(&link->busy_mtx);
> +
> +	return 0;
> +}

[Severity: Medium]
In sbl_base_link_reset(), if sbl_serdes_reset() fails, it sets link->sstate
to SBL_SERDES_STATUS_ERROR and returns a negative error code, but that err
value is immediately overwritten by sbl_pml_link_down() (which always
returns 0) and sbl_base_link_reset() unconditionally returns 0 with
link->blerr =3D 0.

Should sbl_base_link_reset() preserve and return the error from
sbl_serdes_reset() (or sbl_pml_link_down()) as documented in its function
comment?

[ ... ]

> +void sbl_base_link_try_start_fail_cleanup(struct sbl_inst *sbl, int port=
_num)
> +{

[ ... ]

> +	/* some errors we can clean up and move to down so
> +	 * we can try to come up again directly
> +	 */
> +	if (link->blstate =3D=3D SBL_BASE_LINK_STATUS_ERROR) {
> +		switch (link->blerr) {
> +
> +		case -EADV:          /* pcs startup saw high serdes error rate */
> +		case -EBADE:         /* bad page exchange during auto neg */
> +		case -ENETDOWN:      /* pcs dropped out after starting */
> +		case -ECHRNG:        /* serdes eye heights went bad during pcs startup=
 */
> +		case -ELNRNG:        /* unable to tune properly */
> +			sbl_serdes_invalidate_all_tuning_params(sbl);
> +			fallthrough;

[Severity: Medium]
sbl_base_link_try_start_fail_cleanup() cleans up a single port_num while
holding only that port's link->busy_mtx, but calls
sbl_serdes_invalidate_all_tuning_params(sbl), which invalidates the saved
tuning parameters for every port on the SBL instance.

Should this call sbl_serdes_invalidate_tuning_params(sbl, port_num) instead,
matching sbl_base_link_start() and sbl_pml_start()?

[ ... ]

> diff --git a/drivers/net/ethernet/hpe/sbl/sbl_link_an.c b/drivers/net/eth=
ernet/hpe/sbl/sbl_link_an.c
> new file mode 100644
> index 0000000000000..aecadbceb593c
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sbl/sbl_link_an.c
> @@ -0,0 +1,1010 @@

[ ... ]

> +int sbl_link_autoneg(struct sbl_inst *sbl, int port_num)
> +{

[ ... ]

> +		/* see if we need to update the start timeout */
> +		sbl_an_update_timeout(sbl, port_num);
> +
> +		/* we know the lp is there */
> +		link->lp_detected =3D true;
> +		break;
> +	}
> +
> +	/* cleanup */
> +	if (link->sstate =3D=3D SBL_SERDES_STATUS_AUTONEG)
> +		sbl_an_serdes_stop(sbl, port_num);
> +	sbl_pml_disable_intr_handler(sbl, port_num, SBL_AUTONEG_ERR_FLGS);
> +	sbl_pml_remove_intr_handler(sbl, port_num);
> +
> +out:
> +	sbl_pml_err_flgs_clear_all(sbl, port_num);
> +	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_PCS_ANEG);
> +
> +	return err;
> +}

[Severity: Medium]
When autonegotiation succeeds in sbl_link_autoneg(), err is 0 and cleanup
calls sbl_an_serdes_stop(sbl, port_num) without checking its return value
(and likewise ignores the return value on the retry paths inside the loop).

If sbl_an_serdes_stop() fails in sbl_serdes_stop_internal(), it sets
link->sstate =3D SBL_SERDES_STATUS_ERROR, yet sbl_link_autoneg() still retu=
rns
0. sbl_base_link_start() then enables PCS alignment markers and calls
sbl_serdes_start(), which fails with -EUCLEAN because link->sstate is not
SBL_SERDES_STATUS_DOWN, leaving link->blerr set to -EUCLEAN (which
sbl_base_link_try_start_fail_cleanup() will not clear).

Should sbl_link_autoneg() check the return value of sbl_an_serdes_stop() and
propagate any error?

[ ... ]

> diff --git a/drivers/net/ethernet/hpe/sbl/sbl_link_an_nic.c b/drivers/net=
/ethernet/hpe/sbl/sbl_link_an_nic.c
> new file mode 100644
> index 0000000000000..e9536283c47a1
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sbl/sbl_link_an_nic.c
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/* Copyright 2025 Hewlett Packard Enterprise Development LP */

[ ... ]

> +int sbl_an_page_exchange(struct sbl_inst *sbl, int port_num, unsigned lo=
ng remaining_jiffies)
> +{
> +	struct sbl_link *link =3D sbl->link + port_num;
> +	int xcng_count =3D 1;
> +	u64 sts_autoneg_next_reg;
> +	u32 base =3D SBL_PML_BASE(port_num);
> +	int err;
> +
> +	/* -- Interrupt based next page exchange sequence -- */
> +	do {
> +		/* Too many Rx pages ?*/
> +		if (xcng_count >=3D SBL_AN_MAX_RX_PAGES) {
> +			sbl_dev_err_ratelimited(sbl->dev, "an %d: rx next page: too many page=
s %d",
> +						port_num, xcng_count);
> +			sbl_an_dump_state(sbl, port_num);
> +			return -EPROTO;
> +		}
> +
> +		sbl_dev_dbg(sbl->dev, "an %d: next page %d: start", port_num, xcng_cou=
nt);
> +
> +		if (sbl_base_link_start_cancelled(sbl, port_num))
> +			return -ECANCELED;
> +		if (sbl_start_timeout(sbl, port_num))
> +			return -ETIMEDOUT;
> +
> +		/* setup the next page (real or null) */
> +		if (xcng_count < link->an_tx_count)
> +			sbl_an_setup_next_page(sbl, port_num, xcng_count);
> +		else
> +			sbl_an_setup_null_page(sbl, port_num);
> +
> +		/* setup and enable interrupt */
> +		err =3D sbl_an_hw_wait_prepare(sbl, port_num);
> +		if (err)
> +			return err;
> +
> +		/* send the next page */
> +		sbl_an_send_next_page(sbl, port_num);
> +
> +		/* wait for next page interrupt */
> +		remaining_jiffies =3D wait_for_completion_timeout(&link->an_hw_change,=
 remaining_jiffies);
> +		if (sbl_base_link_start_cancelled(sbl, port_num))
> +			return -ECANCELED;
> +		if (!remaining_jiffies) {
> +			sbl_dev_err(sbl->dev, "an %d: next page %d: exchange timeout", port_n=
um, xcng_count);
> +			sbl_an_dump_state(sbl, port_num);
> +			return -ETIME;
> +		}
> +
> +		/* check if received page is a next page */
> +		if (!sbl_an_is_next_page(sbl, port_num)) {
> +			sbl_dev_dbg_ratelimited(sbl->dev, "an %d: next page %d: missing next =
page indication, resend next-page",
> +						port_num, xcng_count);
> +			sbl_an_dump_state(sbl, port_num);
> +			continue;
> +
> +		}
> +
> +		/* put the received page in the buffer if indicated */
> +		if (link->an_rx_page[xcng_count - 1] & AN_NP_NP_MASK) {
> +			sts_autoneg_next_reg =3D sbl_read64(sbl, base |
> +						  SBL_PML_STS_PCS_AUTONEG_NEXT_PAGE_OFFSET);
> +			link->an_rx_page[xcng_count] =3D
> +				SBL_PML_STS_PCS_AUTONEG_NEXT_PAGE_LP_NEXT_PAGE_GET(sts_autoneg_next_=
reg);
> +			sbl_dev_dbg(sbl->dev, "an %d: rx next page: 0x%llx",
> +				    port_num, link->an_rx_page[xcng_count]);
> +			link->an_rx_count++;
> +		}
> +
> +		/* go to the additional next page */
> +		xcng_count++;
> +
> +		/* check to see if the exchange is done */
> +	} while (!sbl_an_next_is_complete(sbl, port_num));

[Severity: High]
What happens in sbl_an_page_exchange() when sbl_an_is_next_page() returns
false (for example, when the link partner restarts autonegotiation and sends
an unexpected base page during next-page exchange)?

First, sbl_link_autoneg() checks for err =3D=3D -EPROTO from sbl_an_exchang=
e()
with the comment:

	/* we have received an unexpected base page
	 * The lp must have restarted autoneg and we should too
	 *
	 * However we know that some Mellanox cards will do this if there is no
	 * ability match - particularly only supporting 100KR4 not 100CR4
	 * See if we can try to fix this up
	 */

However, when sbl_an_is_next_page() is false, sbl_an_page_exchange() does a
continue without incrementing xcng_count or returning -EPROTO, so
xcng_count >=3D SBL_AN_MAX_RX_PAGES is never reached and the loop instead r=
uns
until remaining_jiffies expires and returns -ETIME, making the -EPROTO
recovery and sbl_an_100cr4_fixup() path in sbl_link_autoneg() unreachable.

Second, because continue jumps to the while (!sbl_an_next_is_complete())
check, if the complete bit is set, sbl_an_page_exchange() exits the loop and
returns 0 without recording the received page.

Third, when the loop repeats for the same xcng_count and
xcng_count >=3D link->an_tx_count, sbl_an_setup_null_page() is called again:

	null_page  =3D sbl_read64(sbl, base | SBL_PML_CFG_PCS_AUTONEG_NEXT_PAGE_OF=
FSET);
	null_page ^=3D AN_NP_T_MASK;          /* toggle bit 11 */

which flips the IEEE 802.3 Next Page toggle bit (AN_NP_T_MASK) while
resending the same null page.

Should sbl_an_page_exchange() return -EPROTO when an unexpected base page is
received during next-page exchange (or avoid toggling AN_NP_T_MASK and
checking sbl_an_next_is_complete() when resending)?

[ ... ]

> diff --git a/drivers/net/ethernet/hpe/sbl/sbl_link_nic.c b/drivers/net/et=
hernet/hpe/sbl/sbl_link_nic.c
> new file mode 100644
> index 0000000000000..2c0be275d0198
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sbl/sbl_link_nic.c
> @@ -0,0 +1,196 @@

[ ... ]

> +int sbl_base_link_loopback_sysfs_sprint(struct sbl_inst *sbl, int port_n=
um, char *buf, size_t size)
> +{
> +	struct sbl_link *link =3D sbl->link + port_num;
> +	int s =3D 0;
> +
> +	spin_lock(&link->lock);
> +
> +	s +=3D scnprintf(buf + s, size - s, sbl_loopback_mode_str(link->loopbac=
k_mode));
> +
> +	spin_unlock(&link->lock);
> +
> +	return s;
> +}

[Severity: Low]
In sbl_base_link_loopback_sysfs_sprint(), passing the non-literal return
value of sbl_loopback_mode_str() directly as the format string to
scnprintf() triggers a -Wformat-security compiler warning. Should this use a
"%s" format string?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-cxi-netdev=
-submission-v1-0-8c2c391cc283@hpe.com?part=3D6
