Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480527;
	b=tPy7yv/g5+txPBjKMqhPQIMA359CYCaJulPeM3m3hX0tJjG/JxG8OKUUqckTN5C17Z4S
	 BHoxQnVwvPqQwcV3Jpm6eYHu7WheY0HTYsOwY//acw0R6tp9LMyYkXe6ut4ffpxOtUT9W
	 4NTcMwe4yInWHzT5fHpNGSTNq1LU1OyON1FjihA7Wf9AUbbLxug9LOOWqLokyZ/ZyEBxZ
	 KyMFsStstWGrr9Qk74rXla8XiEYICQl6nf/juDta8q/HP2aPk6XAF3bwkVrG+yswzDVSo
	 k8UoxErs8wnx2/1UDFbHtIknYtIUjvMf1g27WIWxXc7d/2eoH2IAm8qgHNp1J1GxP8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480527;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9UrlTP7shYKnlaOzCMfYtXP+gDWjo/2f99ZCMpSiLcw=;
	b=IGLHT//F6qxAC9OEqRhkv9wUOK89zwRPUInMNuyGrXGNwSQBead57CfcvWdAyjJUAyir
	 AWUe6lPepT255R48vpklYoGXy6LfG9OozXN573suWGPEBUo49Bq+SYfnPuABR6HxO5xOo
	 DoF543TpLo9BeuuIv4i+/keBbuuIF9FZe97e0d47wnFNRFEIZoGr+/Ss89pzQTzoc5QVO
	 t0smecBSKkDFJ+7+sNmldjandUoxkAnqBCUSoTg049ofb86CU6JMjp18YZad0g/ezqsAd
	 0urWW02WNBm9q9Boh8C+t+a50rrkcflcw+V6f0pOYHGU2kfYvZZSFFrXVT+4PosLa1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ArI0riMw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AB2606A31D
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 21:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ArI0riMw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE7661F000C1;
	Sat, 31 Oct 2026 21:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793480526;
	bh=9UrlTP7shYKnlaOzCMfYtXP+gDWjo/2f99ZCMpSiLcw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ArI0riMwDvsB8DbE8mVjJ1OLp4M2xvfLvumNyiAFWe99UpXu7GdzrYTa7iI2tu8NE
	 mz7FHbYDX8uhlKQ1OnQomrXT7ayiud3MBYR4S5r+s1d1NOnIEnKl672WOhnqpZ605x
	 a0/3VpZJ37tKXyRpO0MjDMGbn70DbsEerOV23jS1BpIBqU3dpERWBjhyLDyl4kN+uu
	 sZzvzV5ztlwAAWWD59iuGt6qf4v/0x1YXcelx7jkwb5IIDkvjm9k98zYAvNmu9VDMJ
	 gnKNw7mUSUyHe7RfHk+huKFpE7+45UW6fI1cIVDP7G9DnnqEKmsM2j1PczWetsqU2K
	 GatilTYdAPQsg==
Message-ID: <sashiko-outbox-192136@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/23] net: hpe: sbl: add the SerDes layer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Doug Ledford" <doug.ledford@hpe.com>, "Slingshot Open Source Team" <slingshot-os-team@groups.ext.hpe.com>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Richard
 Cochran" <richardcochran@gmail.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Guenter
 Roeck" <linux@roeck-us.net>
Cc: linux-kbuild@vger.kernel.org, "Mamila Santosh" <santosh-kumar.mamila@hpe.com>
In-Reply-To: <20261030-cxi-netdev-submission-v1-4-8c2c391cc283@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030-cxi-netdev-submission-v1-4-8c2c391cc283@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 21:02:05 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:
- [High] net: hpe: sbl: out-of-bounds ring indexing and broken flash on NIC1
- [High] net: hpe: sbl: lock order inversion in sbl_spico_reset()
- [High] net: hpe: sbl: unbounded retry loop in sbl_serdes_tuning() on eye =
failure
- [Medium] net: hpe: sbl: leak of tps on error in sbl_check_serdes_tuning_p=
arams()
- [Medium] net: hpe: sbl: unlocked clear and valid magic in sbl_serdes_rese=
t()
- [Medium] net: hpe: sbl: corrupted tuning_params left valid on save error
- [Medium] net: hpe: sbl: missing SBL_SC_MAX_INTR check on num_intr in conf=
ig
- [Medium] net: hpe: sbl: stale values.num_intr and uninit result in sbl_se=
rdes_config()
- [Medium] net: hpe: sbl: 16-bit pointer cast of uint in sbl_serdes_get_fw_=
vers()
- [Medium] net: hpe: sbl: sbl_port_dfe_tune_start() tunes TX-only SerDes la=
nes
- [Medium] net: hpe: sbl: SPICO_INT_SBMS_FW_STS used as SBus reg addr in fl=
ash_safe()
- [Low] net: hpe: sbl: commit message describes absent file and ops table
- [Low] net: hpe: sbl: pointer-sign mismatches in sbl_serdes_fn.c
--

commit 8fdddc2fa6224d724654d04f766be5b1dd3e769a
Author: Doug Ledford <doug.ledford@hpe.com>

net: hpe: sbl: add the SerDes layer

This commit adds the SerDes layer implementation in sbl_serdes.c and
sbl_serdes_fn.c to manage SerDes firmware loading, per-lane configuration,
tuning, and status reporting.

