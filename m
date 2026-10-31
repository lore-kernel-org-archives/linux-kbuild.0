Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480532;
	b=t5dBuJP+5UfUw0+BhTW+h7455lhJ6zEFhP/GHIkkwzI2/DcDpIA/FyLcq+/3I3VIhRXI
	 axDhMPHHZi+iyfQ0I8iQ55+OZVWKm6jMiQZI9cWL5XqluDSOShGxASgcBBFSlcUNW9Mkc
	 WpRtg/eyl/A0qU/0ujhK6+3Q3XEwsmZW3bfdo6ZWc7cavINAA4IDF6gHNczKIVKcTBdXl
	 KE/kWqXAl4zyCIzvjBURHPafFsaj/rhy6bmJLokYgQ3M4n4+P44D4x9dLnkO2P43CgwbP
	 opDimR03RGmNknPMTkDi+Ff9WHUhQqsqUBdwMpAs09aRBrK6y5z6JTPcWOeyZbP9iGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480532;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0dEhmjXsL7nPsuwlBtJSYTKnGleVgZrOcdft/ZUzRgA=;
	b=b7znYcY1O4IzKhjb33D73+Idy/kvp7Bz1xQITfYc0uBSlQJkSA+54K7JT/sDCKdlOqa5
	 kb1vAoYCTesNIhaeFhCndovsc82x9avLxVsie5UixHOjgbS2PQS4BhsNJHQXSHD1FFCy4
	 vAdBW9wrTnTH8uUNrMFk54Z7gxcVcB2WQHrDlfbOw0VtYYXEz23SNgapwWWaR7/iWmUpr
	 PQphp3TrYJ9vrjvkMUrIWOzqnY9+sanHHJM+ByYP1x2sKenCNcJtpWomfZFRW/mPDRgo7
	 Rm5Lp16iZQlI+IQcV8pVaE6XNdKEQXUbrq5llkECWk+wNDx5Q8P8xTjRh5MdNrl8LXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SRWP6kGo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98584606A31C
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 21:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SRWP6kGo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C4B1F000C1;
	Sat, 31 Oct 2026 21:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793480531;
	bh=0dEhmjXsL7nPsuwlBtJSYTKnGleVgZrOcdft/ZUzRgA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SRWP6kGo8Svsjq61/juu9uFKFweePZrBojffYu2yRZvL9YOIdptFD3GOYPxWLmMwX
	 5UrCq+pSY4VhgJsfGU4BIAZYYyJCiM6UtjPna++cGIVSuvWsXdRkEtF0uUgagA+yex
	 YbyfF71ZkdvhW8x1gqJv0xCcnT/kKBd875AGAzVZ12lotHJuNqTPBt/hbsR1hECFMi
	 i4S4ajX5yOr77MlatsdZLV0xodMALMDjfQR9mVzh9WyS5BBt82uo9V8jKxp3MgkI0h
	 0fQYYVJS10T4AQF+JWNpC3Xv55DQK/1QPa4anm8Q7by7+m//RM33OtIPPXLQekoh7l
	 7JuJd7m+aMtHQ==
Message-ID: <sashiko-outbox-192140@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/23] net: hpe: sbl: add media, FEC and counter support
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
In-Reply-To: <20261030-cxi-netdev-submission-v1-8-8c2c391cc283@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030-cxi-netdev-submission-v1-8-8c2c391cc283@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 21:02:10 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Medium] net: hpe: sbl: broken FEC warning rate-limiting in sbl_fec_timer=
_work()
- [Medium] net: hpe: sbl: sbl_media_get_len_cm() returns 0 on ignored bad l=
engths
- [Medium] net: hpe: sbl: missing locking in sbl_media_unconfig() and media=
 helpers
- [Low] net: hpe: sbl: commit message inaccurately claims sbl_platform.h up=
date
- [Low] net: hpe: sbl: mismatched blstate checks in sbl_fec_sysfs_sprint()
--

