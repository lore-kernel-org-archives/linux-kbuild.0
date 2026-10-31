Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480528;
	b=J+2h8ipfW4BpUorGHVQhPswaqXSIXFwJu0KMu3EHDCWyqsOCy3etPbNw+q2zYHJKXRKH
	 RToikF4gBV/TLAPx6/2vLAASuWOXvNuxta3MxNy2h7mcVkoBtgFgccFMXJt04ErgpOe+K
	 xB6rAqtGb0jpaFTX79mbsC4/5HfFMd3jn77/L+LaXF1zKOm7RNcfILqZle+PG0bq+x332
	 Dtayv3rtd48QOSJ7+dP9ptpDy4PtpSxAURQVjLKd7yZ/GuIG2uir0lyYfeiofaQEKZNaa
	 vtdhNlYiNIBuD41GL22v2HeDeZeaGza+XrgU/3/UgaCsISjuucXUbqLY/fJMdFPerrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480528;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=y/w4mYHldrgvWB4qSuKhnXi8lBSdXyetDcgm2+5438I=;
	b=UgFMdBgSA90DYUc5LEt4pcXVsDuW0Cm3ZXEYp1RFp/Z4kADYHy8EIDmRic6UNMl6e0zA
	 e/Rxi1zr/Wc0UMNvYG+zvXyW6n3WlgPoV8lIBJ3oGC6hqueMjNZ1387AVEG82dR0wwX8N
	 +lO1v+uiBsavefoZ4lEQQEyNmgHoFoPRc3sAqJWWpM7XZheVJGgcAv9di15+3//tuT79C
	 2fBJHm2irVFIlwfZh7jOQ+wzIbJfVubFtvDCcWL1HT2wDThGp0B28xSRcxpyM3fCWi90f
	 dRHJ2ReVOjLZz4Vn7eLvCL/ULvzNPEGP5t78asPYuNImABEQShxBbPjGERb6C6K9c8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lp3aWVbl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D7D606A31D
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 21:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lp3aWVbl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1A61F00919;
	Sat, 31 Oct 2026 21:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793480527;
	bh=y/w4mYHldrgvWB4qSuKhnXi8lBSdXyetDcgm2+5438I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lp3aWVbl9yon+EuQQpzLSxEPckUmG/37bK4VUQvpoCLaBcGWGMyBIcMaOotFXKos6
	 o4fBFZJrdXmt8fiRmnJQKtHXivr5/wdwuH3rYfoFBrjdAM6nBxB4QmbcYllZV0+EpQ
	 8LJU5HS2Kkyk4glHAgutka59gJjW2x++VqHAMC6PowE4DgBBvn5zO3TCRraAIVT8+t
	 pa5KU9jqxKVKiZ9saKpht3n04uCYjdu9BjXk+GP9LgJLypNApPpgFjTeDyPn/Qf3SP
	 j/0mOdLiGKQ8GGw9dFnbW2/NGzm2qet+QE0tHq68yrY+NL8D8UTgnEPWUGKF12SYDy
	 Ygra1oaBIwBmw==
Message-ID: <sashiko-outbox-192137@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/23] net: hpe: sbl: add the PML link layer
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
In-Reply-To: <20261030-cxi-netdev-submission-v1-5-8c2c391cc283@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030-cxi-netdev-submission-v1-5-8c2c391cc283@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 21:02:06 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] net: hpe: sbl: non-raw spinlock_t acquired in TIMER_IRQSAFE recove=
ry timer
- [Medium] net: hpe: sbl: down_origin overwritten after degrade failure in =
sbl_pml_hdlr()
- [Medium] net: hpe: sbl: race in sbl_pml_recovery_monitor_fallback_timer()=
 drops faults
- [Medium] net: hpe: sbl: non-zero llr_loop_time left on error in sbl_pml_l=
lr_start()
- [Medium] net: hpe: sbl: stale link->llr_options across restarts in sbl_pm=
l_llr_config()
- [Medium] net: hpe: sbl: missing link_info flag update in sbl_pml_llr_enab=
le()
- [Low] net: hpe: sbl: duplicate state flag in sbl_pml_pcs_am_start()
--