>     net: hpe: sbl: add the SerDes layer
>    =20
>     Add the SerDes layer: per-lane configuration, the autogenerated lane
>     map, and the function-pointer table that lets the PML layer drive the
>     SerDes without knowing which SerDes core is present.
>    =20
>     sbl_serdes_map_autogen.h is generated from the hardware lane
>     description and is kept in generated form, so style checkers will flag
>     it for line length and macro layout.
>    =20
>     checkpatch --strict (100 columns) still reports the following in this
>     patch. They need coordination with the internal repositories this code
>     is maintained in and will be fixed in V2:
>     - WARNING: LONG_LINE (45), BLOCK_COMMENT_STYLE (36), ALLOC_WITH_SIZEOF
>       (2), ENOTSUPP (1), LONG_LINE_COMMENT (1), LONG_LINE_STRING (1),
>       TYPO_SPELLING (1)
>     - CHECK: UNNECESSARY_PARENTHESES (37), BRACES (13), ALLOC_SIZEOF_STRU=
CT
>       (2), PARENTHESIS_ALIGNMENT (2), COMPARISON_TO_NULL (1), LINE_SPACING
>       (1)
>    =20
>     Co-developed-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
>     Signed-off-by: Mamila Santosh <santosh-kumar.mamila@hpe.com>
>     Signed-off-by: Doug Ledford <doug.ledford@hpe.com>

[Severity: Low]
Does the commit message match the contents of this patch?

The changelog states that this patch adds sbl_serdes_map_autogen.h and a
function-pointer table for driving the SerDes layer, but this commit only
adds drivers/net/ethernet/hpe/sbl/sbl_serdes.c and
drivers/net/ethernet/hpe/sbl/sbl_serdes_fn.c with direct C functions.

No file named sbl_serdes_map_autogen.h is present in the tree (the lane map
headers include/uapi/ethernet/sbl_serdes_map.h and
include/uapi/ethernet/sbl_serdes_map_init.h were added in commit
16e18859cf46 ("net: hpe: sbl: Add header files for SBL")).

> diff --git a/drivers/net/ethernet/hpe/sbl/sbl_serdes.c b/drivers/net/ethe=
rnet/hpe/sbl/sbl_serdes.c
> new file mode 100644
> index 0000000000000..4db5bb1a0bb91
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sbl/sbl_serdes.c

[ ... ]

> @@ -382,56 +382,56 @@ int sbl_serdes_reset(struct sbl_inst *sbl, int port=
_num)
>  	link =3D sbl->link + port_num;
>  	link->sstate =3D SBL_SERDES_STATUS_RESETTING;
> =20
>  	/* optionally clear any saved tuning params */
>  	if (link->blattr.options & SBL_OPT_RESET_CLEAR_PARAMS) {
>  		link->tuning_params.tp_state_hash0 =3D 0;
>  		link->tuning_params.tp_state_hash1 =3D 0;
>  		for (serdes =3D 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
>  			memset(link->tuning_params.params[serdes].ctle, 0,
>  			       sizeof(u16) * NUM_CTLE_PARAMS);
>  			memset(link->tuning_params.params[serdes].ffe, 0,
>  			       sizeof(u16) * NUM_FFE_PARAMS);
>  			memset(link->tuning_params.params[serdes].dfe, 0,
>  			       sizeof(u16) * NUM_DFE_PARAMS);
>  			memset(link->tuning_params.params[serdes].rxvs, 0,
>  			       sizeof(u16) * NUM_RXVS_PARAMS);
>  			memset(link->tuning_params.params[serdes].rxvc, 0,
>  			       sizeof(u16) * NUM_RXVC_PARAMS);
>  			memset(link->tuning_params.params[serdes].rsdo, 0,
>  			       sizeof(u16) * NUM_RSDO_PARAMS);
>  			memset(link->tuning_params.params[serdes].rsdc, 0,
>  			       sizeof(u16) * NUM_RSDC_PARAMS);
>  			memset(link->tuning_params.params[serdes].rsto, 0,
>  			       sizeof(u16) * NUM_RSTO_PARAMS);
>  			memset(link->tuning_params.params[serdes].rstc, 0,
>  			       sizeof(u16) * NUM_RSTC_PARAMS);
>  			memset(link->tuning_params.params[serdes].eh, 0,
>  			       sizeof(u16) * NUM_EH_PARAMS);
>  			memset(link->tuning_params.params[serdes].gtp, 0,
>  			       sizeof(u16) * NUM_GTP_PARAMS);
>  			memset(link->tuning_params.params[serdes].dccd, 0,
>  			       sizeof(u16) * NUM_DCCD_PARAMS);
>  			memset(link->tuning_params.params[serdes].p4lv, 0,
>  			       sizeof(u16) * NUM_P4LV_PARAMS);
>  			memset(link->tuning_params.params[serdes].afec, 0,
>  			       sizeof(u16) * NUM_AFEC_PARAMS);
>  		}
>  	}

[Severity: Medium]
Can clearing link->tuning_params in sbl_serdes_reset() when
SBL_OPT_RESET_CLEAR_PARAMS is set race with concurrent readers or writers
and leave magic set to SBL_TUNING_PARAM_MAGIC?

Other accessors of link->tuning_params (sbl_serdes_get_tuning_params(),
sbl_serdes_set_tuning_params(), sbl_serdes_invalidate_tuning_params(), and
sbl_serdes_tuning()) serialize access under link->tuning_params_mtx. Here,
link->tuning_params is modified without holding link->tuning_params_mtx
(and in sbl_serdes_set_tuning_params(), tp_state_hash0 and tp_state_hash1
are also read for sbl_dev_dbg() after unlocking link->tuning_params_mtx).

