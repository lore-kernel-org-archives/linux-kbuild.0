Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480536;
	b=yDTCpfzeV0xqoz0Y7YZUiGZ7UNrtskaVXP2XzBp+Tb7UmhImuEDZUqHeedtHaYz+n0nF
	 DKvl55dgDjKsphgOEFue8oBtei8V2YIuU/xicFFMF59GP/3oI4lv0lH4NtOWJtcTRw+Pd
	 Cu7U0e2np4xrtLlSS4C4NqJP8OkXXKsbby9OpDPtreZtor+Je9jUQ74dNJWfa4lN7B1wx
	 kaaZoxky0lfHHZcr/vD0AUXWjcHqerc+2wZtC2XT1LO9YFdzVlKMCBJ/WCc+uT82al0gI
	 i3+MyJG05RA/y/yQjJ/ojmLjI8yztYI1JolFce5B/Ap5H2czc3nFe9f+qZJ5aEl000A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480536;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XhJu44S45ohBi/lV42iy1T4KijXAn+ECe1x52ZerwfQ=;
	b=Iy7TW1Jc1j/uoG1IGd+X6mzY4FzqJVbBAQq+2n64MnAPsAY/wXgr+I+jmz2BeWNeEAfd
	 at+5UXpxuN1xnpgsomPKs1kuoyXnHhzlxg8atrR3E8oVAJ4p0kxgoa16DYLwfPPgd80bt
	 syggnhvmo0JrGwgeVggRrd/qpeVKIDiw/TaaODl8/dbOa/CGfDiu3dGR3zsun5oMYqYPy
	 bqP8CeO65lYdz9tfNfdDLFdpci7Vo621V5lMPsAFYwiuBtSFCtcu2EkOaIS7W28nnT8M8
	 s9cbkM534Mw2nzsFgZZjJ6SLa7WiXBVMY3TPKa/HcfQ/ZplWbNbsZecAZIITQR4SgCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mFfHTcTL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E09D606A31E
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 21:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mFfHTcTL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BAF11F000C1;
	Sat, 31 Oct 2026 21:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793480536;
	bh=XhJu44S45ohBi/lV42iy1T4KijXAn+ECe1x52ZerwfQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mFfHTcTLKhlkxkNI6n+X1OAS+p+JAipOat6VS+Scob83E3nObHUhRXqltriVSdLvk
	 9E/BE/VEUhGF2xneT1S6Cw3QTsaRXt9VlG7iqf3zYuK0ReIcsqARsR59EGK+QU3aiU
	 mk5VMcFPtchwMxThU0mF2V3lX5LAb2GdU8OkE2UYP+sxqW/kSM/+fh81x8OSr0fr3h
	 QQhn+s4UqEqzoiJ66kXTdFq9SjsRChKQPVGxev/vakls/QiHygs/3XhlMIdJVmqeot
	 jEESytFMjpYeiwzEljuA9Naws50kyQE3JcGLllKs90fe/qXdXZzEcBa4mfTTLnrwAT
	 /lQxt3hdtHBBw==
Message-ID: <sashiko-outbox-192144@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 15/23] net: hpe: sl: add the NIC binding and logging
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Doug Ledford" <doug.ledford@hpe.com>, "Slingshot Open Source Team" <slingshot-os-team@groups.ext.hpe.com>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Richard
 Cochran" <richardcochran@gmail.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Guenter
 Roeck" <linux@roeck-us.net>
Cc: linux-kbuild@vger.kernel.org, "Sandeep Bhoot" <sandeep.bhoot@hpe.com>
In-Reply-To: <20261030-cxi-netdev-submission-v1-15-8c2c391cc283@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030-cxi-netdev-submission-v1-15-8c2c391cc283@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 21:02:15 +0000
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
- [High] net: hpe: sl: missing lgrp ref and serialization in sl_media_cable=
_insert()
- [Medium] net: hpe: sl: format string truncation and injection in sl_log_m=
sg_create()
- [Medium] net: hpe: sl: missing magic cases in sl_log_err_trace() and sl_l=
og_warn_trace()
- [Low] net: hpe: sl: duplicate sl_media_cable_insert() and sl_media_cable_=
remove()
- [Low] net: hpe: sl: wrong NULL block error message in __sl_log_dynamic_db=
g()
--