commit 4122557cb9b8a2fb1091d55e09aa0cc6a07db9dc
Author: Doug Ledford <doug.ledford@hpe.com>

net: hpe: sbl: add media, FEC and counter support

This commit adds link counter management, forward error correction (FEC)
configuration and rate monitoring, and physical media configuration and loop
time calculation for the HPE Slingshot Base Link (SBL) driver.

>     net: hpe: sbl: add media, FEC and counter support
>    =20
>     Add media detection, FEC (forward error correction) configuration and
>     the link counters.  sbl_platform.h is updated for the media fields
>     added here.
>    =20
>     checkpatch --strict (100 columns) still reports the following in this
>     patch. They need coordination with the internal repositories this code
>     is maintained in and will be fixed in V2:
>     - WARNING: LONG_LINE (5)
>     - CHECK: BRACES (16), UNNECESSARY_PARENTHESES (10)
>    =20
>     Co-developed-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
>     Signed-off-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
>     Co-developed-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
>     Signed-off-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
>     Signed-off-by: Doug Ledford <doug.ledford@hpe.com>

[Severity: Low]
This isn't a bug, but the commit message states that sbl_platform.h is
updated for the media fields added here, whereas this commit does not touch
sbl_platform.h. Should that sentence be removed from the changelog?

> diff --git a/drivers/net/ethernet/hpe/sbl/sbl_fec.c b/drivers/net/etherne=
t/hpe/sbl/sbl_fec.c
> new file mode 100644
> index 0000000000000..d458ca5e1269d
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sbl/sbl_fec.c

[ ... ]

> +/* print a few warnings (so we can see how things are changing) about hi=
gh
> + * fec lane error rates
> + */
> +static void sbl_fec_rates_warnings(struct sbl_inst *sbl, int port_num,
> +				   int *warning_count)
> +{
> +
> +	struct sbl_link *link =3D sbl->link + port_num;
> +	struct fec_data *fec_data =3D link->fec_data;
> +	struct sbl_fec *fec_prmts =3D fec_data->fec_prmts;
> +	int fecl_warn;
> +	int i;
> +
> +	spin_lock(&fec_prmts->fec_cw_lock);
> +	fecl_warn =3D fec_prmts->fecl_warn;
> +	spin_unlock(&fec_prmts->fec_cw_lock);
> +
> +	if (fecl_warn =3D=3D 0) {
> +		dev_dbg(sbl->dev, "%d: fec ccw warn ignored, threshold is zero", port_=
num);
> +
> +		return;
> +	}
> +
> +	for (i =3D 0; i < SBL_PCS_NUM_FECL_CNTRS; ++i) {
> +		if (fec_prmts->fec_rates->fecl[i] > fecl_warn) {
> +			sbl_link_counters_incr(sbl, port_num, fec_warn);
> +
> +			if (*warning_count > 0) {
> +				dev_warn(sbl->dev,
> +					 "sbl %d: warning, ccw %lld, (%lld %lld %lld %lld %lld %lld %lld %l=
ld)%s\n",
> +					 port_num, fec_prmts->fec_rates->ccw,
> +					 fec_prmts->fec_rates->fecl[0],
> +					 fec_prmts->fec_rates->fecl[1],
> +					 fec_prmts->fec_rates->fecl[2],
> +					 fec_prmts->fec_rates->fecl[3],
> +					 fec_prmts->fec_rates->fecl[4],
> +					 fec_prmts->fec_rates->fecl[5],
> +					 fec_prmts->fec_rates->fecl[6],
> +					 fec_prmts->fec_rates->fecl[7],
> +					 (*warning_count =3D=3D 1) ? " - last" : "");
> +				--*warning_count;
> +			} else {
> +				dev_dbg(sbl->dev,
> +					"sbl %d: warning, ccw %lld, (%lld %lld %lld %lld %lld %lld %lld %ll=
d)\n",
> +					port_num, fec_prmts->fec_rates->ccw,
> +					fec_prmts->fec_rates->fecl[0],
> +					fec_prmts->fec_rates->fecl[1],
> +					fec_prmts->fec_rates->fecl[2],
> +					fec_prmts->fec_rates->fecl[3],
> +					fec_prmts->fec_rates->fecl[4],
> +					fec_prmts->fec_rates->fecl[5],
> +					fec_prmts->fec_rates->fecl[6],
> +					fec_prmts->fec_rates->fecl[7]);
> +			}
> +			return;
> +		}
> +	}
> +}