In addition, sbl_serdes_reset() does not clear link->tuning_params.magic =
=3D 0
like sbl_serdes_invalidate_tuning_params() does. Because magic remains
SBL_TUNING_PARAM_MAGIC, a subsequent call to sbl_serdes_get_tuning_params()
will copy out the zeroed tuning_params structure instead of returning
-ENODATA.

> diff --git a/drivers/net/ethernet/hpe/sbl/sbl_serdes_fn.c b/drivers/net/e=
thernet/hpe/sbl/sbl_serdes_fn.c
> new file mode 100644
> index 0000000000000..f085d5c41da13
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sbl/sbl_serdes_fn.c

[ ... ]

> +void sbl_serdes_get_fw_vers(struct sbl_inst *sbl, int port_num, int serd=
es,
> +			    uint *fw_rev, uint *fw_build)
> +{
> +	if (sbl_serdes_spico_int(sbl, port_num, serdes, SPICO_INT_CM4_REV_ID,
> +				 SPICO_INT_DATA_NONE, (uint16_t *)fw_rev,
> +				SPICO_INT_RETURN_RESULT)) {
> +		/* Failure expected when Spico is in reset */
> +		dev_dbg(sbl->dev, "p%ds%d: Failed to read firmware rev!", port_num, se=
rdes);
> +		*fw_rev =3D 0x0;
> +	}
> +	if (sbl_serdes_spico_int(sbl, port_num, serdes, SPICO_INT_CM4_BUILD_ID,
> +				 SPICO_INT_DATA_NONE, (uint16_t *)fw_build,
> +				SPICO_INT_RETURN_RESULT)) {
> +		/* Failure expected when Spico is in reset */
> +		dev_dbg(sbl->dev, "p%ds%d: Failed to read firmware build!", port_num, =
serdes);
> +		*fw_build =3D 0x0;
> +	}
> +}

[Severity: Medium]
Does casting uint *fw_rev and uint *fw_build to uint16_t * in
sbl_serdes_get_fw_vers() leave the upper 16 bits uninitialized on success
and write to the wrong halfword on big-endian architectures?

sbl_serdes_spico_int() only writes a 16-bit u16 value through its result
pointer. When sbl_serdes_spico_int() succeeds, the other 16 bits of the
32-bit uint pointed to by fw_rev and fw_build are never written by
sbl_serdes_get_fw_vers() (also note that in sbl_sbm_fw_sysfs_sprint() in
sbl_serdes.c, uint fw_rev is declared without initialization alongside
fw_build =3D 0).

[ ... ]

> +/* Parse the vers string into rev and build */
> +static int sbl_parse_version_string(struct sbl_inst *sbl, const char *fw=
_fname,
> +				    int *fw_rev, int *fw_build)
> +{
> +	char  rev_str[SBL_MAX_STR_LEN];
> +	char  build_str[SBL_MAX_STR_LEN];
> +	char  *p;
> +	int err;
> +
> +	p =3D strstr(fw_fname, ".");
> +	if (p =3D=3D NULL) {
> +		sbl_dev_err(sbl->dev, "Bad firmware file name: %s", fw_fname);
> +		return -EINVAL;
> +	}
> +
> +	if (strlen(p) < strlen(".0x0000_0000")) {
> +		sbl_dev_err(sbl->dev, "Bad firmware file name: %s", fw_fname);
> +		return -EINVAL;
> +	}
> +
> +	memcpy(rev_str, &(p[3]), SBL_FW_REV_LEN);
> +	rev_str[SBL_FW_REV_LEN] =3D '\n';
> +	rev_str[SBL_FW_REV_LEN + 1] =3D '\0';
> +	memcpy(build_str, &(p[8]), SBL_FW_BUILD_LEN);
> +	build_str[SBL_FW_BUILD_LEN] =3D '\n';
> +	build_str[SBL_FW_BUILD_LEN + 1] =3D '\0';
> +
> +	err =3D kstrtou32(rev_str, 16, fw_rev);
> +	if (err) {
> +		sbl_dev_err(sbl->dev, "Failed to convert %s to an integer [%d]", rev_s=
tr, err);
> +		return err;
> +	}
> +
> +	err =3D kstrtou32(build_str, 16, fw_build);
> +	if (err) {
> +		sbl_dev_err(sbl->dev, "Failed to convert %s to an integer [%d]", build=
_str, err);
> +		return err;
> +	}
> +	return 0;
> +}

[Severity: Low]
Will passing signed int *fw_rev and int *fw_build to kstrtou32() here, and
passing signed __s16 * parameter array elements (ctle, ffe, dfe, rxvs, rxvc,
rsdo, rsdc, rsto, rstc, eh, gtp, dccd, p4lv, afec) from struct
sbl_serdes_params to the u16 * result parameter of sbl_serdes_spico_int() in
sbl_get_serdes_tuning_params(), trigger -Wpointer-sign compiler warnings?