commit aeafa8bdeb0e8da16241c976b7c17b49fa65d4a5
Author: Doug Ledford <doug.ledford@hpe.com>

net: hpe: sbl: add the PML link layer

This commit adds the physical media layer (PML) implementation for the HPE
Slingshot base link driver, covering MAC, PCS, LLR configuration, and SerDes
operation hooks.

> diff --git a/drivers/net/ethernet/hpe/sbl/sbl_pml.c b/drivers/net/etherne=
t/hpe/sbl/sbl_pml.c
> new file mode 100644
> index 0000000000000..367c3184fb799
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sbl/sbl_pml.c
> @@ -0,0 +1,787 @@

[ ... ]

> +static void sbl_pml_recovery_monitor_fallback_timer(struct timer_list *t)
> +{
> +	struct sbl_pml_recovery *pml_recovery =3D container_of(t, struct sbl_pm=
l_recovery, timer);
> +	struct sbl_inst *sbl;
> +	struct sbl_link *link;
> +	int port_num;
> +	enum sbl_link_down_origin down_origin;
> +	u32 elapsed;
> +	u32 rl_total_time;
> +	unsigned long timeout;
> +	unsigned long irq_flags;
> +
> +	if (!pml_recovery || !pml_recovery->sbl)
> +		return;
> +
> +	spin_lock_irqsave(&pml_recovery->lock, irq_flags);
> +	if (!pml_recovery->enabled || !pml_recovery->started) {
> +		spin_unlock_irqrestore(&pml_recovery->lock, irq_flags);
> +		return;
> +	}
> +	spin_unlock_irqrestore(&pml_recovery->lock, irq_flags);
> +
> +	sbl =3D pml_recovery->sbl;
> +	port_num =3D pml_recovery->port_num;
> +	down_origin =3D pml_recovery->down_origin;
> +	link =3D sbl->link + port_num;
> +	timeout =3D pml_recovery->init_jiffies + msecs_to_jiffies(pml_recovery-=
>timeout);
> +	elapsed =3D jiffies_to_msecs(jiffies - link->pml_recovery.init_jiffies);
> +	link->pml_recovery.rl_time_remaining -=3D
> +		jiffies_to_msecs(jiffies -
> +				 link->pml_recovery.last_poll_jiffies);
> +	link->pml_recovery.last_poll_jiffies  =3D jiffies;
> +
> +	if (sbl_pml_recovery_no_faults(sbl, port_num)) {
> +		sbl_dev_info(sbl->dev, "%d: PML recovered successfully in %ums", port_=
num, elapsed);
> +		sbl_link_counters_incr(sbl, port_num, pml_recovery_successes);
> +		sbl_pml_recovery_origin_counter_update(sbl, port_num, down_origin);
> +		sbl_link_counters_incr(sbl, port_num, (elapsed < SBL_PML_REC_HISTOGRAM=
_MAX) ?
> +				      (pml_recovery_histogram_0_9ms + elapsed / 10) :
> +				       pml_recovery_histogram_high);
> +		goto out;
> +	} else if (time_is_before_eq_jiffies(timeout)) {
> +		sbl_dev_info(sbl->dev, "%d: PML recovery monitor timed out (%ums)", po=
rt_num, elapsed);
> +		goto out_fail;
> +	} else if (!sbl_pml_recovery_rate_test(sbl, port_num)) {
> +		rl_total_time =3D link->blattr.pml_recovery.rl_max_duration - link->pm=
l_recovery.rl_time_remaining;
> +		sbl_dev_err(sbl->dev, "%d: PML recovery rate exceeded (%ums/%ums) afte=
r %ums", port_num, rl_total_time,
> +			    link->blattr.pml_recovery.rl_window_size, elapsed);
> +		sbl_link_counters_incr(sbl, port_num, pml_recovery_rate_exceeded);
> +		goto out_fail;
> +	}
> +
> +	/* start timer for next poll */
> +	spin_lock_irqsave(&pml_recovery->lock, irq_flags);
> +	if (pml_recovery->enabled)
> +		mod_timer(&pml_recovery->timer,
> +			  jiffies + msecs_to_jiffies(SBL_PML_REC_POLL_INTERVAL));
> +	spin_unlock_irqrestore(&pml_recovery->lock, irq_flags);
> +	return;
> +
> +out_fail:
> +	sbl_pml_link_down_async_alert(sbl, port_num, down_origin);
> +
> +out:
> +	spin_lock_irqsave(&link->fec_discard_lock, irq_flags);
> +	link->fec_discard_time =3D jiffies;
> +	link->fec_discard_type =3D SBL_FEC_DISCARD_TYPE_PML_REC_END;
> +	spin_unlock_irqrestore(&link->fec_discard_lock, irq_flags);
> +	spin_lock_irqsave(&pml_recovery->lock, irq_flags);
> +	pml_recovery->started =3D false;
> +	spin_unlock_irqrestore(&pml_recovery->lock, irq_flags);
> +}