[ ... ]

> +void sbl_fec_timer_work(struct work_struct *work)
> +{
> +	u32 ucw_thresh_adj;
> +	u32 ccw_thresh_adj;
> +	int port_num;
> +	unsigned long irq_flags;
> +	struct sbl_link *link;
> +	enum sbl_link_down_origin down_origin =3D SBL_LINK_DOWN_ORIGIN_UNKNOWN;
> +	struct sbl_fec *fec_prmts;
> +	int warning_count =3D SBL_MAX_FEC_WARNINGS;
> +	int err;
> +	struct fec_data *fec_data =3D container_of(work, struct fec_data, fec_t=
imer_work);
> +	struct sbl_inst *sbl =3D fec_data->sbl;
> +
> +	port_num =3D fec_data->port_num;
> +	link =3D sbl->link + port_num;
> +	fec_prmts =3D fec_data->fec_prmts;
> +
> +	if ((link->blstate =3D=3D SBL_BASE_LINK_STATUS_UP) && (sbl_pml_pcs_alig=
ned(sbl, port_num))) {
> +		err =3D sbl_fec_rates_update(sbl, port_num, SBL_FEC_MON_PERIOD);
> +
> +		if (!err) {
> +			spin_lock_irqsave(&fec_prmts->fec_cw_lock, irq_flags);
> +			ucw_thresh_adj =3D fec_prmts->fec_ucw_down_thresh_adj;
> +			ccw_thresh_adj =3D fec_prmts->fec_ccw_down_thresh_adj;
> +			spin_unlock_irqrestore(&fec_prmts->fec_cw_lock, irq_flags);
> +
> +			if (sbl_fec_ucw_rate_bad(sbl, port_num, ucw_thresh_adj)) {
> +				/* take the link down */
> +				down_origin =3D SBL_LINK_DOWN_ORIGIN_UCW;
> +				sbl_pml_link_down_async_alert(sbl, port_num, down_origin);
> +				return;
> +			}
> +
> +			if (sbl_fec_ccw_rate_bad(sbl, port_num, ccw_thresh_adj, false)) {
> +				/* take the link down */
> +				down_origin =3D SBL_LINK_DOWN_ORIGIN_CCW;
> +				sbl_pml_link_down_async_alert(sbl, port_num, down_origin);
> +				return;
> +			}
> +
> +			if (sbl_fec_txr_rate_bad(sbl, port_num, 0)) {
> +				/* take the link down */
> +				down_origin =3D SBL_LINK_DOWN_ORIGIN_LLR_TX_REPLAY;
> +				sbl_pml_link_down_async_alert(sbl, port_num, down_origin);
> +				return;
> +			}
> +			sbl_fec_rates_warnings(sbl, port_num, &warning_count);
> +
> +		}
> +
> +	}
> +	sbl_fec_monitor_rearm(link);
> +}

[Severity: Medium]
In sbl_fec_timer_work(), warning_count is a stack-local variable initialized
to SBL_MAX_FEC_WARNINGS (3) on every work execution and passed to
sbl_fec_rates_warnings().

Inside sbl_fec_rates_warnings(), when any lane's fec_rates->fecl[i] exceeds
fecl_warn, it decrements *warning_count once (from 3 to 2) and immediately
returns. When sbl_fec_timer_work() finishes and rearms fec_timer, the
decremented warning_count is lost.