> +
> +void sbl_sbm_get_fw_vers(struct sbl_inst *sbl, int sbus_ring, uint *fw_r=
ev, uint *fw_build)
> +{
> +	uint sbus_addr =3D SBUS_ADDR(sbus_ring, SBUS_BCAST_SBM_SPICO);
> +
> +	/* SBUS Critical Section */
> +	mutex_lock(&sbl->sbus_ring_mtx[sbus_ring]);
> +
> +	if (sbl_sbm_spico_int(sbl, sbus_addr, SPICO_INT_SBMS_REV_ID,
> +			      SPICO_INT_DATA_NONE, fw_rev)) {
> +		/* Failure expected when Spico is in reset */
> +		dev_dbg(sbl->dev, "sbm%d: Failed to read firmware rev from 0x%x", sbus=
_ring, sbus_addr);
> +		*fw_rev =3D 0x0;
> +	}
> +	if (sbl_sbm_spico_int(sbl, sbus_addr, SPICO_INT_SBMS_BUILD_ID,
> +			      SPICO_INT_DATA_NONE, fw_build)) {
> +		/* Failure expected when Spico is in reset */
> +		dev_dbg(sbl->dev, "sbm%d: Failed to read firmware build from 0x%x", sb=
us_ring, sbus_addr);
> +		*fw_build =3D 0x0;
> +	}
> +	mutex_unlock(&sbl->sbus_ring_mtx[sbus_ring]);
> +}
> +
> +int sbl_sbm_firmware_flash(struct sbl_inst *sbl)
> +{
> +	int err;
> +
> +	err =3D sbl_sbm_firmware_flash_ring(sbl, 0,
> +					  sbl->switch_info->num_sbus_rings - 1, false);
> +	if (err)
> +		/* sending port 0 in event as this event doesn't apply to any specific=
 port */
> +		sbl_async_alert(sbl, 0, SBL_ASYNC_ALERT_SBM_FW_LOAD_FAILURE, NULL, 0);
> +
> +	return err;
> +}
> +
> +int sbl_sbm_firmware_flash_ring(struct sbl_inst *sbl, int first_ring,
> +				int last_ring, bool force)
> +{
> +	bool flash_needed, fw_requested =3D false;
> +	int sbus_ring;
> +	int err;
> +	int fw_rev, fw_build;
> +	const struct firmware *fw =3D NULL;
> +
> +	if ((last_ring < first_ring) || (first_ring < 0) ||
> +	    (last_ring > sbl->switch_info->num_sbus_rings - 1)) {
> +		sbl_dev_err(sbl->dev, "Invalid rings specified first:%d last:%d",
> +			    first_ring, last_ring);
> +		return -EINVAL;
> +	}

[ ... ]

> +static void sbl_serdes_firmware_validation(struct sbl_inst *sbl, const s=
truct firmware *fw,
> +					   u32 sbus_addr, u32 result, u32 sbus_ring)
> +{
> +	int rc, i;
> +	u8 data;
> +	bool corruption_found =3D false;
> +
> +	for (i =3D 0; i < fw->size; ++i) {
> +		if (i % 2 =3D=3D 0) {
> +			rc =3D sbl_sbus_wr(sbl, sbus_addr,
> +					SPICO_SBR_ADDR_IMEM, i / 2);
> +			if (rc)
> +				break;
> +			rc =3D sbl_sbus_rd(sbl, sbus_addr,
> +					 SPICO_SBR_ADDR_RDATA,
> +					&result);
> +			if (rc)
> +				break;
> +			data =3D (result & 0xff00) >> 8;
> +		} else {
> +			data =3D result & 0xff;
> +		}
> +		if (data !=3D fw->data[i]) {
> +			corruption_found =3D true;
> +			sbl_dev_warn(sbl->dev, "0x%x: Act 0x%4.4x Exp 0x%4.4x", i, data, fw->=
data[i]);
> +		}
> +	}
> +	rc =3D sbl_sbus_wr(sbl, sbus_addr, SPICO_SBR_ADDR_CTL,
> +			 SPICO_SBR_DATA_IMEM_CNTL_DIS);
> +	if (rc)
> +		sbl_dev_err(sbl->dev, "SBM Imem rd disable failed [%d]", rc);
> +	if (corruption_found)
> +		sbl_dev_err(sbl->dev, "r%d: SBM FW corruption found", sbus_ring);
> +	else
> +		sbl_dev_info(sbl->dev, "r%d: No SBM FW corruption found", sbus_ring);
> +}
> +
> +int sbl_serdes_firmware_flash_safe(struct sbl_inst *sbl, int port_num,
> +				   bool force)
> +{
> +	int rc;
> +	u32 sbus_addr, crc_result, sbus_ring;
> +	u32 curr_fw_rev =3D 0, curr_fw_build =3D 0;
> +	u32 result;
> +	const struct firmware *fw =3D NULL;
> +	int fw_rev, fw_build;
> +	int serdes =3D 0;
> +
> +	if (!sbl->is_hw)
> +		return 0;
> +
> +	if (port_num =3D=3D SBL_ALL_PORTS)
> +		return -ENOTSUPP;
> +
> +	sbus_ring =3D sbl->switch_info->ports[port_num].serdes[serdes].sbus_rin=
g;
> +
> +	/* First, try the FW flash */
> +	rc =3D sbl_serdes_firmware_flash(sbl, port_num, force);
> +	if (rc)
> +		goto sbm_fw_reload;
> +
> +	/* Now, validate the SerDes FW - this also validates
> +	 * SPICO interrupts are working correctly.
> +	 */
> +	rc =3D sbl_parse_version_string(sbl, sbl->iattr.serdes_fw_fname,
> +				      &fw_rev, &fw_build);
> +	if (rc) {
> +		sbl_dev_err(sbl->dev,
> +			    "Failed to parse version string %s [%d]",
> +			sbl->iattr.sbm_fw_fname, rc);
> +		return rc;
> +	}

[ ... ]

> + sbm_fw_reload:
> +	if (sbl_debug_option(sbl, port_num, SBL_DEBUG_INHIBIT_RELOAD_SBM_FW)) {
> +		sbl_dev_warn(sbl->dev, "p%d: SBus Master FW reload inhibited", port_nu=
m);
> +		return rc;
> +	}
> +
> +	/* We may trigger a sbus master FW reload from multiple ports at the
> +	 * same time. Ensure we only actually reload the firmware once per
> +	 * sbus ring
> +	 */
> +	sbl->reload_sbm_fw[sbus_ring] =3D true;
> +	mutex_lock(SBM_FW_MTX(sbl, sbus_ring));
> +	if (!sbl->reload_sbm_fw[sbus_ring]) {
> +		sbl_dev_info(sbl->dev, "r%d: Sbus master FW reload no longer needed", =
sbus_ring);
> +	} else {

[ ... ]

> +		/* FW Status */
> +		rc =3D sbl_sbus_rd(sbl, sbus_addr, SPICO_INT_SBMS_FW_STS,
> +				 &result);
> +		if (rc) {
> +			sbl_dev_err(sbl->dev,
> +				    "p%d(0x%x): FW status read failed (%d)!",
> +				port_num, sbus_addr, rc);
> +		} else {
> +			sbl_dev_info(sbl->dev, "p%d(0x%x): FW status: 0x%x",
> +				     port_num, sbus_addr, result);
> +		}

[Severity: Medium]
Should the FW status query in sbl_serdes_firmware_flash_safe() call
sbl_sbm_spico_int() instead of sbl_sbus_rd()?

SPICO_INT_SBMS_FW_STS (0x20) is defined as an SBus Master SPICO interrupt
code alongside SPICO_INT_SBMS_REV_ID, SPICO_INT_SBMS_BUILD_ID, and
SPICO_INT_SBMS_DO_CRC, whereas valid SBus receiver register addresses
(SPICO_SBR_ADDR_*) are 0x0..0x1b and 0xff. Passing SPICO_INT_SBMS_FW_STS to
sbl_sbus_rd() reads register 0x20 instead of issuing the SPICO interrupt.

Also in this recovery path:
1. In sbl_serdes_firmware_validation(), if sbl_sbus_wr() or sbl_sbus_rd()
   fails mid-loop and breaks out early while corruption_found is false, it
   still logs "No SBM FW corruption found".
2. Earlier in sbl_serdes_firmware_flash_safe(), when
   sbl_parse_version_string() fails on sbl->iattr.serdes_fw_fname, the
   error message logs sbl->iattr.sbm_fw_fname instead.

> +
> +		rc =3D request_firmware(&fw, sbl->iattr.sbm_fw_fname, sbl->dev);
> +		if (rc !=3D 0) {
> +			sbl_dev_err(sbl->dev, "firmware request failed [%d]", rc);
> +		} else {
> +			sbl_dev_info(sbl->dev,
> +				     "p%d(0x%x): Checking SBM FW for corruption...",
> +				 port_num, sbus_addr);
> +			rc =3D sbl_sbus_wr(sbl, sbus_addr, SPICO_SBR_ADDR_CTL,
> +					 SPICO_SBR_DATA_IMEM_CNTL_EN_RD);
> +			if (rc)
> +				sbl_dev_err(sbl->dev, "SBM Imem rd enable failed [%d]", rc);
> +			else
> +				sbl_serdes_firmware_validation(sbl, fw, sbus_addr, result, sbus_ring=
);
> +
> +			release_firmware(fw);
> +		}
> +
> +		mutex_unlock(SBUS_RING_MTX(sbl, sbus_ring));
> +
> +		/* Now, try reloading the sbus master FW */
> +		rc =3D sbl_sbm_firmware_flash_ring(sbl, sbus_ring, sbus_ring, true);
> +		if (rc)
> +			sbl_dev_err(sbl->dev, "r%d: SBM FW flash failed (%d)!", sbus_ring, rc=
);
> +		else
> +			sbl_dev_info(sbl->dev, "r%d: SBM FW flash succeeded", sbus_ring);
> +
> +		sbl->reload_sbm_fw[sbus_ring] =3D false;
> +	}
> +	mutex_unlock(SBM_FW_MTX(sbl, sbus_ring));

[Severity: High]
Does indexing by hardware sbus_ring cause out-of-bounds array accesses and
failed firmware flashing on Sawtooth NIC1?

In sbl_new_instance() (drivers/net/ethernet/hpe/sbl/sbl_inst.c),
sbl->sbus_ring_mtx, sbl->sbm_fw_mtx, sbl->reload_sbm_fw, and
sbl->sbm_fw_reload_count are allocated with sbl->switch_info->num_sbus_rings
(1) element, so only index 0 is valid. However, on Sawtooth NIC1
(cas_nic1_switch_info / SBL_CASSINI_NIC1_SW_INFO_INITIALIZER),
num_sbus_rings is 1 while ports[0].serdes[0..3].sbus_ring is 1.

When running on NIC1:
1. sbl_serdes_firmware_flash_safe() reads sbus_ring =3D 1 from
   sbl->switch_info->ports[port_num].serdes[serdes].sbus_ring and accesses
   sbl->reload_sbm_fw[1] out of bounds on the 1-element array (and also
   writes sbl->reload_sbm_fw[sbus_ring] =3D true before locking SBM_FW_MTX =
and
   clears it to false even when sbl_sbm_firmware_flash_ring() fails).
2. sbl_serdes_firmware_flash_safe() calls
   sbl_sbm_firmware_flash_ring(sbl, 1, 1, true), which fails the check
   last_ring > sbl->switch_info->num_sbus_rings - 1 (1 > 0) and returns
   -EINVAL.
3. sbl_sbm_firm_upload() increments sbl->sbm_fw_reload_count[sbus_ring] out
   of bounds when sbus_ring is 1, and sbl_sbm_get_fw_vers() indexes
   &sbl->sbus_ring_mtx[sbus_ring] directly instead of using
   SBUS_RING_MTX(sbl, sbus_ring).
4. Functions that loop from 0 to num_sbus_rings - 1, including
   sbl_sbm_firmware_flash(), sbl_serdes_firm_upload() when port_num =3D=3D
   SBL_ALL_PORTS, and sbl_apply_sbus_divider(), only iterate ring 0 and
   never address NIC1's hardware ring 1 (and in sbl_serdes_firmware_flash(),
   looping sr over mutex_lock(SBM_FW_MTX(sbl, sr)) would self-deadlock if
   num_sbus_rings > 1 because SBM_FW_MTX ignores sr).

[ ... ]

> +static int sbl_get_serdes_tuning_params(struct sbl_inst *sbl, int port_n=
um,
> +					struct sbl_tuning_params *tps)
> +{
> +	int i, serdes, err;
> +
> +	if (!tps)
> +		return -EINVAL;
> +
> +	tps->magic =3D SBL_TUNING_PARAM_MAGIC;
> +	tps->version =3D SBL_TUNING_PARAM_VERSION;

[ ... ]

> +int sbl_check_serdes_tuning_params(struct sbl_inst *sbl, int port_num)
> +{
> +	int i, serdes, err;
> +	struct sbl_tuning_params *tps;
> +	int min, max;
> +	int num_oob_params;
> +	int max_oob_params =3D SBL_MAX_OOB_SERDES_PARAMS;
> +
> +	tps =3D kzalloc(sizeof(struct sbl_tuning_params), GFP_KERNEL);
> +	if (!tps)
> +		return -ENOMEM;

[ ... ]

> +		if (num_oob_params > max_oob_params) {
> +			sbl_dev_err(sbl->dev, "p%ds%d: Too many tuning params out of bounds(%=
d, max %d)!",
> +				    port_num, serdes, num_oob_params, max_oob_params);
> +			return -EDQUOT;
> +		} else if (num_oob_params > 0) {
> +			sbl_dev_info(sbl->dev, "p%ds%d: Some tuning params out of bounds(%d, =
max %d)",
> +				     port_num, serdes, num_oob_params, max_oob_params);
> +		}
> +	}
> +
> +	kfree(tps);
> +	return 0;
> +}