commit a4f50abb85b911c75a1fd3ef7f9989fb7a082030
Author: Doug Ledford <doug.ledford@hpe.com>

net: hpe: sl: add the NIC binding and logging helpers

This patch adds the logging helpers in sl_log.c and the NIC logical device
and media glue functions in nic/sl_ldev.c and nic/sl_media.c.

>     net: hpe: sl: add the NIC binding and logging helpers
>    =20
>     Add the glue that binds SL to a NIC: ASIC and CSR definitions, the NIC
>     logical device and media hooks, and the logging helpers.
>    =20
>     sl_asic_csrs.h is generated from the hardware register description and
>     is kept in that form; its integer types were converted to the kernel
>     types in the same pass as the other UAPI/header cleanups.
>    =20
>     checkpatch --strict (100 columns) still reports the following in this
>     patch. They need coordination with the internal repositories this code
>     is maintained in and will be fixed in V2:
>     - WARNING: LONG_LINE (18)
>     - CHECK: UNNECESSARY_PARENTHESES (16), COMPARISON_TO_NULL (3)
>    =20
>     Co-developed-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
>     Signed-off-by: Sandeep Bhoot <sandeep.bhoot@hpe.com>
>     Signed-off-by: Doug Ledford <doug.ledford@hpe.com>

[Severity: Low]
This isn't a bug, but the commit message mentions adding ASIC and CSR
definitions including sl_asic_csrs.h, whereas those were added in the
earlier commit 386ebd3c58a9 ("net: hpe: sl: add core headers"). Should this
description be updated to match the files in this patch?

> diff --git a/drivers/net/ethernet/hpe/sl/log/sl_log.c b/drivers/net/ether=
net/hpe/sl/log/sl_log.c
> new file mode 100644
> index 0000000000000..64382f9b46bb3
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sl/log/sl_log.c
> @@ -0,0 +1,566 @@
[ ... ]
> +#define SL_LOG_MSG_LEN              150
> +#define SL_LOG_NULL_ID_FMT          "%c[-:--:-] ???         "
> +#define SL_LOG_DFLT_ID_FMT          "%c[-:--:-] 0x%08X  "
> +#define SL_LOG_LDEV_ID_FMT          "%c[%1u:--:-] ldev%1u       "
> +#define SL_LOG_LGRP_ID_FMT          "%c[%1u:%02u:-] %-12s"
> +#define SL_LOG_LINK_ID_FMT          "%c[%1u:%02u:%1u] %-12s"
> +#define SL_LOG_JACK_ID_FMT          "%c[-:--:-] jack%03u     "
> +#define SL_LOG_CONTEXT              (in_interrupt() ? '^' : ' ')
> +
> +static int remaining_chars(int idx)
> +{
> +	return max(SL_LOG_MSG_LEN - idx, 0);
> +}
> +
> +static void sl_log_msg_create(const char *level, void *ptr, char *msg,
> +			      const char *block, const char *name, const char *text)
> +{
[ ... ]
> +	idx =3D snprintf(msg, SL_LOG_MSG_LEN, "%s%s", level, module_name(THIS_M=
ODULE));
> +	if (ptr !=3D NULL) {
> +		switch (*((u32 *)ptr)) {
[ ... ]
> +		case SL_CTRL_LGRP_MAGIC:
> +			ctrl_lgrp =3D ptr;
> +			spin_lock_irqsave(&(ctrl_lgrp->log_lock), irq_flags);
> +			idx +=3D snprintf(msg + idx, remaining_chars(idx), SL_LOG_LGRP_ID_FMT,
> +				SL_LOG_CONTEXT,
> +				ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->num,
> +				ctrl_lgrp->log_connect_id);
> +			spin_unlock_irqrestore(&(ctrl_lgrp->log_lock), irq_flags);
> +			break;
[ ... ]
> +		default:
> +			idx +=3D snprintf(msg + idx, remaining_chars(idx), SL_LOG_DFLT_ID_FMT,
> +				SL_LOG_CONTEXT,
> +				*((u32 *)ptr));
> +			break;
> +		}
> +	} else {
> +		idx +=3D snprintf(msg + idx, remaining_chars(idx), SL_LOG_NULL_ID_FMT,
> +			SL_LOG_CONTEXT);
> +	}
> +
> +	snprintf(msg + idx, remaining_chars(idx), " %5s-%-10s: %s\n", block, na=
me, text);
> +}
> +
> +void sl_log(void *ptr, const char *level, const char *block,
> +	    const char *name, const char *text, ...)
> +{
> +	char    msg[SL_LOG_MSG_LEN + 1];
> +	va_list args;
[ ... ]
> +	sl_log_msg_create(level, ptr, msg, block, name, text);
> +
> +	va_start(args, text);
> +	vprintk(msg, args);
> +	va_end(args);
> +}