[Severity: Medium]
Can releasing pml_recovery->lock before polling hardware status and only
clearing pml_recovery->started at the end of
sbl_pml_recovery_monitor_fallback_timer() cause a concurrent fault interrupt
to be dropped?

After sbl_pml_recovery_no_faults() reads SBL_PML_STS_RX_PCS_OFFSET and
returns true, the callback logs recovery success, updates counters, and
takes link->fec_discard_lock before re-acquiring pml_recovery->lock to set
pml_recovery->started =3D false.

If a new fault interrupt arrives in sbl_pml_hdlr() during that window:

CPU0 (timer)                                  CPU1 (interrupt)
sbl_pml_recovery_monitor_fallback_timer()
  sbl_pml_recovery_no_faults() -> true
                                              sbl_pml_hdlr()
                                                sbl_pml_recovery_monitor()
                                                  if (!recovery->enabled ||
                                                      recovery->started)
                                                    return;
                                                sbl_write64(... SBL_PML_ERR=
_CLR_OFFSET,
                                                            raised_flgs);
  pml_recovery->started =3D false;

Wouldn't sbl_pml_recovery_monitor() return early without restarting alignme=
nt
or arming the timer while sbl_pml_hdlr() clears the hardware error flag?

Also, on the out_fail path, sbl_pml_link_down_async_alert() is called witho=
ut
re-checking pml_recovery->enabled, and rl_time_remaining, last_poll_jiffies,
and rl_window_start are updated without holding pml_recovery->lock. If
sbl_pml_recovery_cancel() sets recovery->enabled =3D false and waits in
timer_delete_sync(), could out_fail still emit a spurious link-down alert?

> +
> +void sbl_pml_recovery_init(struct sbl_pml_recovery *recovery)
> +{
> +	spin_lock_init(&recovery->lock);
> +	recovery->enabled =3D false;
> +	timer_setup(&recovery->timer, sbl_pml_recovery_monitor_fallback_timer,
> +		    TIMER_IRQSAFE);
> +}

[Severity: High]
Does setting up recovery->timer with TIMER_IRQSAFE in sbl_pml_recovery_init=
()
trigger an invalid wait context warning on PREEMPT_RT?

Because TIMER_IRQSAFE callbacks run with hardware interrupts disabled,
sbl_pml_recovery_monitor_fallback_timer() acquires non-raw spinlock_t locks
(pml_recovery->lock, link->fec_discard_lock, and sbl->name_lock via
sbl_dev_info() and sbl_dev_err()) while IRQs are disabled. Since
sbl_pml_recovery_cancel() is called from process context, is TIMER_IRQSAFE
needed here?

[ ... ]