[Severity: Medium]
Does sbl_check_serdes_tuning_params() leak tps when returning -EDQUOT?

When num_oob_params > max_oob_params, the function returns -EDQUOT directly
without freeing tps allocated at the start of
sbl_check_serdes_tuning_params().

> +
> +int sbl_save_serdes_tuning_params(struct sbl_inst *sbl, int port_num)
> +{
> +	int err;
> +
> +	sbl->link[port_num].tuning_params.tp_state_hash0 =3D
> +		sbl_get_tp_hash0(sbl, port_num);
> +	sbl->link[port_num].tuning_params.tp_state_hash1 =3D
> +		sbl_get_tp_hash1(sbl, port_num);
> +	sbl_dev_dbg(sbl->dev, "Updated hash0 to 0x%llx, hash1 to 0x%llx",
> +		    sbl->link[port_num].tuning_params.tp_state_hash0,
> +		sbl->link[port_num].tuning_params.tp_state_hash1);
> +
> +	err =3D sbl_get_serdes_tuning_params(sbl, port_num,
> +					   &sbl->link[port_num].tuning_params);
> +
> +	return err;
> +}

[Severity: Medium]
What happens to link->tuning_params if sbl_get_serdes_tuning_params() fails
partway through when called from sbl_save_serdes_tuning_params()?