[Severity: Medium]
Can sl_log_msg_create() truncate caller format strings or allow format
specifiers in connect_id to be evaluated by vprintk()?

sl_log_msg_create() writes the log prefix (up to 49 bytes for level,
module_name(THIS_MODULE), SL_LOG_LGRP_ID_FMT or SL_LOG_LINK_ID_FMT, block,
and name) plus the unexpanded caller format string text and trailing newline
into the 150-byte msg buffer, and then sl_log(), sl_log_err_trace(),
sl_log_warn_trace(), sl_log_io_trace(), and __sl_log_dynamic_dbg() pass msg
directly as the format string to vprintk(msg, args).

Because only 100 bytes remain in msg for text and the newline, callers with
format strings over 100 bytes have their format string truncated before
vprintk() expands it (potentially mid-specifier), such as in
drivers/net/ethernet/hpe/sl/core/data/sl_core_data_llr.c:

    sl_core_data_llr_loop_time_get()
        sl_core_log_dbg(core_llr, LOG_NAME, ...);

and in drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_serdes_lane.c:

    sl_core_hw_serdes_lane_up_quality_check()
        sl_core_log_dbg(core_lgrp, LOG_NAME, ...);

In addition, ctrl_lgrp->log_connect_id, core_lgrp->log_connect_id, and
media_lgrp->connect_id are set at runtime via sl_lgrp_connect_id_set() (for
example from netdev_name(ndev) on NETDEV_CHANGENAME in cxi_netdev_event()),
so any percent character in connect_id is placed into msg and interpreted as
a format specifier by vprintk().

Would it be safer to format the message using printk with %pV (struct
va_format) instead of constructing a dynamic format string in msg?