> +int sbl_pml_hdlr(struct sbl_inst *sbl, int port_num, void *data)
> +{

[ ... ]

> +	result =3D SBL_PML_ERR_FLG_PCS_TX_DEGRADE_FAILURE_GET(raised_flgs);
> +
> +	if (result) {
> +		alert =3D SBL_ASYNC_ALERT_TX_DEGRADE_FAILURE;
> +		sbl_async_alert(sbl, port_num, alert, NULL, 0);
> +	}
> +
> +	result =3D SBL_PML_ERR_FLG_PCS_RX_DEGRADE_FAILURE_GET(raised_flgs);
> +
> +	if (result) {
> +		alert =3D SBL_ASYNC_ALERT_RX_DEGRADE_FAILURE;
> +		sbl_async_alert(sbl, port_num, alert, NULL, 0);
> +	}
> +
> +	if (alert !=3D SBL_ASYNC_ALERT_INVALID) {
> +		/* if Auto Lane Degrade is enabled, we will print this message regardl=
ess of whether
> +		 * the link went down because of lane degrade failure or not
> +		 */
> +		sbl_dev_err(sbl->dev, "%d: pml hdlr - link going down - all lanes down=
 [%d]", port_num, alert);
> +		down_origin =3D SBL_LINK_DOWN_ORIGIN_DEGRADE_FAILURE;
> +	}
> +
> +	/* autoneg err flags */
> +	if (raised_flgs & SBL_AUTONEG_ERR_FLGS) {
> +		sbl_pml_disable_intr_handler(sbl, port_num, SBL_AUTONEG_ERR_FLGS);
> +		complete(&link->an_hw_change);
> +	}
> +
> +	/* link faults */
> +	if (SBL_PML_ERR_FLG_PCS_HI_SER_GET(raised_flgs)) {
> +		if (sbl_debug_option(sbl, port_num, SBL_DEBUG_IGNORE_HISER)) {
> +			sbl_dev_warn(sbl->dev, "%d: pml hdlr - hiser - ignored", port_num);
> +		} else {
> +			sbl_dev_dbg(sbl->dev, "%d: pml hdlr - hiser", port_num);
> +			down_origin =3D SBL_LINK_DOWN_ORIGIN_HISER;
> +		}
> +	}
> +
> +	val64 =3D sbl_read64(sbl, base | SBL_PML_CFG_LLR_SM_OFFSET);
> +	if (SBL_PML_ERR_FLG_LLR_REPLAY_AT_MAX_GET(raised_flgs) &&
> +	    SBL_PML_CFG_LLR_SM_REPLAY_CT_MAX_GET(val64) < SBL_LLR_REPLAY_CT_MAX=
_UNLIMITED) {
> +		sbl_dev_dbg(sbl->dev, "%d: pml hdlr - max llr replay", port_num);
> +		down_origin =3D SBL_LINK_DOWN_ORIGIN_LLR_MAX;
> +	}
> +
> +	if (SBL_PML_ERR_FLG_PCS_LINK_DOWN_GET(raised_flgs)) {
> +		val64 =3D sbl_read64(sbl, base | SBL_PML_STS_RX_PCS_OFFSET);
> +
> +		if (sbl_debug_option(sbl, port_num, SBL_DEBUG_TRACE_PML_INT)) {
> +			sbl_dev_info(sbl->dev, "%d: pml hdlr - link down (%s)", port_num,
> +				     sbl_pml_pcs_state_str(sbl, port_num, pcs_state_str,
> +							   SBL_PCS_STATE_STR_LEN));
> +		}
> +
> +		if (!SBL_PML_STS_RX_PCS_ALIGN_STATUS_GET(val64)) {
> +			if (sbl_debug_option(sbl, port_num, SBL_DEBUG_IGNORE_ALIGN)) {
> +				sbl_dev_warn(sbl->dev, "%d: pml hdlr - align - ignored", port_num);
> +			} else {
> +				sbl_dev_dbg(sbl->dev, "%d: pml hdlr - align", port_num);
> +				down_origin =3D SBL_LINK_DOWN_ORIGIN_ALIGN;
> +			}
> +		} else if (SBL_PML_STS_RX_PCS_LOCAL_FAULT_GET(val64)) {
> +			sbl_dev_dbg(sbl->dev, "%d: pml hdlr - local fault", port_num);
> +			down_origin =3D SBL_LINK_DOWN_ORIGIN_LOCAL_FAULT;
> +		} else if (SBL_PML_STS_RX_PCS_FAULT_GET(val64)) {
> +			if (link->blattr.options & SBL_DISABLE_PML_RECOVERY ||
> +			    sbl_debug_option(sbl, port_num, SBL_DEBUG_REMOTE_FAULT_RECOVERY))=
 {
> +				sbl_dev_dbg(sbl->dev, "%d: pml hdlr - remote fault", port_num);
> +				down_origin =3D SBL_LINK_DOWN_ORIGIN_REMOTE_FAULT;
> +			} else {
> +				sbl_dev_dbg(sbl->dev, "%d: pml hdlr - remote fault - ignored", port_=
num);
> +			}
> +		} else {
> +			sbl_dev_dbg(sbl->dev, "%d: pml hdlr - link down", port_num);
> +			down_origin =3D SBL_LINK_DOWN_ORIGIN_LINK_DOWN;
> +		}
> +	}
> +
> +	if (down_origin !=3D SBL_LINK_DOWN_ORIGIN_UNKNOWN) {
> +		if (!(link->blattr.options & SBL_DISABLE_PML_RECOVERY) && !link->is_de=
graded) {
> +			if (sbl_pml_recovery_ignore_down_origin_fault(down_origin)) {
> +				sbl_dev_dbg(sbl->dev, "%d: PML recovery, pml hdlr fault(%d) is ignor=
ed", port_num, down_origin);
> +				sbl_pml_recovery_monitor(sbl, port_num, down_origin);
> +
> +			} else
> +				sbl_pml_link_down_async_alert(sbl, port_num, down_origin);
> +		} else {
> +			sbl_dev_info(sbl->dev, "%d: PML recovery is disabled", port_num);
> +			sbl_pml_link_down_async_alert(sbl, port_num, down_origin);
> +		}
> +	}

[Severity: Medium]
In sbl_pml_hdlr(), when a TX or RX degrade failure occurs, down_origin is s=
et
to SBL_LINK_DOWN_ORIGIN_DEGRADE_FAILURE. In
sbl_pml_recovery_ignore_down_origin_fault(), that is the only origin that
returns false so that the fault bypasses sbl_pml_recovery_monitor() and
immediately calls sbl_pml_link_down_async_alert().

However, if SBL_PML_ERR_FLG_PCS_HI_SER, SBL_PML_ERR_FLG_LLR_REPLAY_AT_MAX, =
or
SBL_PML_ERR_FLG_PCS_LINK_DOWN is raised in raised_flgs at the same time, the
subsequent checks unconditionally overwrite down_origin with a recoverable
origin (such as SBL_LINK_DOWN_ORIGIN_ALIGN or SBL_LINK_DOWN_ORIGIN_LINK_DOW=
N).

Won't that cause sbl_pml_recovery_ignore_down_origin_fault(down_origin) to
return true and enter sbl_pml_recovery_monitor() instead of immediately
sending the link-down alert with SBL_LINK_DOWN_ORIGIN_DEGRADE_FAILURE?

[ ... ]

> diff --git a/drivers/net/ethernet/hpe/sbl/sbl_pml_llr.c b/drivers/net/eth=
ernet/hpe/sbl/sbl_pml_llr.c
> new file mode 100644
> index 0000000000000..a190f6890b4ef
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sbl/sbl_pml_llr.c
> @@ -0,0 +1,736 @@

[ ... ]

> +static int sbl_pml_llr_measure_loop_time_ns(struct sbl_inst *sbl, int po=
rt_num,
> +					    u64 *llr_loop_time)
> +{
> +	struct sbl_link *link;
> +	u32              base;
> +	u64              min_loop_time;
> +	u64              max_loop_time;
> +	int              x;
> +	u64              val64;
> +	u64              time64;
> +	int              err;
> +
> +	sbl_link_info_set(sbl, port_num, SBL_LINK_INFO_LLR_MEASURE);
> +
> +	link =3D sbl->link + port_num;
> +	base =3D SBL_PML_BASE(port_num);
> +
> +	min_loop_time  =3D SBL_PML_LLR_MIN_LOOP_TIME;
> +	max_loop_time  =3D SBL_PML_LLR_MAX_LOOP_TIME;
> +	*llr_loop_time =3D SBL_PML_LLR_MAX_LOOP_TIME;
> +	time64         =3D 0ULL;
> +
> +	sbl_dev_dbg(sbl->dev, "%d: LLR measure loop time (len =3D %s)(media =3D=
 %s)",
> +		    port_num, sbl_link_len_str(link->mattr.len),
> +		    sbl_link_media_str(link->mattr.media));
> +
> +	/* calc loop time bounds */
> +	if (link->mattr.len !=3D SBL_LINK_LEN_INVALID) {
> +		err =3D sbl_media_calc_loop_time(sbl, port_num, &min_loop_time);
> +		if (err) {
> +			sbl_dev_err(sbl->dev, "%d: LLR measure calc loop time failed [%d]", p=
ort_num, err);
> +			goto out;
> +		}
> +		/* arbitrary range for max */
> +		max_loop_time =3D min_loop_time + 100 /* ns */;
> +	}
> +	sbl_dev_dbg(sbl->dev, "%d: LLR measure loop time bounds: min =3D %lldns=
, max =3D %lldns",
> +		    port_num, min_loop_time, max_loop_time);
> +
> +	/* measure loop time */
> +	for (x =3D 0; x < SBL_PML_LLR_TIMING_LOOPS; ++x) {
> +
> +		if (sbl_start_timeout(sbl, port_num)) {
> +			sbl_dev_err(sbl->dev, "%d: LLR measure loop time timeout", port_num);
> +			err =3D -ETIMEDOUT;
> +			goto out;
> +		}
> +
> +		if (sbl_base_link_start_cancelled(sbl, port_num)) {
> +			sbl_dev_err(sbl->dev, "%d: LLR measure loop time cancelled", port_num=
);
> +			err =3D -ECANCELED;
> +			goto out;
> +		}
> +
> +		/* start a measurement */
> +		sbl_write64(sbl, base | SBL_PML_STS_LLR_LOOP_TIME_OFFSET, 0ULL);
> +		sbl_read64(sbl, base | SBL_PML_STS_LLR_LOOP_TIME_OFFSET);  /* flush */
> +		/* give the measurement time to complete */
> +		udelay(SBL_PML_LLR_TIMING_MEASURE_DELAY);
> +		/* read the measurement */
> +		val64 =3D sbl_read64(sbl, base | SBL_PML_STS_LLR_LOOP_TIME_OFFSET);
> +
> +		time64 =3D SBL_PML_STS_LLR_LOOP_TIME_LOOP_TIME_GET(val64); /* ns */
> +		sbl_dev_dbg(sbl->dev, "%d: LLR measure time =3D %lldns (%d)", port_num=
, time64, x);
> +
> +		/* if we didn't get a valid time, then wait to retry */
> +		if (!time64)
> +			msleep(SBL_PML_LLR_TIMING_RETRY_DELAY);
> +
> +		/* if we did get a valid time, then check it here */
> +		else if ((time64 >=3D min_loop_time) && (time64 <=3D max_loop_time)) {
> +			/* save the fastest time here */
> +			if (time64 < *llr_loop_time)
> +				*llr_loop_time =3D time64;
> +		}
> +	}
> +
> +	/* check result here */
> +	if (*llr_loop_time =3D=3D SBL_PML_LLR_MAX_LOOP_TIME) {
> +		if (sbl_debug_option(sbl, port_num, SBL_DEBUG_ALLOW_LOOP_TIME_FAIL)) {
> +			sbl_dev_err(sbl->dev, "%d: LLR measure loop time failed (min =3D %lld=
, max =3D %lld, last =3D %lld)",
> +				    port_num, min_loop_time, max_loop_time, time64);
> +			err =3D -ENODATA;
> +			goto out;
> +		}
> +		/* set to max calculated loop time */
> +		*llr_loop_time =3D max_loop_time;
> +	}
> +
> +	sbl_dev_dbg(sbl->dev, "%d: LLR measure loop time =3D %lldns", port_num,=
 *llr_loop_time);
> +	err =3D 0;
> +
> +out:
> +	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_LLR_MEASURE);
> +	return err;
> +}