Does this cause dev_warn() to be emitted on every 1-second monitoring
interval without bound while leaving the "*warning_count =3D=3D 1" suffix a=
nd
the dev_dbg() fallback branch unreachable? Should warning_count be stored in
per-link state (such as struct fec_data or struct sbl_link) so that it
persists across sbl_fec_timer_work() runs?

[ ... ]

> +#ifdef CONFIG_SYSFS
> +/**
> + * sbl_fec_sysfs_sprint() - Format FEC parameters status into buffer
> + * @sbl: A slingshot base link device instance
> + * @port_num: port number
> + * @buf: Destination buffer to write the data
> + * @size: Size of @buf in bytes, the output is truncated to fit
> + *
> + * This function formats FEC parameters and writes the result into the
> + * provided buffer typically for use in sysfs output.
> + *
> + * Context: Process context, Acquires lock and release fec_cw_lock <spin=
_lock>
> + *
> + * Return: Number of characters written, at most @size - 1
> + */
> +int sbl_fec_sysfs_sprint(struct sbl_inst *sbl, int port_num, char *buf, =
size_t size)
> +{
> +	u64 ucw_thresh;
> +	u64 ucw_hwm;
> +	u64 ccw_thresh;
> +	u64 ccw_hwm;
> +	u64 llr_tx_replay_thresh;
> +	u64 llr_tx_replay_hwm;
> +	u64 fecl_warn;
> +	int s =3D 0;
> +	struct sbl_link *link =3D sbl->link + port_num;
> +	struct fec_data *fec_data =3D link->fec_data;
> +	struct sbl_fec *fec_prmts =3D fec_data->fec_prmts;
> +
> +	spin_lock(&fec_prmts->fec_cw_lock);
> +	if (link->blstate =3D=3D SBL_BASE_LINK_STATUS_STARTING) {
> +		ucw_thresh =3D fec_prmts->fec_ucw_thresh * fec_prmts->fec_ucw_up_thres=
h_adj / 100;
> +		ccw_thresh =3D fec_prmts->fec_ccw_thresh * fec_prmts->fec_ccw_up_thres=
h_adj / 100;
> +	} else {
> +		ucw_thresh =3D fec_prmts->fec_ucw_thresh * fec_prmts->fec_ucw_down_thr=
esh_adj / 100;
> +		ccw_thresh =3D fec_prmts->fec_ccw_thresh * fec_prmts->fec_ccw_down_thr=
esh_adj / 100;
> +	}
> +
> +	llr_tx_replay_thresh =3D fec_prmts->fec_llr_tx_replay_thresh;
> +	ucw_hwm =3D fec_prmts->fec_ucw_hwm;
> +	ccw_hwm =3D fec_prmts->fec_ccw_hwm;
> +	llr_tx_replay_hwm =3D fec_prmts->fec_llr_tx_replay_hwm;
> +	fecl_warn =3D fec_prmts->fecl_warn;
> +	spin_unlock(&fec_prmts->fec_cw_lock);
> +	if (link->blstate =3D=3D SBL_BASE_LINK_STATUS_UP) {

[Severity: Low]
In sbl_fec_sysfs_sprint(), ucw_thresh and ccw_thresh are computed with a
specific branch for link->blstate =3D=3D SBL_BASE_LINK_STATUS_STARTING, but=
 all
output formatting immediately below is gated on link->blstate =3D=3D
SBL_BASE_LINK_STATUS_UP.

When link->blstate is SBL_BASE_LINK_STATUS_STARTING, those calculated
thresholds are discarded and the function returns 0; conversely, if
link->blstate transitions from SBL_BASE_LINK_STATUS_STARTING to
SBL_BASE_LINK_STATUS_UP between the two unlocked checks, the UP output prin=
ts
the STARTING thresholds.

Was the second check intended to include SBL_BASE_LINK_STATUS_STARTING as
well, or should the SBL_BASE_LINK_STATUS_STARTING branch be dropped?

> diff --git a/drivers/net/ethernet/hpe/sbl/sbl_media.c b/drivers/net/ether=
net/hpe/sbl/sbl_media.c
> new file mode 100644
> index 0000000000000..ec2b4574565e8
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sbl/sbl_media.c

[ ... ]

> +int sbl_media_unconfig(struct sbl_inst *sbl, int port_num)
> +{
> +	struct sbl_link *link;
> +	int err =3D 0;
> +
> +	err =3D sbl_validate_instance(sbl);
> +	if (err)
> +		return err;
> +
> +	sbl_dev_dbg(sbl->dev, "media unconfig\n");
> +
> +	err =3D sbl_validate_port_num(sbl, port_num);
> +	if (err)
> +		return err;
> +
> +	link =3D sbl->link + port_num;
> +
> +	spin_lock(&link->lock);
> +
> +	if (!(link->blstate & (SBL_BASE_LINK_STATUS_UNCONFIGURED |
> +			SBL_BASE_LINK_STATUS_DOWN |
> +			SBL_BASE_LINK_STATUS_STOPPING))) {
> +
> +		sbl_dev_err(sbl->dev, "%d: wrong state (%s) to unconfigure media\n", p=
ort_num,
> +			    sbl_link_state_str(link->blstate));
> +		spin_unlock(&link->lock);
> +		return -EUCLEAN;
> +	}
> +
> +	memset(&link->mattr, 0, sizeof(struct sbl_media_attr));
> +	link->mconfigured =3D false;
> +
> +	link->blstate =3D SBL_BASE_LINK_STATUS_UNCONFIGURED;
> +
> +	spin_unlock(&link->lock);
> +
> +	return err;
> +}
> +EXPORT_SYMBOL(sbl_media_unconfig);

[ ... ]

> +bool sbl_media_check_headshell_reset_supported(struct sbl_inst *sbl, int=
 port_num)
> +{
> +	struct sbl_link *link =3D sbl->link + port_num;
> +
> +	if (!link->mattr.info) {
> +		/* We have no info about media */
> +		sbl_dev_dbg(sbl->dev, "%d: no media info available to check headshell =
reset supported bit", port_num);
> +		return false;
> +	}
> +
> +	if (link->mattr.info & SBL_MEDIA_INFO_SUPPORTS_HEADSHELL_RESET)
> +		return true;
> +
> +	return false;
> +}
> +EXPORT_SYMBOL(sbl_media_check_headshell_reset_supported);
> +
> +static bool sbl_media_check_len_supported(struct sbl_inst *sbl, int port=
_num, u64 len)
> +{
> +	struct sbl_link *link =3D sbl->link + port_num;
> +
> +	switch (len) {
> +	case SBL_LINK_LEN_BACKPLANE:

[ ... ]

> +	case SBL_LINK_LEN_100_000:
> +		return true;
> +	default:
> +		if ((link->blattr.options & SBL_OPT_ALLOW_MEDIA_BAD_LEN) ||
> +		    sbl_debug_option(sbl, port_num, SBL_DEBUG_ALLOW_MEDIA_BAD_LEN)) {
> +			sbl_dev_warn(sbl->dev, "%d: unsupported media len (%lld) - ignored", =
port_num, len);
> +			return true;
> +		}
> +		sbl_dev_err(sbl->dev, "%d: unsupported media len (%lld)", port_num, le=
n);
> +		return false;
> +	}
> +}
> +
> +/* return valid length in cm or 0 */
> +u32 sbl_media_get_len_cm(struct sbl_inst *sbl, int port_num, u64 len)
> +{
> +	if (sbl_media_check_len_supported(sbl, port_num, len)) {
> +		switch (len) {
> +		case SBL_LINK_LEN_BACKPLANE: return 25;

[ ... ]

> +		case SBL_LINK_LEN_100_000:   return 10000;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/* calc loop time based on cable length */
> +int sbl_media_calc_loop_time(struct sbl_inst *sbl, int port_num, u64 *ca=
lc_loop_time)
> +{
> +	struct sbl_link *link;
> +	u32 len;
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
> +	if (!calc_loop_time)
> +		return -EINVAL;
> +
> +	link =3D sbl->link + port_num;
> +	*calc_loop_time =3D 0;
> +
> +	if ((link->blattr.loopback_mode =3D=3D SBL_LOOPBACK_MODE_OFF) ||
> +	    (link->blattr.loopback_mode =3D=3D SBL_LOOPBACK_MODE_INVALID)) {
> +		len =3D sbl_media_get_len_cm(sbl, port_num, link->mattr.len);
> +		if (!len)
> +			return -EBADRQC;
> +	} else
> +		len =3D 0;
> +
> +	sbl_dev_dbg(sbl->dev, "%d: len =3D %d, lb =3D %s",
> +		    port_num, len, sbl_loopback_mode_str(link->blattr.loopback_mode));
> +
> +	if (link->mattr.media =3D=3D SBL_LINK_MEDIA_ELECTRICAL)
> +		*calc_loop_time =3D 2 * len * SBL_MEDIA_NS_PER_M / 100;
> +	else
> +		*calc_loop_time =3D (2 * len * SBL_MEDIA_OPTICAL_NS_PER_M / 100) +
> +			(4 * SBL_MEDIA_OPTICAL_TRANCEIVER_DELAY);
> +	*calc_loop_time +=3D 2 * (SBL_ASIC_TX_DELAY + SBL_ASIC_RX_DELAY);
> +
> +	sbl_dev_dbg(sbl->dev, "%d: calc loop time %lld cm %lld ns",
> +		    port_num, link->mattr.len, *calc_loop_time);
> +
> +	return 0;
> +}
> +
> +/**
> + * sbl_media_get_loop_time_ns() - Get loop time in ns
> + * @sbl: A slingshot base link device instance
> + * @port_num: port number
> + * @measurement_only: set to false when reading
> + *
> + * This function returns available loop time. If not and
> + * 'measurement_only' is true, returns 0 with a warning.
> + * Otherwise attempts to calculate the loop time.
> + *
> + * Return: calculate loop time on success, 0 on failure
> + */
> +u64 sbl_media_get_loop_time_ns(struct sbl_inst *sbl, int port_num,
> +			       bool measurement_only)
> +{
> +	struct sbl_link *link =3D sbl->link + port_num;
> +	u64 calc_loop_time;
> +	int err;
> +
> +	if (!link->mconfigured)
> +		return 0;
> +
> +	if (link->llr_loop_time)
> +		return link->llr_loop_time;
> +
> +	if (measurement_only) {
> +		sbl_dev_warn(sbl->dev, "%d: measured loop time not found", port_num);
> +		return 0;
> +	}
> +
> +	if (!sbl_media_check_len_supported(sbl, port_num, link->mattr.len))
> +		return 0;
> +
> +	err =3D sbl_media_calc_loop_time(sbl, port_num, &calc_loop_time);
> +	if (err)
> +		return 0;
> +
> +	return calc_loop_time;
> +}
> +EXPORT_SYMBOL(sbl_media_get_loop_time_ns);

[Severity: Medium]
When link->mattr.len is not one of the known SBL_LINK_LEN_* constants and
either SBL_OPT_ALLOW_MEDIA_BAD_LEN or SBL_DEBUG_ALLOW_MEDIA_BAD_LEN is set,
sbl_media_check_len_supported() logs a warning and returns true.

However, sbl_media_get_len_cm() has no default case in its switch(len)
statement, so it falls through and returns 0, causing
sbl_media_calc_loop_time() to fail with -EBADRQC on !len. Does that defeat
the SBL_OPT_ALLOW_MEDIA_BAD_LEN and SBL_DEBUG_ALLOW_MEDIA_BAD_LEN options?

In addition, sbl_media_get_loop_time_ns() calls
sbl_media_check_len_supported() before calling sbl_media_calc_loop_time():
- In non-loopback mode, sbl_media_calc_loop_time() immediately calls
  sbl_media_get_len_cm() -> sbl_media_check_len_supported() a second time,
  emitting duplicate log messages.
- In loopback mode, sbl_media_calc_loop_time() sets len =3D 0 without check=
ing
  link->mattr.len, whereas sbl_media_get_loop_time_ns() rejects the call and
  returns 0 if link->mattr.len is unset.

Finally, at the end of sbl_media_calc_loop_time(), sbl_dev_dbg() prints
link->mattr.len (the enum sbl_link_len bitmask) with the unit "cm" instead =
of
len. Should sbl_media_get_len_cm() provide a default fallback length,
sbl_media_get_loop_time_ns() drop the redundant
sbl_media_check_len_supported() check, and sbl_media_calc_loop_time() log l=
en
instead of link->mattr.len?

> +
> +int sbl_media_validate_config(struct sbl_inst *sbl, int port_num)
> +{
> +	struct sbl_link *link =3D sbl->link + port_num;
> +
> +	if (!(link->mconfigured && link->blconfigured))
> +		return -EUCLEAN;
> +
> +	if ((link->mattr.media =3D=3D SBL_LINK_MEDIA_ELECTRICAL) &&
> +	    (link->blattr.config_target =3D=3D SBL_BASE_LINK_CONFIG_PEC))
> +		return 0;
> +
> +	if ((link->mattr.media =3D=3D SBL_LINK_MEDIA_OPTICAL) &&
> +	    (link->blattr.config_target =3D=3D SBL_BASE_LINK_CONFIG_AOC))
> +		return 0;
> +
> +	return -EMEDIUMTYPE;
> +}

[Severity: Medium]
sbl_media_config() and sbl_media_unconfig() check link->blstate and update
link->mattr, link->mconfigured, and link->blstate under link->lock without
acquiring link->busy_mtx. Meanwhile, sbl_base_link_start() and
sbl_base_link_stop() in drivers/net/ethernet/hpe/sbl/sbl_link.c inspect and
update link->blstate and validate media configuration under link->busy_mtx
without holding link->lock:

drivers/net/ethernet/hpe/sbl/sbl_link.c:sbl_base_link_start() {
    ...
	if (link->blstate !=3D SBL_BASE_LINK_STATUS_DOWN) {
		...
	}

	/* only local loopback is possible without media */
	if (link->blattr.loopback_mode !=3D SBL_LOOPBACK_MODE_LOCAL) {
		err =3D sbl_media_validate_config(sbl, port_num);
		...
	}

	link->blstate =3D SBL_BASE_LINK_STATUS_STARTING;
    ...
}

If sbl_media_unconfig() runs concurrently with sbl_base_link_start() (for
example during cable removal on attn1_worker() while cass_lmon() is starting
the link), can sbl_media_unconfig() see SBL_BASE_LINK_STATUS_DOWN, clear
link->mattr and link->mconfigured, and set SBL_BASE_LINK_STATUS_UNCONFIGURED
right before sbl_base_link_start() overwrites link->blstate with
SBL_BASE_LINK_STATUS_STARTING and continues bring-up with zeroed media
attributes? Similarly, since sbl_media_unconfig() allows
SBL_BASE_LINK_STATUS_STOPPING, can a concurrent sbl_base_link_stop()
overwrite link->blstate back to SBL_BASE_LINK_STATUS_DOWN at completion even
though link->mconfigured is false?

Also, unlike sbl_media_check_mode_supported(), sbl_media_sysfs_sprint(), and
sbl_media_type_sysfs_sprint() which acquire link->lock,
sbl_media_check_headshell_reset_supported(), sbl_media_calc_loop_time(),
sbl_media_get_loop_time_ns(), and sbl_media_validate_config() read
link->mconfigured and link->mattr without holding link->lock. Should
link->blstate and link->mattr accesses be synchronized consistently across
these functions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-cxi-netdev=
-submission-v1-0-8c2c391cc283@hpe.com?part=3D8