> +
> +void sl_log_err_trace(void *ptr, const char *block,
> +		      const char *name, const char *text, ...)
> +{
[ ... ]
> +	if (ptr =3D=3D NULL)
> +		return;
> +
> +	switch (*((u32 *)ptr)) {
> +	case SL_CTRL_LGRP_MAGIC:
[ ... ]
> +	case SL_MEDIA_LGRP_MAGIC:
> +		media_lgrp =3D ptr;
> +		rtn =3D sl_media_data_lgrp_is_err_trace_enabled(media_lgrp, &err_trace=
_enable);
> +		if (rtn)
> +			return;
> +		if (!err_trace_enable)
> +			return;
> +		break;
> +	default:
> +		return;
> +	}
[ ... ]
> +}
> +
> +void sl_log_warn_trace(void *ptr, const char *block,
> +		       const char *name, const char *text, ...)
> +{
[ ... ]
> +	if (ptr =3D=3D NULL)
> +		return;
> +
> +	switch (*((u32 *)ptr)) {
> +	case SL_CTRL_LGRP_MAGIC:
[ ... ]
> +	case SL_MEDIA_LGRP_MAGIC:
> +		media_lgrp =3D ptr;
> +		rtn =3D sl_media_data_lgrp_is_warn_trace_enabled(media_lgrp, &warn_tra=
ce_enable);
> +		if (rtn)
> +			return;
> +		if (!warn_trace_enable)
> +			return;
> +		break;
> +	default:
> +		return;
> +	}

[Severity: Medium]
Are SL_MEDIA_JACK_MAGIC, SL_CTRL_LDEV_MAGIC, SL_LINK_MAGIC, and NULL
intentionally omitted from sl_log_err_trace() and sl_log_warn_trace()?

While sl_log_msg_create() handles SL_MEDIA_JACK_MAGIC, SL_CTRL_LDEV_MAGIC,
SL_LINK_MAGIC, and NULL pointers, the switch statements in
sl_log_err_trace() and sl_log_warn_trace() hit default: return (or return
early when ptr is NULL) for these types.

Across drivers/net/ethernet/hpe/sl/media/ and
drivers/net/ethernet/hpe/sl/ctrl/, callers pass struct sl_media_jack
pointers to sl_media_log_err_trace(), sl_media_log_warn_trace(), and
sl_ctrl_log_warn_trace() (for example in sl_media_jack_cable_insert(),
called by sl_media_cable_insert() in this patch), struct sl_ctrl_ldev
pointers in sl_ctrl_ldev.c, struct sl_link in sl_core_hw_an_lp.c, and NULL
pointers in ctrl/, causing all of those error and warning trace messages to
be silently dropped.

[ ... ]
> +void __sl_log_dynamic_dbg(struct _ddebug *desc, void *ptr, const char *b=
lock,
> +			  const char *name, const char *text, ...)
> +{
> +	char    msg[SL_LOG_MSG_LEN + 1];
> +	va_list args;
> +
> +	if (!desc) {
> +		pr_err("NULL desc\n");
> +		return;
> +	}
> +	if (!block) {
> +		pr_err("NULL desc\n");
> +		return;
> +	}

[Severity: Low]
Should the !block check in __sl_log_dynamic_dbg() log "NULL block\n" instead
of "NULL desc\n"?

[ ... ]
> diff --git a/drivers/net/ethernet/hpe/sl/nic/sl_media.c b/drivers/net/eth=
ernet/hpe/sl/nic/sl_media.c
> new file mode 100644
> index 0000000000000..dddfaef0cb283
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sl/nic/sl_media.c
> @@ -0,0 +1,53 @@
[ ... ]
> +int sl_media_cable_insert(struct sl_lgrp *lgrp, u8 *eeprom_page0, u8 *ee=
prom_page1, u32 flags)
> +{
> +	int rtn;
> +
> +	rtn =3D sl_lgrp_check(lgrp);
> +	if (rtn) {
> +		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "cable insert fail");
> +		return rtn;
> +	}
> +	if (!eeprom_page0) {
> +		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "NULL eeprom");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * hardcoding 0 for now since there is only one jack. Might change in f=
uture
> +	 */
> +	return sl_media_jack_cable_insert(lgrp->ldev_num, lgrp->num, 0, eeprom_=
page0,
> +					  eeprom_page1, flags);
> +}
> +EXPORT_SYMBOL(sl_media_cable_insert);
> +
> +int sl_media_cable_remove(struct sl_lgrp *lgrp)
> +{
> +	int rtn;
> +
> +	rtn =3D sl_lgrp_check(lgrp);
> +	if (rtn) {
> +		sl_log_err(NULL, LOG_BLOCK, LOG_NAME, "cable remove fail");
> +		return rtn;
> +	}
> +
> +	/*
> +	 * hardcoding 0 for now since there is only one jack. Might change in f=
uture
> +	 */
> +	return sl_media_jack_cable_remove(lgrp->ldev_num, lgrp->num, 0);
> +}
> +EXPORT_SYMBOL(sl_media_cable_remove);

[Severity: High]
Can sl_media_cable_insert() and sl_media_cable_remove() race with link
teardown or concurrent cable scans, leading to use-after-free on media_jack
and media_lgrp or a NULL pointer dereference in
sl_sysfs_media_speeds_create()?

Here, sl_media_cable_insert() and sl_media_cable_remove() only validate the
static lgrps[ldev_num][lgrp_num] handle via sl_lgrp_check(lgrp) and then
call sl_media_jack_cable_insert() and sl_media_jack_cable_remove() without
pinning ctrl_lgrp (via sl_ctrl_lgrp_get() and
sl_ctrl_lgrp_kref_get_unless_zero()) or serializing cable state transitions.

In drivers/net/ethernet/hpe/ss1/cass_core.c, cass_remove() and the
cass_probe() error path invoke teardown before disabling microcontroller
interrupts and flushing hw->uc_attn1_wq:

    cass_remove()
        hw->link_ops->link_fini(hw) -> cass_sl_link_fini()
            cass_sl_media_unconfig() -> sl_media_cable_remove()
            cass_sl_exit()
                sl_lgrp_del() -> sl_ctrl_lgrp_del()
                sl_ldev_del() -> sl_ctrl_ldev_del()
        cass_unregister_uc(hw)

While attn1_worker() is running:

    attn1_worker()
        cass_cable_scan()
            cass_link_headshell_insert()
                cass_sl_media_config()
                    sl_media_cable_insert()
                        sl_media_jack_cable_insert()
                            sl_media_data_jack_cable_soft_reset() (sleeps 3=
.3s)

because ctrl_lgrp is not pinned, sl_ctrl_lgrp_del() and sl_ctrl_ldev_del()
proceed immediately to sl_sysfs_media_delete(), sl_media_lgrp_del() (freeing
media_lgrp), and sl_media_data_jack_del() (freeing media_jack). When
sl_media_jack_cable_insert() wakes from msleep(), it writes to freed
media_jack memory and calls sl_sysfs_media_speeds_create(ldev_num,
lgrp_num), which dereferences a NULL media_lgrp at
media_lgrp->speeds_kobj_init.

Similarly, during cass_sbl_link_start(), cass_cable_scan() runs on the probe
thread after cass_register_uc() has already enabled ATT1_QSFP_INSERT and
ATT1_QSFP_REMOVE interrupts on hw->uc_attn1_wq, allowing attn1_worker() to
enter sl_media_cable_insert() or sl_media_cable_remove() concurrently and
corrupt media_lgrp->speeds_kobj[] initialization and teardown.

[Severity: Low]
Earlier commit 44ba5c7fee3ca ("net: hpe: sl: add the logical group, link,
MAC, and LLR APIs") added drivers/net/ethernet/hpe/sl/sl_media_nic.c with
placeholder definitions and EXPORT_SYMBOL() declarations for
sl_media_cable_insert() and sl_media_cable_remove():

drivers/net/ethernet/hpe/sl/sl_media_nic.c:
    int sl_media_cable_insert(struct sl_lgrp *lgrp, u8 *eeprom_page0, u8 *e=
eprom_page1, u32 flags)
    {
        /* placeholder for future functionality */
        return 0;
    }
    EXPORT_SYMBOL(sl_media_cable_insert);

    int sl_media_cable_remove(struct sl_lgrp *lgrp)
    {
        /* placeholder for future functionality */
        return 0;
    }
    EXPORT_SYMBOL(sl_media_cable_remove);

Should drivers/net/ethernet/hpe/sl/sl_media_nic.c be removed now that
drivers/net/ethernet/hpe/sl/nic/sl_media.c provides the real implementations
of these functions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-cxi-netdev=
-submission-v1-0-8c2c391cc283@hpe.com?part=3D15