sbl_save_serdes_tuning_params() writes tp_state_hash0 and tp_state_hash1
in-place, and sbl_get_serdes_tuning_params() sets tps->magic =3D
SBL_TUNING_PARAM_MAGIC and tps->version =3D SBL_TUNING_PARAM_VERSION before
reading the per-lane parameters from hardware.

If a SPICO read or the sbl_validate_serdes_fw_vers() check fails after lane
0's CTLE/FFE/DFE values have been written, sbl_serdes_tuning() logs a
warning and continues without invalidating link->tuning_params. That leaves
partially populated tuning parameters marked with valid magic and matching
state hashes, so sbl_serdes_get_tuning_params() will return corrupted data
and sbl_is_retune() will treat the incomplete parameters as valid on the
next link start.

[ ... ]

> +int sbl_serdes_dfe_tune_wait(struct sbl_inst *sbl, int port_num)
> +{

[ ... ]

> +		if (!in_progress_mask)
> +			break;
> +
> +		msleep(link->blattr.dfe_poll_interval);
> +	} while (time_is_after_jiffies(last_jiffy) &&
> +		 !sbl_start_timeout(sbl, port_num) &&
> +		 !sbl_base_link_start_cancelled(sbl, port_num));
> +
> +	if (serdes_mask =3D=3D tuned_mask)
> +		return 0;
> +
> +	if (sbl_base_link_start_cancelled(sbl, port_num))
> +		return -ECANCELED;
> +
> +	if (sbl_start_timeout(sbl, port_num)) {
> +		sbl_dev_dbg(sbl->dev, "p%d: start timeout waiting for DFE to tune to c=
omplete\n",
> +			    port_num);
> +		return -ETIMEDOUT;
> +	}
> +
> +	/* just didnt finish */
> +	sbl_dev_dbg(sbl->dev, "p%d serdes_mask:0x%x: Timeout waiting for DFE to=
 complete (timeout:%ds)",
> +		    port_num, serdes_mask, link->blattr.dfe_timeout);
> +	return -ETIME;
> +}
> +
> +int sbl_port_dfe_tune_start(struct sbl_inst *sbl, int port_num, bool is_=
retune)
> +{
> +	int err, serdes;
> +
> +	sbl_dev_dbg(sbl->dev, "p%d: DFE tune retune:%d", port_num, is_retune);
> +
> +	/* DFE Tune */
> +	for (serdes =3D 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
> +		if (!(rx_serdes_required_for_link_mode(sbl, port_num, serdes) ||
> +		      tx_serdes_required_for_link_mode(sbl, port_num, serdes)))
> +			continue;
> +		err =3D sbl_serdes_dfe_tune_start(sbl, port_num, serdes,
> +						is_retune);
> +		if (err) {
> +			sbl_dev_err(sbl->dev, "p%d: Failed to start DFE tune!",
> +				    port_num);
> +			return err;
> +		}
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Should sbl_port_dfe_tune_start() only check
rx_serdes_required_for_link_mode() instead of
(rx_serdes_required_for_link_mode() || tx_serdes_required_for_link_mode())?

In SBL_LINK_MODE_CD_50G and SBL_LINK_MODE_CD_100G,
tx_serdes_required_for_link_mode() is true for physical lane 0 (and active
TX lanes) even when rx_serdes_required_for_link_mode() is false and
sbl_serdes_config() disabled the receiver on that lane. All other RX DFE and
calibration functions (sbl_serdes_dfe_tune_wait(), sbl_port_check_eyes(),
sbl_check_serdes_tuning_params(), sbl_port_start_pcal(), and
sbl_port_stop_pcal()) skip lanes where !rx_serdes_required_for_link_mode(),
so starting RX DFE calibration on TX-only lanes here tunes disabled
receivers that sbl_serdes_dfe_tune_wait() never waits on.

[ ... ]

> +int sbl_serdes_config(struct sbl_inst *sbl, int port_num, bool allow_an)
> +{

[ ... ]

> +	/* Set port config values */
> +	if (!allow_an) {
> +		for (serdes =3D 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
> +			if (!(rx_serdes_required_for_link_mode(sbl, port_num, serdes) ||
> +			      tx_serdes_required_for_link_mode(sbl, port_num, serdes)))
> +				continue;
> +			use_default_tx_eq =3D false;
> +			use_default_gs    =3D false;
> +			err =3D sbl_get_serdes_config_values(sbl, port_num,
> +							   serdes,
> +								&values);
> +			if (err) {
> +				sbl_dev_warn(sbl->dev,
> +						     "p%ds%d: Unable to read config list!",
> +						     port_num, serdes);
> +				use_default_tx_eq =3D true;
> +				use_default_gs    =3D true;
> +			}

[ ... ]

> +			if (values.num_intr) {
> +				sbl_dev_dbg(sbl->dev,
> +					    "p%ds%d: Applying %d interrupts",
> +					port_num, serdes, values.num_intr);
> +			}
> +			for (j =3D 0; j < values.num_intr; ++j) {
> +				sbl_dev_dbg(sbl->dev,
> +					    "p%d: Applying interrupt 0x%x with data 0x%x",
> +				port_num, values.intr_val[j],
> +				values.data_val[j]);
> +				err =3D sbl_serdes_spico_int(sbl, port_num,
> +							   serdes, values.intr_val[j],
> +						values.data_val[j], &result,
> +						SPICO_INT_RETURN_RESULT);
> +				if (err) {
> +					sbl_dev_warn(sbl->dev,
> +						     "p%ds%d: interrupt 0x%x data 0x%x failed!",
> +						     port_num, serdes, values.intr_val[j],
> +						     values.data_val[j]);
> +				}
> +				if (result !=3D values.intr_val[j]) {
> +					sbl_dev_dbg(sbl->dev,
> +						    "p%ds%d: interrupt:0x%x data:0x%x result:0x%x !=3D code:0x%x. =
This is okay in some cases.",
> +						 port_num, serdes, values.intr_val[j], values.data_val[j], result,=
 values.intr_val[j]);
> +				}
> +			}
> +		}
> +	}

[Severity: Medium]
Can this loop in sbl_serdes_config() overflow values.intr_val[] and
values.data_val[]?

In struct sbl_sc_values, intr_val and data_val are sized to SBL_SC_MAX_INTR
(16), but neither sbl_serdes_add_config() in sbl_serdes.c nor
sbl_serdes_config() validates that num_intr <=3D SBL_SC_MAX_INTR.

[Severity: Medium]
Also in sbl_serdes_config(), what happens if sbl_get_serdes_config_values()
succeeds on an earlier lane with values.num_intr > 0 and then fails on a
subsequent lane?

Because struct sbl_sc_values values is declared outside the per-SerDes loop
and the error path only sets use_default_tx_eq =3D true and
use_default_gs =3D true without resetting values.num_intr =3D 0, the previo=
us
lane's SPICO interrupts will be re-applied to the current lane.

In addition, u16 result is uninitialized at declaration; if
sbl_serdes_spico_int() fails and returns an error without writing *result,
the check if (result !=3D values.intr_val[j]) still reads the uninitialized=
 or
stale value of result.

[ ... ]

> +int sbl_serdes_tuning(struct sbl_inst *sbl, int port_num)
> +{

[ ... ]

> +	sbl_link_tune_zero_total_timespec(sbl, port_num);
> +	link->dfe_tune_count =3D -1;
> +	while (true) {
> +		link->dfe_tune_count++;
> +		link->serr =3D sbl_port_dfe_tune(sbl, port_num, is_retune);
> +
> +		switch (link->serr) {
> +		case 0:
> +			sbl_dev_dbg(sbl->dev, "p%d: dfe %stune good\n", port_num,
> +				    is_retune ? "re" : "");

[ ... ]

> +		case -ELNRNG:   /* tuning params out of range */
> +			if (link->tune_param_oob_count >=3D SBL_MAX_TUNE_PARAM_OOB_FAILS) {
> +				sbl_dev_info(sbl->dev, "%d: too many params oob fails\n", port_num);
> +				/* give up and return error
> +				   The calling framework should reset the spico to delete any
> +				   applied tuning params so we can do a full tune */
> +				goto out;
> +			}
> +			fallthrough;
> +
> +		case -ETIME:    /* tuning did not complete */
> +		case -ECHRNG:   /* eye heights bad */
> +
> +			/*  try to tune again */
> +
> +			break;
> +
> +		case -ECANCELED:
> +			sbl_dev_dbg(sbl->dev, "p%d: %stune cancelled\n", port_num,
> +				    is_retune ? "re" : "");
> +			goto out;
> +
> +		case -ETIMEDOUT:
> +			sbl_dev_dbg(sbl->dev, "p%d: %stune timed out\n", port_num,
> +				    is_retune ? "re" : "");
> +			goto out;
> +
> +		default:
> +			sbl_dev_dbg(sbl->dev, "p%d: %stune failed [%d]\n", port_num,
> +				    is_retune ? "re" : "", link->serr);
> +			goto out;
> +		}
> +	}

[Severity: High]
Can this while (true) loop in sbl_serdes_tuning() spin indefinitely when
sbl_port_check_eyes() repeatedly returns -ECHRNG?

In sbl_serdes_dfe_tune_wait(), as soon as all active RX lanes complete DFE
calibration, the loop breaks at if (!in_progress_mask) break and immediately
returns 0 at if (serdes_mask =3D=3D tuned_mask) return 0 before checking
sbl_base_link_start_cancelled() or sbl_start_timeout().

If sbl_port_check_eyes() in sbl_port_dfe_tune_wait() then returns -ECHRNG,
sbl_serdes_tuning() retries in while (true) without ever checking
sbl_start_timeout() or sbl_base_link_start_cancelled().

> +
> +out:
> +	sbl_dev_dbg(sbl->dev, "p%d: SerDes tuning complete", port_num);
> +	return link->serr;
> +}
> +
> +int sbl_spico_reset(struct sbl_inst *sbl, int port_num)
> +{
> +	int serdes;
> +	int err =3D 0;
> +	int pass;
> +	u32 sbus_addr;
> +	u32 sbus_ring;
> +	u32 result[SBL_SERDES_LANES_PER_PORT];
> +	unsigned long last_jiffy;
> +
> +	sbl_dev_dbg(sbl->dev, "p%d: spico reset start", port_num);
> +
> +	sbus_ring =3D sbl->switch_info->ports[port_num].serdes[0].sbus_ring;
> +	if (mutex_is_locked(SBUS_RING_MTX(sbl, sbus_ring)))
> +		sbl_dev_dbg(sbl->dev, "spico_reset: Sbus contention detected, sbus_rin=
g_mtx[%d] locked", sbus_ring);
> +
> +	/* SBUS Critical Section */
> +	mutex_lock(SBUS_RING_MTX(sbl, sbus_ring));
> +
> +	/* Issue the reset */
> +	for (serdes =3D 0; serdes < sbl->switch_info->num_serdes; ++serdes) {
> +		if (!(rx_serdes_required_for_link_mode(sbl, port_num, serdes) ||
> +		      tx_serdes_required_for_link_mode(sbl, port_num, serdes)))
> +			continue;
> +		err =3D sbl_serdes_spico_int(sbl, port_num, serdes,
> +					   SPICO_INT_CM4_PROC_RESET,
> +				SPICO_INT_DATA_PROC_RESET, NULL,
> +				SPICO_INT_IGNORE_RESULT);

[Severity: High]
Does sbl_spico_reset() invert the lock ordering between
SBUS_RING_MTX(sbl, sbus_ring) and sbl->link[port_num].serdes_mtx?

In sbl_serdes_soft_reset() and sbl_serdes_firm_upload(),
sbl->link[port_num].serdes_mtx is acquired first, followed by
SBUS_RING_MTX(sbl, sbus_ring).

Here in sbl_spico_reset(), SBUS_RING_MTX(sbl, sbus_ring) is acquired first,
and then sbl_serdes_spico_int() -> sbl_sbm_pml_serdes_op() ->
sbl_pml_serdes_op() acquires sbl->link[port_num].serdes_mtx while holding
SBUS_RING_MTX(sbl, sbus_ring), creating an ABBA deadlock risk between the
two mutexes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-cxi-netdev=
-submission-v1-0-8c2c391cc283@hpe.com?part=3D4