[Severity: Medium]
In sbl_pml_llr_measure_loop_time_ns(), *llr_loop_time (which points to
link->llr_loop_time in sbl_pml_llr_start()) is initialized to
SBL_PML_LLR_MAX_LOOP_TIME at entry.

If sbl_media_calc_loop_time() fails, or the measurement loop times out, is
cancelled, or fails with SBL_DEBUG_ALLOW_LOOP_TIME_FAIL set, the function
jumps to out and returns a negative error code while leaving
link->llr_loop_time non-zero.

Since sbl_pml_llr_start() only calls sbl_pml_llr_measure_loop_time_ns() when
!link->llr_loop_time, won't a subsequent call to sbl_pml_llr_start() skip
measuring the loop time and program the LLR replay timer and capacity using
that stale value?

[ ... ]

> +/* get LLR mode */
> +static int sbl_pml_llr_mode_get(struct sbl_inst *sbl, int port_num, u32 =
*llr_mode)
> +{
> +	struct sbl_link *link =3D sbl->link + port_num;
> +	int               err =3D -1;
> +
> +	sbl_dev_dbg(sbl->dev, "%d: LLR mode get (%d)", port_num, link->blattr.l=
lr_mode);
> +
> +	switch (link->blattr.llr_mode) {

[ ... ]

> +	case SBL_LLR_MODE_AUTO:
> +		/* check fabric link here */
> +		if (link->blattr.options & SBL_OPT_FABRIC_LINK) {
> +			sbl_dev_dbg(sbl->dev, "%d: LLR mode on fabric", port_num);
> +			goto out_on;
> +		}
> +		/* check ether link here */
> +		if (!(link->blattr.options & SBL_OPT_ENABLE_ETHER_LLR))
> +			goto out_off;
> +		/* check AN options here */
> +		if (link->an_options & AN_OPT_LLR) {
> +			if (link->an_options & AN_OPT_ETHER_LLR) {
> +				if (link->an_options & AN_OPT_HPC_WITH_LLR) {
> +					link->llr_options |=3D SBL_PML_LLR_OPTION_HPC_WIH_LLR;
> +					link->ifg_config =3D SBL_IFG_CONFIG_HPC;
> +					sbl_dev_dbg(sbl->dev, "%d: LLR mode on with HPC from AN", port_num);
> +					goto out_on;
> +				}
> +				sbl_dev_dbg(sbl->dev, "%d: LLR mode on without HPC from AN", port_nu=
m);
> +				goto out_on;
> +			}
> +			goto out_off;
> +		}
> +		/* do loop detect here */
> +		err =3D sbl_pml_llr_detect(sbl, port_num, &(link->llr_mode));
> +		switch (err) {
> +		case 0:
> +			if (link->llr_mode =3D=3D SBL_LLR_MODE_OFF)
> +				goto out_off;
> +			if (link->blattr.options & SBL_OPT_ENABLE_IFG_HPC_WITH_LLR) {
> +				link->llr_options |=3D SBL_PML_LLR_OPTION_HPC_WIH_LLR;
> +				link->ifg_config =3D SBL_IFG_CONFIG_HPC;
> +				sbl_dev_dbg(sbl->dev, "%d: LLR mode on with HPC from LOOP", port_num=
);
> +				goto out_on;
> +			}
> +			sbl_dev_dbg(sbl->dev, "%d: LLR mode on without HPC from LOOP", port_n=
um);
> +			goto out_on;

[ ... ]

> +/* configure */
> +void sbl_pml_llr_config(struct sbl_inst *sbl, int port_num)
> +{
> +	struct sbl_link *link =3D sbl->link + port_num;
> +	u32 base =3D SBL_PML_BASE(port_num);
> +	u64 val64;
> +
> +	sbl_dev_dbg(sbl->dev, "%d: LLR config", port_num);
> +
> +	/* init to original requested */
> +	link->llr_mode =3D link->blattr.llr_mode;

[Severity: Medium]
Should sbl_pml_llr_config() (or sbl_pml_llr_stop()) also reset
link->llr_options to 0?

In sbl_pml_llr_mode_get(), SBL_PML_LLR_OPTION_HPC_WIH_LLR is ORed into
link->llr_options when AN_OPT_HPC_WITH_LLR or SBL_OPT_ENABLE_IFG_HPC_WITH_L=
LR
is active, and sbl_pml_llr_start() checks that bit to call
sbl_pml_mac_hpc_set(). Because link->llr_options is never cleared when the
link is stopped or reconfigured, won't a subsequent link start without HPC
still see SBL_PML_LLR_OPTION_HPC_WIH_LLR set and overwrite TX MAC IFG with
HPC mode?

[ ... ]

> +void sbl_pml_llr_disable(struct sbl_inst *sbl, int port_num)
> +{
> +	u32 base =3D SBL_PML_BASE(port_num);
> +	u64 val64;
> +
> +	sbl_dev_dbg(sbl->dev, "%d: LLR disable", port_num);
> +
> +	val64 =3D sbl_read64(sbl, base | SBL_PML_CFG_LLR_OFFSET);
> +	val64 =3D SBL_PML_CFG_LLR_LLR_MODE_UPDATE(val64, 0ULL); /* LLR OFF */
> +	sbl_write64(sbl, base | SBL_PML_CFG_LLR_OFFSET, val64);
> +	sbl_read64(sbl, base | SBL_PML_CFG_LLR_OFFSET);  /* flush */
> +
> +	sbl_link_info_set(sbl, port_num, SBL_LINK_INFO_LLR_DISABLED);
> +	sbl_link_info_clear(sbl, port_num, SBL_LINK_INFO_LLR_RUN);
> +}
> +EXPORT_SYMBOL(sbl_pml_llr_disable);
> +
> +/**
> + * sbl_pml_llr_enable() - Enable pml llr
> + * @sbl: A slingshot base link device instance
> + * @port_num: port number
> + *
> + * Sets the LLR mode based on the link configuration to
> + * enable the LLR feature.
> + */
> +void sbl_pml_llr_enable(struct sbl_inst *sbl, int port_num)
> +{
> +	struct sbl_link *link =3D sbl->link + port_num;
> +
> +	sbl_dev_dbg(sbl->dev, "%d: LLR enable", port_num);
> +
> +	sbl_pml_llr_mode_set(sbl, port_num, link->llr_mode);
> +}
> +EXPORT_SYMBOL(sbl_pml_llr_enable);

[Severity: Medium]
sbl_pml_llr_disable() sets SBL_LINK_INFO_LLR_DISABLED and clears
SBL_LINK_INFO_LLR_RUN in link->link_info, but sbl_pml_llr_enable() (and
sbl_pml_llr_check_is_ready()) does not update link->link_info when LLR is
re-enabled. Should sbl_pml_llr_enable() clear SBL_LINK_INFO_LLR_DISABLED and
restore SBL_LINK_INFO_LLR_RUN when link->llr_mode !=3D SBL_LLR_MODE_OFF?

[ ... ]

> diff --git a/drivers/net/ethernet/hpe/sbl/sbl_pml_pcs.c b/drivers/net/eth=
ernet/hpe/sbl/sbl_pml_pcs.c
> new file mode 100644
> index 0000000000000..81484e1773943
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sbl/sbl_pml_pcs.c
> @@ -0,0 +1,1085 @@

[ ... ]

> +int  sbl_pml_pcs_am_start(struct sbl_inst *sbl, int port_num)
> +{
> +	struct sbl_link *link;
> +	int err;
> +
> +	err =3D sbl_validate_instance(sbl);
> +	if (err)
> +		return err;
> +
> +	err =3D sbl_validate_port_num(sbl, port_num);
> +	if (err)
> +		return err;
> +
> +	link =3D sbl->link + port_num;
> +
> +	if (!(link->blstate & (SBL_BASE_LINK_STATUS_STARTING | SBL_BASE_LINK_ST=
ATUS_STARTING))) {
> +		sbl_dev_err(sbl->dev, "pcs_am_start %d: wrong state (%s)\n", port_num,
> +			    sbl_link_state_str(link->blstate));
> +		return -ENAVAIL;
> +	}

[Severity: Low]
In sbl_pml_pcs_am_start(), SBL_BASE_LINK_STATUS_STARTING is bitwise-ORed wi=
th
itself when checking link->blstate. Was another SBL_BASE_LINK_STATUS_* flag
intended here, or should the duplicate operand be removed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-cxi-netdev=
-submission-v1-0-8c2c391cc283@hpe.com?part=3D5
