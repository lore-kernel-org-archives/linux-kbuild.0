Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480534;
	b=jp70bk7Fyb9JsmdYPNFZDFLA9r9wzz9jcrnVFFZqcuDV5+ERrrFyKA7Jcpuu+ZOzAKQp
	 0lZmTx0naWsTtPC5AHuxq5b/vQ2w2WXWuNFmbW9OfmIViEsa+N2HygFsdt4rv0fPKcduy
	 Bjb7TyDWKnbsENeoeynQPjVNj0JRqsia1DUql5eBbNS5z0YGULkraIy9SkbpNvgIzoGI/
	 AYLtx321rozjolqnByZCr2BavT0PEaBa6chPacns4ej3OATuhlwiyVLH71YQlS+Crc578
	 OrYZMUmz1In9ZOhyxu/8toRyMmwfJvj+BEDk1bRTd+kGDJRmBoFKVIphtATwfWJUN3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480534;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QUnjfN30JK++INZ8ja7xNweWZmvmmt/wH19UuRyCni0=;
	b=q3cjE1XaVn/i3EKFsSDk0MY95VunqdWFUZXlONTJXQd6MFz/lEwcD6Jk1ojtWmYQO17C
	 YSGcsvh9Q1E8E2LbmqWw4Y3ss1YnVqknuagPYI7Ue6SkKmFvYUR/ZlgMg6gGOIgNylBZS
	 AiZ8gEqpHi071HYZH+7i3c4v2Dr0ny6+SCOvn3NmlOQ9He1InuIMnhiWbU8FCmbWEhmVV
	 KPPYvTIMI9P6nv53YzYv1fDcRE1WuyteMfTrattHdHrnGE/S5QLU5K26a5zbuw68Unh86
	 rhXAkjMav/K4kflNKjQQDs8de8NUbtW7as2PeXCcSpirKjw4tmJOKRRMydnz3SLFnSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SltxXxpa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E676C606A31C
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 21:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SltxXxpa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A2AA1F000C1;
	Sat, 31 Oct 2026 21:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793480533;
	bh=QUnjfN30JK++INZ8ja7xNweWZmvmmt/wH19UuRyCni0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SltxXxpaa70+JvTnrKPCdJDfNgNX1vkXkeEiiRqZgxgYZmyEgRjxG+0i3JowEA6sS
	 do0l0rX9lp1LHLWsB/UsPopiWm8Lv1jtP6hu8eMeimhZ8stp41ipbeVFkhK5Ycud9D
	 NDD/XCyRQ3BQDmvOaZ9yNmIHMlTdkOFEuOXPpBofnwa+M9XpviP5IT3JUTBMTu51gI
	 Qkcjw/Hg6DfdYzYTMB5Hmb+bG18CFXAPCUMz91LGQ5aUG8tyPZpNVtb1aErqhIjgvH
	 8xFmB7oUJvHbAdLZ0YIJVB7xh+uMHnIhND77bao0DrySS3RqmIhtXebZEFaZiZiIiF
	 zYtrfi/knjFuw==
Message-ID: <sashiko-outbox-192142@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/23] net: hpe: sl: add the control layer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Doug Ledford" <doug.ledford@hpe.com>, "Slingshot Open Source Team" <slingshot-os-team@groups.ext.hpe.com>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Richard
 Cochran" <richardcochran@gmail.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Guenter
 Roeck" <linux@roeck-us.net>
Cc: linux-kbuild@vger.kernel.org, "Sandeep Bhoot" <sandeep.bhoot@hpe.com>, "Mamila
 Santosh" <santosh-kumar.mamila@hpe.com>, "Iraimani P" <iraimani.pavadai@hpe.com>
In-Reply-To: <20261030-cxi-netdev-submission-v1-12-8c2c391cc283@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030-cxi-netdev-submission-v1-12-8c2c391cc283@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 21:02:12 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 24 potential issue=
(s) to consider:
- [Critical] net: hpe: sl: use-after-free on del_complete and racy object l=
ookup/delete
- [Critical] net: hpe: sl: UAF on ctrl_link from re-armed FEC monitor timer
- [High] net: hpe: sl: broken __free(sl_ctrl_link_put) conversion and dead =
checks
- [High] net: hpe: sl: partial writes corrupt byte-mode notification kfifo =
stream
- [High] net: hpe: sl: notif kfifo freed before unpublishing lgrp in sl_ctr=
l_lgrp_release()
- [High] net: hpe: sl: broken link state transitions in sl_ctrl_link_reset(=
) and down
- [High] net: hpe: sl: recursive config_lock deadlock in lgrp trace enable =
setters
- [High] net: hpe: sl: core_link reference leak across loop in link_config_=
check()
- [High] net: hpe: sl: uninitialized down_complete in sl_ctrl_link_new()
- [High] net: hpe: sl: sl_ctrl_link_reset_cmd() fails to cancel starting li=
nk
- [High] net: hpe: sl: sl_ctrl_link_down() wedges link state on command fai=
lure
- [High] net: hpe: sl: divide-by-zero and HZ unit bug in sl_ctrl_link_fec_b=
er_calc()
- [High] net: hpe: sl: LLR start retry in sl_ctrl_llr_start_callback() alwa=
ys fails
- [Medium] net: hpe: sl: uninitialized up_count read in sl_ctrl_link_up_cal=
lback()
- [Medium] net: hpe: sl: homebrew list_state synchronization in sl_ctrl_lgr=
p_notif.c
- [Medium] net: hpe: sl: wrong lock in link config getters and unlocked fec=
_info copy
- [Medium] net: hpe: sl: double LINK_UP_CANCEL_CMD count in sl_ctrl_link_re=
lease_work()
- [Medium] net: hpe: sl: uninitialized read and lock bug in sl_ctrl_link_fe=
c_data_check()
- [Medium] net: hpe: sl: uninitialized link_caps read in sl_ctrl_link_fec_l=
imit_calc()
- [Medium] net: hpe: sl: uninitialized stack variables used on getter failu=
re
- [Medium] net: hpe: sl: unlocked read of fec_data.info in sl_ctrl_link_fec=
_data_check()
- [Medium] net: hpe: sl: wrong imap passed in sl_ctrl_llr_start_callback() =
error path
- [Medium] net: hpe: sl: sl_ctrl_mac_reset() checks tx_rtn && rx_rtn instea=
d of ||
- [Medium] net: hpe: sl: missing FEC down cause counters in sl_ctrl_link_fe=
c_data_check()
--

commit 7e677a573a9412df0fcbf1471d59cebae2a3a9b8
Author: Doug Ledford <doug.ledford@hpe.com>

net: hpe: sl: add the control layer

This commit adds the SL control layer to validate and serialize requests fr=
om
the NIC driver and sysfs onto the core state machines and deliver link group
notifications.

> diff --git a/drivers/net/ethernet/hpe/sl/ctrl/data/sl_ctrl_data_lgrp.c b/=
drivers/net/ethernet/hpe/sl/ctrl/data/sl_ctrl_data_lgrp.c
> new file mode 100644
> index 0000000000000..279e41770f485
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sl/ctrl/data/sl_ctrl_data_lgrp.c
> @@ -0,0 +1,164 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2025-2026 Hewlett Packard Enterprise Development LP */
> +
> +#include "base/sl_ctrl_log.h"
> +#include "sl_ctrl_ldev.h"
> +#include "sl_media_lgrp.h"
> +#include "sl_core_lgrp.h"
> +
> +#include "data/sl_core_data_lgrp.h"
> +#include "data/sl_media_data_lgrp.h"
> +
> +#include "sl_ctrl_data_lgrp.h"
> +
> +#define LOG_NAME SL_CTRL_LGRP_LOG_NAME
> +
> +int sl_ctrl_data_lgrp_err_trace_enable_set(struct sl_ctrl_lgrp *ctrl_lgr=
p, bool err_trace_enable)
> +{
> +	struct sl_core_lgrp *held_lgrp_1 __free(sl_core_lgrp_put) =3D NULL;
> +	int rtn;
> +
> +	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME, "set (err_trace_enable =3D %s)", e=
rr_trace_enable ? "true" : "false");
> +
> +	held_lgrp_1 =3D sl_core_lgrp_get(ctrl_lgrp->ctrl_ldev->num, ctrl_lgrp->=
num);
> +	if (!held_lgrp_1)
> +		return -ENODEV;
> +	spin_lock(&ctrl_lgrp->config_lock);
> +	rtn =3D sl_core_data_lgrp_err_trace_enable_set(held_lgrp_1,
> +						     err_trace_enable);
> +	if (rtn) {
> +		sl_ctrl_log_err_trace(ctrl_lgrp, LOG_NAME,
> +				      "core trace enable set failed [%d]", rtn);
> +		spin_unlock(&ctrl_lgrp->config_lock);
> +		return rtn;
> +	}

[Severity: High]
Does calling sl_ctrl_log_err_trace() while holding ctrl_lgrp->config_lock
cause a recursive spinlock deadlock on the same CPU?

In sl_ctrl_data_lgrp_err_trace_enable_set() and
sl_ctrl_data_lgrp_warn_trace_set(), if
sl_core_data_lgrp_*_trace_enable_set() or
sl_media_data_lgrp_*_trace_enable_set() returns an error,
sl_ctrl_log_err_trace(ctrl_lgrp, ...) is called before releasing
ctrl_lgrp->config_lock.

That macro calls sl_log_err_trace() ->
sl_ctrl_data_lgrp_is_err_trace_enabled(ctrl_lgrp, ...), which also acquires
ctrl_lgrp->config_lock:

drivers/net/ethernet/hpe/sl/ctrl/data/sl_ctrl_data_lgrp_trace.c:
sl_ctrl_data_lgrp_is_err_trace_enabled() {
	spin_lock(&ctrl_lgrp->config_lock);
	*err_trace_enable =3D ctrl_lgrp->err_trace_enable;
	spin_unlock(&ctrl_lgrp->config_lock);
    ...
}

Should ctrl_lgrp->config_lock be unlocked before calling
sl_ctrl_log_err_trace()?

> diff --git a/drivers/net/ethernet/hpe/sl/ctrl/data/sl_ctrl_data_link.c b/=
drivers/net/ethernet/hpe/sl/ctrl/data/sl_ctrl_data_link.c
> new file mode 100644
> index 0000000000000..dfb1b820d5ef7
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sl/ctrl/data/sl_ctrl_data_link.c

[ ... ]

> +int sl_ctrl_data_link_fec_up_settle_wait_ms_get(struct sl_ctrl_link *ctr=
l_link, u32 *fec_up_settle_wait_ms)
> +{
> +	spin_lock(&ctrl_link->data_lock);
> +	*fec_up_settle_wait_ms =3D ctrl_link->config.fec_up_settle_wait_ms;
> +	spin_unlock(&ctrl_link->data_lock);
> +
> +	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
> +			"get (fec_up_settle_wait_ms =3D %d)", *fec_up_settle_wait_ms);
> +
> +	return 0;
> +}

[Severity: Medium]
Should the ctrl_link->config getters in sl_ctrl_data_link.c be taking
ctrl_link->config_lock instead of ctrl_link->data_lock?

In sl_ctrl_link_config_set_cmd(), sl_ctrl_link_config_get(), and
sl_ctrl_link_up_callback(), ctrl_link->config is protected by
ctrl_link->config_lock. However, all nine config getters in
sl_ctrl_data_link.c (sl_ctrl_data_link_fec_up_settle_wait_ms_get(),
sl_ctrl_data_link_fec_up_check_wait_ms_get(),
sl_ctrl_data_link_fec_up_ucw_limit_get(),
sl_ctrl_data_link_fec_up_ccw_limit_get(),
sl_ctrl_data_link_up_timeout_ms_get(),
sl_ctrl_data_link_up_tries_max_get(),
sl_ctrl_data_link_config_options_get(),
sl_ctrl_data_link_pause_map_get(), and
sl_ctrl_data_link_hpe_map_get()) acquire ctrl_link->data_lock instead.
(In addition, sl_ctrl_link_config_set_cmd() reads
ctrl_link->config.link_up_tries_max after dropping ctrl_link->config_lock.)

> diff --git a/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_ldev.c b/drivers/ne=
t/ethernet/hpe/sl/ctrl/sl_ctrl_ldev.c
> new file mode 100644
> index 0000000000000..0295dd902d6de
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_ldev.c

[ ... ]

> +	spin_lock(&ctrl_ldevs_lock);
> +	ctrl_ldevs[ldev_num] =3D NULL;
> +	spin_unlock(&ctrl_ldevs_lock);
> +
> +	complete_all(&ctrl_ldev->del_complete);
> +
> +	kfree(ctrl_ldev);
> +	return;
> +
> +retry:
> +	kref_init(&ctrl_ldev->ref_cnt);
> +	complete_all(&ctrl_ldev->del_complete);
> +}
> +
> +int sl_ctrl_ldev_put(struct sl_ctrl_ldev *ctrl_ldev)
> +{
> +	return kref_put(&ctrl_ldev->ref_cnt, sl_ctrl_ldev_release);
> +}
> +
> +int sl_ctrl_ldev_del(u8 ldev_num)
> +{
> +	struct sl_ctrl_ldev *ctrl_ldev;
> +	unsigned long       timeleft;
> +
> +	ctrl_ldev =3D sl_ctrl_ldev_get(ldev_num);
> +	if (!ctrl_ldev) {
> +		sl_ctrl_log_err_trace(NULL, LOG_NAME,
> +				      "del not found (ldev_num =3D %u)", ldev_num);
> +		return -EBADRQC;
> +	}
> +
> +	sl_ctrl_log_dbg(ctrl_ldev, LOG_NAME, "del (ldev =3D 0x%p)", ctrl_ldev);
> +
> +	/*
> +	 * Release cannot run before the put below, so rearming a completion
> +	 * left over from an earlier failed del is safe.
> +	 */
> +	reinit_completion(&ctrl_ldev->del_complete);
> +
> +	if (!sl_ctrl_ldev_put(ctrl_ldev)) {
> +		timeleft =3D wait_for_completion_timeout(&ctrl_ldev->del_complete,
> +						       msecs_to_jiffies(SL_CTRL_LDEV_DEL_TIMEOUT_MS));
> +
> +		sl_ctrl_log_dbg(NULL, LOG_NAME,
> +				"del completion_timeout (timeleft =3D %lums)", timeleft);
> +
> +		if (timeleft =3D=3D 0) {
> +			sl_ctrl_log_err(NULL, LOG_NAME,
> +					"del timed out (ctrl_ldev =3D 0x%p)", ctrl_ldev);
> +			return -ETIMEDOUT;
> +		}
> +	}

[Severity: Critical]
Can this trigger a use-after-free on del_complete and on objects returned by
sl_ctrl_ldev_get(), sl_ctrl_lgrp_get(), sl_ctrl_llr_get(), and
sl_ctrl_mac_get()?

First, in sl_ctrl_ldev_del(), sl_ctrl_lgrp_del(), and sl_ctrl_llr_del(), if
another thread holds a reference on ref_cnt (for example in
sl_ctrl_ldev_serdes_init(), which can sleep for up to 3000ms while
SL_CTRL_LDEV_DEL_TIMEOUT_MS is 2000ms), sl_ctrl_*_put() returns 0 and the
caller waits in wait_for_completion_timeout(&obj->del_complete, ...). When
the other thread drops the final reference, sl_ctrl_ldev_release(),
sl_ctrl_lgrp_release(), or sl_ctrl_llr_release() calls
complete_all(&obj->del_complete) and immediately calls kfree(obj) without a
separate memory reference (unlike sl_ctrl_link and sl_ctrl_mac, which use
mem_ref), freeing del_complete while wait_for_completion_timeout() is still
accessing it or after it times out.

Second, sl_ctrl_ldev_get(), sl_ctrl_lgrp_get(), sl_ctrl_llr_get(), and
sl_ctrl_mac_get() drop the global table spinlock and return a raw pointer
without acquiring a reference or checking a delete_requested flag under the
lock. Callers (including sl_ctrl_mac_del() calling
kref_get(&ctrl_mac->mem_ref) and callers invoking kref_get_unless_zero())
can dereference a pointer that was concurrently deleted and freed on another
CPU, and concurrent or retried del() calls can invoke reinit_completion()
and kref_put() a second time without owning a reference.

Could ldev, lgrp, llr, and mac use the same delete_requested + mem_ref +
kref_get_unless_zero()-under-table-lock pattern as sl_ctrl_link?

> diff --git a/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_lgrp.c b/drivers/ne=
t/ethernet/hpe/sl/ctrl/sl_ctrl_lgrp.c
> new file mode 100644
> index 0000000000000..1e7240325fcc1
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_lgrp.c

[ ... ]

> +	cancel_work_sync(&ctrl_lgrp->notif_work);
> +	kfifo_free(&ctrl_lgrp->ctrl_notif.fifo);
> +
> +	spin_lock(&ctrl_lgrps_lock);
> +	ctrl_lgrps[ldev_num][lgrp_num] =3D NULL;
> +	spin_unlock(&ctrl_lgrps_lock);

[Severity: High]
In sl_ctrl_lgrp_release(), ctrl_lgrp->notif_work is canceled and
ctrl_lgrp->ctrl_notif.fifo is freed before ctrl_lgrps[ldev_num][lgrp_num] is
cleared under ctrl_lgrps_lock. If a concurrent caller looks up ctrl_lgrp via
sl_ctrl_lgrp_get() and calls sl_ctrl_lgrp_notif_enqueue() before the pointer
is unpublished, can it write to the freed kfifo and re-queue notif_work rig=
ht
before kfree(ctrl_lgrp)?

[ ... ]

> +	rtn =3D sl_core_lgrp_config_set(ldev_num, lgrp_num, lgrp_config);
> +	if (rtn) {
> +		sl_ctrl_log_err_trace(ctrl_lgrp, LOG_NAME, "core_lgrp_config_set faile=
d [%d]", rtn);
> +		goto out;
> +	}

[Severity: High]
When sl_ctrl_lgrp_config_set() calls sl_core_lgrp_config_set(), it invokes
sl_core_data_lgrp_link_config_check():

drivers/net/ethernet/hpe/sl/core/data/sl_core_data_lgrp.c:
sl_core_data_lgrp_link_config_check() {
	struct sl_core_link *core_link __free(sl_core_link_put) =3D NULL;
	...
	for (link_num =3D 0; link_num < SL_ASIC_MAX_LINKS; ++link_num) {
		core_link =3D sl_core_link_get(core_lgrp->core_ldev->num, core_lgrp->num,=
 link_num);
		if (!core_link)
			continue;
		...
	}
}

Because core_link is declared with __free(sl_core_link_put) outside the
for-loop, doesn't each iteration overwrite core_link without releasing the
reference from the previous iteration, leaking core_link references and
causing subsequent sl_core_link_del() / sl_ctrl_link_del() calls to fail wi=
th
-EBUSY?

> diff --git a/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_lgrp_notif.c b/driv=
ers/net/ethernet/hpe/sl/ctrl/sl_ctrl_lgrp_notif.c
> new file mode 100644
> index 0000000000000..298b8ab0306cf
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_lgrp_notif.c

[ ... ]

> +	counter =3D 0;
> +	while (sl_ctrl_lgrp_notif_list_state_get(ctrl_lgrp) =3D=3D SL_CTRL_LGRP=
_NOTIF_LIST_STATE_SENDING) {
> +		msleep(20);
> +		counter++;
> +		if (counter >=3D 10) {
> +			sl_ctrl_log_err(ctrl_lgrp, LOG_NAME, "registration timed out");
> +			rtn =3D -ETIMEDOUT;
> +			goto out;
> +		}
> +	}

[Severity: Medium]
In sl_ctrl_lgrp_notif_callback_reg(), sl_ctrl_lgrp_notif_callback_unreg(),
and sl_ctrl_lgrp_notif_work(), ctrl_lgrp->ctrl_notif.list_state is set to
SL_CTRL_LGRP_NOTIF_LIST_STATE_SENDING on entry to the work item and polled
with msleep(20) loops during registration and unregistration while
sl_ctrl_lgrp_notif_work() iterates reg_entry[] without holding a lock.

Could this custom list_state flag and sleep-polling loop be replaced with a
standard kernel synchronization primitive (such as a mutex or RCU/SRCU)?

[ ... ]

> +	spin_lock(&ctrl_lgrp->ctrl_notif.lock);
> +	if (kfifo_is_full(&ctrl_lgrp->ctrl_notif.fifo)) {
> +		spin_unlock(&ctrl_lgrp->ctrl_notif.lock);
> +		sl_ctrl_log_err(ctrl_lgrp, LOG_NAME, "notification fifo is full");
> +		return -ENOSPC;
> +	}
> +	spin_unlock(&ctrl_lgrp->ctrl_notif.lock);
> +
> +	if (info)
> +		notif_msg.info =3D *info;
> +	else
> +		memset(&notif_msg.info, 0, sizeof(notif_msg.info));
> +
> +	notif_msg.ldev_num =3D ctrl_lgrp->ctrl_ldev->num;
> +	notif_msg.lgrp_num =3D ctrl_lgrp->num;
> +	notif_msg.link_num =3D link_num;
> +	notif_msg.type     =3D type;
> +	notif_msg.info_map =3D info_map;
> +
> +	rtn =3D kfifo_in_spinlocked(&ctrl_lgrp->ctrl_notif.fifo, &notif_msg, si=
zeof(notif_msg),\n> +				  &ctrl_lgrp->ctrl_notif.lock);
> +	if (rtn !=3D sizeof(notif_msg)) {
> +		sl_ctrl_log_err(ctrl_lgrp, LOG_NAME, "write to kfifo failed");
> +		return -EFAULT;
> +	}
> +
> +	/* Don't catch the return as it might already be running.  This is ok */
> +	queue_work(ctrl_lgrp->ctrl_ldev->notif_workq, &ctrl_lgrp->notif_work);
> +
> +	return 0;
> +}
> +
> +void sl_ctrl_lgrp_notif_work(struct work_struct *notif_work)
> +{
> +	struct sl_ctrl_lgrp      *ctrl_lgrp;
> +	struct sl_lgrp_notif_msg  notif_msg;
> +	u8                        reg_idx;
> +	int                       rtn;
> +	bool                      is_empty;
> +
> +	ctrl_lgrp =3D container_of(notif_work, struct sl_ctrl_lgrp, notif_work);
> +
> +	sl_ctrl_log_dbg(ctrl_lgrp, LOG_NAME, "notif work");
> +
> +	spin_lock(&ctrl_lgrp->ctrl_notif.lock);
> +	ctrl_lgrp->ctrl_notif.list_state =3D SL_CTRL_LGRP_NOTIF_LIST_STATE_SEND=
ING;
> +	spin_unlock(&ctrl_lgrp->ctrl_notif.lock);
> +
> +	do {
> +		rtn =3D kfifo_out_spinlocked(&ctrl_lgrp->ctrl_notif.fifo,
> +					   &notif_msg, sizeof(notif_msg),
> +					   &ctrl_lgrp->ctrl_notif.lock);
> +		if (rtn !=3D sizeof(notif_msg)) {
> +			sl_ctrl_log_err(ctrl_lgrp, LOG_NAME, "read from kfifo failed");
> +			goto out;
> +		}
> +		for (reg_idx =3D 0; reg_idx < SL_CTRL_LGRP_NOTIF_REG_COUNT; ++reg_idx)=
 {
> +			if (notif_msg.type & ctrl_lgrp->ctrl_notif.reg_entry[reg_idx].types)
> +				(ctrl_lgrp->ctrl_notif.reg_entry[reg_idx].callback)
> +				(ctrl_lgrp->ctrl_notif.reg_entry[reg_idx].tag, &notif_msg);
> +		}
> +		spin_lock(&ctrl_lgrp->ctrl_notif.lock);
> +		is_empty =3D kfifo_is_empty(&ctrl_lgrp->ctrl_notif.fifo);
> +		spin_unlock(&ctrl_lgrp->ctrl_notif.lock);
> +	} while (!is_empty);

[Severity: High]
Can partial writes into ctrl_lgrp->ctrl_notif.fifo corrupt the notification
message stream?

In sl_ctrl_lgrp_notif.h, ctrl_lgrp->ctrl_notif.fifo is declared as a
byte-stream struct kfifo (element size 1), and kfifo_alloc() in
sl_ctrl_lgrp_new() rounds the byte size up to a power of two that is not a
multiple of sizeof(struct sl_lgrp_notif_msg). In
sl_ctrl_lgrp_notif_enqueue(), kfifo_is_full() only checks whether 0 unused
bytes remain (and drops ctrl_notif.lock before kfifo_in_spinlocked()). When
fewer than sizeof(notif_msg) unused bytes remain, kfifo_in_spinlocked()
writes a partial notif_msg into the FIFO and advances fifo.in, permanently
misaligning all subsequent sizeof(notif_msg) reads in
sl_ctrl_lgrp_notif_work().

Also, in sl_ctrl_lgrp_notif_work(), if sl_ctrl_lgrp_notif_enqueue() calls
queue_work() while sl_ctrl_lgrp_notif_work() is already running, the first
invocation's do-while loop drains the newly queued message, and the second
scheduled invocation enters the do-while loop on an empty FIFO and logs
"read from kfifo failed". (Note also that ctrl_notif.lock is acquired with
spin_lock_irqsave() inside kfifo_in_spinlocked()/kfifo_out_spinlocked() but
with plain spin_lock() elsewhere in this file.)

Would using a typedDECLARE_KFIFO_PTR(fifo, struct sl_lgrp_notif_msg) and a
while (kfifo_get(...)) loop under consistent locking avoid both issues?

> diff --git a/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link.c b/drivers/ne=
t/ethernet/hpe/sl/ctrl/sl_ctrl_link.c
> new file mode 100644
> index 0000000000000..f3a8246fcb670
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link.c

[ ... ]

> +	kref_init(&ctrl_link->ref_cnt);
> +	kref_init(&ctrl_link->mem_ref);
> +	INIT_WORK(&ctrl_link->release_work, sl_ctrl_link_release_work);
> +	mutex_init(&ctrl_link->delete_lock);
> +	init_completion(&ctrl_link->del_complete);

[Severity: High]
Should ctrl_link->down_complete also be initialized via init_completion() in
sl_ctrl_link_new(), with sl_ctrl_link_up_cmd() calling reinit_completion()
instead of init_completion()?

Currently, down_complete is only initialized in sl_ctrl_link_up_cmd() after
sl_ctrl_link_up() has already set ctrl_link->state =3D SL_LINK_STATE_STARTI=
NG
and dropped ctrl_link->data_lock. If sl_ctrl_link_down(),
sl_ctrl_link_reset(), or sl_ctrl_link_release_work() runs in that window
before init_completion(&ctrl_link->down_complete) executes (or if a fault
callback completes down_complete before the first link-up),
wait_for_completion_timeout() or complete_all() will operate on an
uninitialized completion waitqueue, and subsequent link-ups will overwrite
down_complete.wait via init_completion().

[ ... ]

> +	spin_lock(&ctrl_link->data_lock);
> +	link_state =3D ctrl_link->state;
> +	switch (link_state) {
> +	case SL_LINK_STATE_STARTING:
> +		ctrl_link->is_canceled =3D true;
> +		spin_unlock(&ctrl_link->data_lock);
> +		SL_CTRL_LINK_COUNTER_INC(ctrl_link, LINK_UP_CANCEL_CMD);
> +		sl_ctrl_link_cancel_cmd(ctrl_link);
> +		sl_ctrl_link_down_wait(ctrl_link);
> +		break;

[Severity: Medium]
In sl_ctrl_link_release_work(), doesn't the SL_LINK_STATE_STARTING case
increment LINK_UP_CANCEL_CMD twice (once here and once inside
sl_ctrl_link_cancel_cmd()), and omit setting ctrl_link->state =3D
SL_LINK_STATE_STOPPING before dropping ctrl_link->data_lock?

> +	case SL_LINK_STATE_UP:
> +	case SL_LINK_STATE_UP_DOWN_REQ:
> +		ctrl_link->state =3D SL_LINK_STATE_STOPPING;
> +		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "release stopping");
> +		spin_unlock(&ctrl_link->data_lock);
> +		sl_ctrl_link_down_cmd(ctrl_link);
> +		sl_ctrl_link_down_wait(ctrl_link);
> +		break;
> +	case SL_LINK_STATE_STOPPING:
> +		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "release already stopping");
> +		spin_unlock(&ctrl_link->data_lock);
> +		sl_ctrl_link_down_wait(ctrl_link);
> +		break;
> +	case SL_LINK_STATE_DOWN:
> +		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "release already down");
> +		spin_unlock(&ctrl_link->data_lock);
> +		break;

[ ... ]

> +int sl_ctrl_link_config_set(u8 ldev_num, u8 lgrp_num, u8 link_num,
> +			    struct sl_link_config *link_config)
> +{
> +	int                  rtn;
> +	struct sl_ctrl_link *ctrl_link __free(sl_ctrl_link_put) =3D NULL;
> +	u32                  link_state;
> +
> +	ctrl_link =3D sl_ctrl_link_get(ldev_num, lgrp_num, link_num);
> +	if (!ctrl_link)
> +		return -ENODEV;
> +	if (!ctrl_link) {
> +		sl_ctrl_log_err(NULL, LOG_NAME,
> +				"config set NULL link (ldev_num =3D %u, lgrp_num =3D %u, link_num =
=3D %u)",
> +			ldev_num, lgrp_num, link_num);
> +		return -EBADRQC;
> +	}
> +
> +	if (!sl_ctrl_link_kref_get_unless_zero(ctrl_link)) {
> +		sl_ctrl_log_err(ctrl_link, LOG_NAME, "config set link ref unavailable =
(ctrl_link =3D 0x%p)",
> +				ctrl_link);
> +		return -EBADRQC;
> +	}

[Severity: High]
Across 16 functions in sl_ctrl_link.c (sl_ctrl_link_config_set(),
sl_ctrl_link_policy_set(), sl_ctrl_link_an_lp_caps_get(),
sl_ctrl_link_an_lp_caps_stop(), sl_ctrl_link_up(), sl_ctrl_link_down(),
sl_ctrl_link_reset(), sl_ctrl_link_up_clocks_get(),
sl_ctrl_link_up_count_get(), sl_ctrl_link_state_get_cmd(),
sl_ctrl_link_an_lp_caps_state_get(), sl_ctrl_link_an_fail_cause_get(), and
sl_ctrl_link_info_map_get()), sl_ctrl_link_fec.c
(sl_ctrl_link_fec_info_get() and sl_ctrl_link_fec_tail_get()), and
sl_ctrl_link_priv.c (sl_ctrl_link_fault_start_callback()), it looks like an
automated __free(sl_ctrl_link_put) conversion was partially applied on top =
of
existing manual reference counting:

1. An extra "if (!ctrl_link) return -ENODEV;" was inserted right before the
existing "if (!ctrl_link)" block, making the second block dead code and
changing the return values when the link does not exist. In particular, in
sl_ctrl_link_state_get_cmd() this returns -ENODEV instead of returning 0 wi=
th
*state =3D SL_LINK_STATE_INVALID, and in sl_ctrl_link_an_lp_caps_state_get()
it returns -ENODEV instead of -EINVAL.

2. sl_ctrl_link_get() already acquires a reference on ctrl_link->ref_cnt via
kref_get_unless_zero(), and __free(sl_ctrl_link_put) will release it at sco=
pe
exit, but these functions still call sl_ctrl_link_kref_get_unless_zero() to
take a second reference and manually call sl_ctrl_link_put() at the end or
via goto out. Because two references are held, the manual
"if (sl_ctrl_link_put(ctrl_link))" checks can never observe the final put,
and mixing __free() with goto cleanup (as well as declaring __free()
variables as NULL at the top of the function instead of at initialization,
including held_lgrp_1 and held_link_1) goes against kernel Cleanup API
conventions.

Should the duplicate NULL checks, extra sl_ctrl_link_kref_get_unless_zero()
calls, and manual sl_ctrl_link_put() / goto out paths be removed so __free()
manages the single reference returned by sl_ctrl_link_get()?

[ ... ]

> +	spin_lock(&ctrl_link->data_lock);
> +	link_state =3D ctrl_link->state;
> +	switch (link_state) {
> +	case SL_LINK_STATE_STARTING:
> +		ctrl_link->state =3D SL_LINK_STATE_STOPPING;
> +		ctrl_link->is_canceled =3D true;
> +		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "down - canceling");
> +		spin_unlock(&ctrl_link->data_lock);
> +		rtn =3D sl_ctrl_link_cancel_cmd(ctrl_link);
> +		if (rtn) {
> +			sl_ctrl_log_err_trace(ctrl_link, LOG_NAME, "cancel_cmd failed [%d]", =
rtn);
> +			goto out;
> +		}
> +
> +		rtn =3D 0;
> +		goto out;
> +	case SL_LINK_STATE_UP:
> +	case SL_LINK_STATE_UP_DOWN_REQ:
> +		ctrl_link->state =3D SL_LINK_STATE_STOPPING;
> +		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "down - stopping");
> +		spin_unlock(&ctrl_link->data_lock);
> +		rtn =3D sl_ctrl_link_down_cmd(ctrl_link);
> +		if (rtn) {
> +			sl_ctrl_log_err_trace(ctrl_link, LOG_NAME, "down_cmd failed [%d]", rt=
n);
> +			goto out;
> +		}

[Severity: High]
In sl_ctrl_link_down(), if sl_ctrl_link_cancel_cmd() or
sl_ctrl_link_down_cmd() fails, ctrl_link->state is left in
SL_LINK_STATE_STOPPING when jumping to out, and no down callback will run to
transition it to SL_LINK_STATE_DOWN. Should ctrl_link->state be restored on
error, similar to sl_ctrl_link_async_down()?

[ ... ]

> +static int sl_ctrl_link_reset_cmd(struct sl_ctrl_link *ctrl_link)
> +{
> +	int           rtn;
> +	u8            ldev_num;
> +	u8            lgrp_num;
> +	u8            link_num;
> +	unsigned long timeleft;

[ ... ]

> +	rtn =3D sl_core_link_down(ldev_num, lgrp_num, link_num, sl_ctrl_link_do=
wn_callback,
> +				ctrl_link, SL_LINK_DOWN_CAUSE_COMMAND_MAP);
> +	if (rtn)
> +		sl_ctrl_log_warn(ctrl_link, LOG_NAME, "core_link_down failed [%d]", rt=
n);
> +
> +	timeleft =3D wait_for_completion_timeout(&ctrl_link->down_complete,
> +					       msecs_to_jiffies(SL_CTRL_LINK_DOWN_WAIT_TIMEOUT_MS));
> +	if (timeleft =3D=3D 0)
> +		sl_ctrl_log_err(ctrl_link, LOG_NAME,
> +				"completion_timeout (down_complete =3D 0x%p)", &ctrl_link->down_comp=
lete);
> +
> +	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "completion (timeleft =3D %lu)", t=
imeleft);
> +
> +	sl_core_link_reset(ldev_num, lgrp_num, link_num);
> +
> +	return 0;
> +}
> +
> +int sl_ctrl_link_reset(u8 ldev_num, u8 lgrp_num, u8 link_num)
> +{

[ ... ]

> +	spin_lock(&ctrl_link->data_lock);
> +	link_state =3D ctrl_link->state;
> +	switch (link_state) {
> +	case SL_LINK_STATE_STARTING:
> +		ctrl_link->is_canceled =3D true;
> +		SL_CTRL_LINK_COUNTER_INC(ctrl_link, LINK_UP_CANCEL_CMD);
> +		fallthrough;
> +	case SL_LINK_STATE_UP:
> +	case SL_LINK_STATE_UP_DOWN_REQ:
> +		ctrl_link->state =3D SL_LINK_STATE_STOPPING;
> +		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "reset - stopping");
> +		spin_unlock(&ctrl_link->data_lock);
> +		rtn =3D sl_ctrl_link_reset_cmd(ctrl_link);

[Severity: High]
When sl_ctrl_link_reset() is called while ctrl_link->state is
SL_LINK_STATE_STARTING, it falls through to sl_ctrl_link_reset_cmd(), which
calls sl_core_link_down() instead of sl_core_link_cancel().

Because the core link state during bring-up is SL_CORE_LINK_STATE_GOING_UP =
or
SL_CORE_LINK_STATE_AN, sl_core_link_down() rejects the request with -EBADRQC
without registering sl_ctrl_link_down_callback. Doesn't this cause
wait_for_completion_timeout(&ctrl_link->down_complete, ...) to stall for the
full 2000ms timeout, pulse hardware reset via sl_core_link_reset() while co=
re
bring-up timers and work items are still active, and leave ctrl_link->state
stuck in SL_LINK_STATE_STOPPING?

Should sl_ctrl_link_reset_cmd() call sl_core_link_cancel() when resetting f=
rom
SL_LINK_STATE_STARTING?

> diff --git a/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link_fec.c b/driver=
s/net/ethernet/hpe/sl/ctrl/sl_ctrl_link_fec.c
> new file mode 100644
> index 0000000000000..2c54795281e00
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link_fec.c

[ ... ]

> +	/* B =3D BER
> +	 * n =3D [U/C]CW count
> +	 * g =3D Good CW count
> +	 * T =3D total CW =3D ccw_count + g
> +	 * t =3D time =3D (jiffies / HZ)
> +	 *
> +	 * B =3D (n/T) / t; B =3D (n * HZ) / (T * jiffies)
> +	 */
> +
> +	/* We use RS(544/514) with 10 bit symbols which is a total of 5440 bits=
 per CW. */
> +	total =3D fec_info->ccw + (fec_info->gcw * 5440);
> +
> +	/* CCW count * CCW multiplier */
> +	ccw_rate =3D (fec_info->ccw * HZ * SL_CTRL_LINK_FEC_CCW_BER_MULT) / (to=
tal * fec_info->period_ms);

[Severity: High]
In sl_ctrl_link_fec_ber_calc(), what happens if fec_info->period_ms is 0 (f=
or
example, if a caller passes period_ms =3D=3D 0 or two samples have the same
jiffies timestamp)? Neither total =3D=3D 0 nor the MAX_CCW_COUNT / MAX_UCW_=
COUNT
checks guard against fec_info->period_ms =3D=3D 0, so dividing by
(total * fec_info->period_ms) here and in the ucw_rate calculation below wi=
ll
trigger a divide-by-zero fault in the kernel.

Also, the comment notes "B =3D (n * HZ) / (T * jiffies)", but the denominat=
or
uses fec_info->period_ms (milliseconds) while the numerator multiplies by HZ
instead of MSEC_PER_SEC (1000). Won't that produce an incorrect BER whenever
HZ !=3D 1000?

> diff --git a/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link_fec_priv.c b/d=
rivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link_fec_priv.c
> new file mode 100644
> index 0000000000000..a1f50d1a3b3c6
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link_fec_priv.c

[ ... ]

> +	if (ctrl_link->fec_data.info.monitor.ucw_down_limit &&
> +	    (ctrl_link->fec_data.info.monitor.ucw_warn_limit > ctrl_link->fec_d=
ata.info.monitor.ucw_down_limit))
> +		sl_ctrl_log_warn(ctrl_link, LOG_NAME,
> +				 "CCW warning limit set greater than down limit (%d > %d)",
> +			ctrl_link->fec_data.info.monitor.ucw_warn_limit,
> +			ctrl_link->fec_data.info.monitor.ucw_down_limit);

[ ... ]

> +int sl_ctrl_link_fec_data_check(struct sl_ctrl_link *ctrl_link)
> +{
> +	int                rtn;
> +	s32                ccw_down_limit;
> +	s32                ccw_warn_limit;
> +	s32                ucw_down_limit;
> +	s32                ucw_warn_limit;
> +	struct sl_fec_info fec_info;
> +	bool               is_limit_crossed;
> +	time64_t           limit_crossed_time;
> +
> +	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "data check");
> +
> +	spin_lock(&ctrl_link->fec_data.lock);
> +	ccw_down_limit =3D ctrl_link->fec_data.info.monitor.ccw_down_limit;
> +	ccw_warn_limit =3D ctrl_link->fec_data.info.monitor.ccw_warn_limit;
> +	ucw_down_limit =3D ctrl_link->fec_data.info.monitor.ucw_down_limit;
> +	ucw_warn_limit =3D ctrl_link->fec_data.info.monitor.ucw_warn_limit;
> +	spin_unlock(&ctrl_link->fec_data.lock);
> +
> +	fec_info =3D ctrl_link->fec_data.info;

[Severity: Medium]
In sl_ctrl_link_fec_data_check(), fec_info =3D ctrl_link->fec_data.info is
copied right after releasing ctrl_link->fec_data.lock (and
sl_ctrl_link_fec_data_calc() similarly reads ctrl_link->fec_data.info and
ctrl_link->fec_data.tail after dropping ctrl_link->fec_data.lock). Should
fec_info be copied while holding ctrl_link->fec_data.lock so it cannot race
with concurrent updates in sl_ctrl_link_fec_mon_limits_calc()?

> +
> +	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
> +			"data check config (ccw_down =3D %d, ucw_down =3D %d, ccw_warn =3D %d=
, ucw_warn =3D %d)",
> +		ccw_down_limit, ucw_down_limit, ccw_warn_limit, ucw_warn_limit);
> +
> +	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
> +			"data check info (UCW =3D %llu, CCW =3D %llu, GCW =3D %llu, period =
=3D %ums)",
> +		fec_info.ucw, fec_info.ccw, fec_info.gcw, fec_info.period_ms);
> +
> +	if (sl_ctrl_link_fec_ucw_chance_limit_check(ctrl_link, ucw_down_limit, =
&fec_info)) {
> +		sl_ctrl_log_err(ctrl_link, LOG_NAME,
> +				"UCW exceeded down limit (UCW =3D %llu, CCW =3D %llu, ucw_chance =3D=
 %u)",
> +			fec_info.ucw, fec_info.ccw, ctrl_link->fec_ucw_chance);
> +		ctrl_link->fec_ucw_chance =3D 0;
> +		rtn =3D sl_ctrl_link_async_down(ctrl_link, SL_LINK_DOWN_CAUSE_UCW_MAP,=
 false);
> +		if (rtn) {
> +			sl_ctrl_log_err_trace(ctrl_link, LOG_NAME,
> +					      "data check UCW ctrl_link_async_down failed [%d]", rtn);
> +			return rtn;
> +		}
> +		return -EIO;
> +	}
> +
> +	if (sl_ctrl_link_fec_ccw_chance_limit_check(ctrl_link, ccw_down_limit, =
&fec_info)) {
> +		sl_ctrl_log_err(ctrl_link, LOG_NAME,
> +				"CCW exceeded down limit (UCW =3D %llu, CCW =3D %llu, ccw_chance =3D=
 %u)",
> +			fec_info.ucw, fec_info.ccw, ctrl_link->fec_ccw_chance);
> +		ctrl_link->fec_ccw_chance =3D 0;
> +		rtn =3D sl_ctrl_link_async_down(ctrl_link, SL_LINK_DOWN_CAUSE_CCW_MAP,=
 false);
> +		if (rtn) {
> +			sl_ctrl_log_err_trace(ctrl_link, LOG_NAME,
> +					      "data check CCW ctrl_link_async_down failed [%d]", rtn);
> +			return rtn;
> +		}
> +		return -EIO;
> +	}

[Severity: Medium]
When sl_ctrl_link_fec_ucw_chance_limit_check() or
sl_ctrl_link_fec_ccw_chance_limit_check() triggers a link down here, should
SL_CTRL_LINK_COUNTER_INC(ctrl_link, LINK_DOWN_UCW_CAUSE) and
SL_CTRL_LINK_COUNTER_INC(ctrl_link, LINK_DOWN_CCW_CAUSE) be incremented?
Those counters are initialized in sl_ctrl_link_counters_init() but never
incremented anywhere.

Also, in sl_ctrl_link_fec_mon_limits_calc() above, the warning message for
ucw_warn_limit > ucw_down_limit says "CCW warning limit set greater than do=
wn
limit" instead of "UCW".

> +
> +	if (SL_CTRL_LINK_FEC_UCW_LIMIT_CHECK(ucw_warn_limit, &fec_info)) {
> +		rtn =3D sl_core_link_ucw_warn_limit_crossed_get(ctrl_link->ctrl_lgrp->=
ctrl_ldev->num,
> +							      ctrl_link->ctrl_lgrp->num, ctrl_link->num, &is_limit_crosse=
d, &limit_crossed_time);
> +		if (rtn)
> +			sl_core_log_warn_trace(ctrl_link, LOG_NAME, "ucw_warn_limit_crossed_g=
et failed [%d]", rtn);
> +
> +		if (!is_limit_crossed) {

[Severity: Medium]
In sl_ctrl_link_fec_data_check(), is_limit_crossed is not initialized on the
stack. If sl_core_link_ucw_warn_limit_crossed_get() (or
sl_core_link_ccw_warn_limit_crossed_get() below) returns an error such as
-ENODEV, isn't is_limit_crossed read uninitialized in "if (!is_limit_crosse=
d)"?

[ ... ]

> +	held_link_1 =3D sl_core_link_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
> +				       ctrl_link->ctrl_lgrp->num, ctrl_link->num);
> +	if (!held_link_1)
> +		return;
> +	if (sl_core_link_is_pml_recovery_running(held_link_1)) {
> +		sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME, "fec monitor skipped due t=
o pml recovery running");
> +		goto start_mon;
> +	}
> +
> +	spin_lock(&ctrl_link->fec_mon_timer_lock);
> +	stop =3D ctrl_link->fec_mon_timer_stop;
> +	spin_unlock(&ctrl_link->fec_mon_timer_lock);
> +	if (stop) {
> +		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "monitor stopped");
> +		return;
> +	}
> +
> +	rtn =3D sl_ctrl_link_fec_data_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
> +					ctrl_link->ctrl_lgrp->num, ctrl_link->num, &cw_cntrs, &lane_cntrs,
> +					&tail_cntrs);
> +	if (rtn) {
> +		sl_ctrl_log_err_trace(ctrl_link, LOG_NAME,
> +				      "core_link_fec_tail_cntrs_get failed [%d]", rtn);
> +		goto start_mon;
> +	}

[ ... ]

> +	spin_lock(&ctrl_link->fec_mon_timer_lock);
> +	stop =3D ctrl_link->fec_mon_timer_stop;
> +	spin_unlock(&ctrl_link->fec_mon_timer_lock);
> +	if (stop) {
> +		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "monitor stopped");
> +		return;
> +	}
> +
> +start_mon:
> +	mod_timer(&ctrl_link->fec_mon_timer, jiffies + msecs_to_jiffies(period)=
);
> +	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "monitor started");
> +}
> +
> +void sl_ctrl_link_fec_mon_timer(struct timer_list *timer)
> +{
> +	struct sl_ctrl_link *ctrl_link;
> +
> +	ctrl_link =3D timer_container_of(ctrl_link, timer, fec_mon_timer);
> +
> +	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "monitor timer");
> +
> +	queue_work(ctrl_link->ctrl_lgrp->ctrl_ldev->workq, &ctrl_link->fec_mon_=
timer_work);
> +}
> +
> +void sl_ctrl_link_fec_mon_stop(struct sl_ctrl_link *ctrl_link)
> +{
> +	bool stop;
> +
> +	sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "monitor stop");
> +
> +	spin_lock(&ctrl_link->fec_mon_timer_lock);
> +	stop =3D ctrl_link->fec_mon_timer_stop;
> +	ctrl_link->fec_mon_timer_stop =3D true;
> +	ctrl_link->fec_mon_state =3D SL_CTRL_LINK_FEC_MON_OFF;
> +	spin_unlock(&ctrl_link->fec_mon_timer_lock);
> +
> +	if (stop) {
> +		sl_ctrl_log_dbg(ctrl_link, LOG_NAME, "monitor already stopped");
> +		return;
> +	}
> +
> +	timer_delete_sync(&ctrl_link->fec_mon_timer);
> +}

[Severity: Critical]
Can fec_mon_timer be re-armed after sl_ctrl_link_fec_mon_stop() and fire
after ctrl_link is freed?

1. In sl_ctrl_link_fec_mon_timer_work(), both "goto start_mon" branches
(when sl_core_link_is_pml_recovery_running() is true and when
sl_ctrl_link_fec_data_get() returns an error such as -ENOLINK during link
down) jump directly to mod_timer(), bypassing the fec_mon_timer_stop check.
Even on the non-error path, fec_mon_timer_lock is dropped before calling
mod_timer().

2. Callers that stop FEC monitoring call sl_ctrl_link_fec_mon_stop() before
cancel_work_sync(&ctrl_link->fec_mon_timer_work). If
sl_ctrl_link_fec_mon_timer_work() was already running when
sl_ctrl_link_fec_mon_stop() set fec_mon_timer_stop =3D true and called
timer_delete_sync(), the running work item can then execute mod_timer() at
start_mon. Because sl_ctrl_link_fec_mon_stop() returns early without calling
timer_delete_sync() when fec_mon_timer_stop is already true, later calls to
sl_ctrl_link_fec_mon_stop() will not delete the re-armed timer.

3. In addition, sl_ctrl_link_policy_set() checks link_state via
sl_ctrl_data_link_state_get() and then calls sl_ctrl_link_fec_mon_start()
without holding data_lock across the state check, and
sl_ctrl_link_release_work() frees ctrl_link when in SL_LINK_STATE_DOWN
without calling sl_ctrl_link_fec_mon_stop() or
cancel_work_sync(&ctrl_link->fec_mon_timer_work).

Should start_mon check !ctrl_link->fec_mon_timer_stop under
fec_mon_timer_lock before calling mod_timer(), and should
sl_ctrl_link_release_work() unconditionally stop the timer and cancel
fec_mon_timer_work before freeing ctrl_link?

> +
> +#define SL_CTRL_LINK_FEC_LIMIT_25   25781250000ULL
> +#define SL_CTRL_LINK_FEC_LIMIT_50   53125000000ULL
> +#define SL_CTRL_LINK_FEC_LIMIT_100 106250000000ULL
> +u32 sl_ctrl_link_fec_limit_calc(struct sl_ctrl_link *ctrl_link, u32 mant=
, int exp)
> +{
> +	u64                 limit;
> +	int                 x;
> +	struct sl_link_caps link_caps;
> +
> +	sl_core_link_caps_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
> +			      ctrl_link->ctrl_lgrp->num, ctrl_link->num, &link_caps);
> +
> +	sl_ctrl_log_dbg(ctrl_link, LOG_NAME,
> +			"fec limit calc (tech_map =3D 0x%X, mant =3D %u, exp =3D %d)",
> +		link_caps.tech_map, mant, exp);

[Severity: Medium]
In sl_ctrl_link_fec_limit_calc(), link_caps is uninitialized on the stack a=
nd
the return value of sl_core_link_caps_get() is not checked. If
sl_core_link_caps_get() returns -ENODEV, won't this read an uninitialized
link_caps.tech_map?

> diff --git a/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link_priv.c b/drive=
rs/net/ethernet/hpe/sl/ctrl/sl_ctrl_link_priv.c
> new file mode 100644
> index 0000000000000..252673b57a0b3
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_link_priv.c

[ ... ]

> +int sl_ctrl_link_up_callback(void *tag, struct sl_core_link_up_info *up_=
info)
> +{
> +	struct sl_ctrl_link         *ctrl_link;
> +	char                         core_imap_str[SL_LINK_INFO_STRLEN];
> +	int                          max_up_tries;
> +	u32                          up_count;
> +	int                          rtn;
> +	s64                          attempt_time;
> +	s64                          total_time;
> +	s64                          up_time;

[ ... ]

> +		/* check up tries */
> +		rtn =3D sl_ctrl_link_up_count_get(ctrl_link->ctrl_lgrp->ctrl_ldev->num,
> +						ctrl_link->ctrl_lgrp->num, ctrl_link->num, &up_count);
> +		if (rtn)
> +			sl_ctrl_log_warn_trace(ctrl_link, LOG_NAME, "link_up_count_get failed=
 [%d]", rtn);
> +
> +		if ((up_count >=3D max_up_tries) && (max_up_tries !=3D SL_LINK_INFINIT=
E_UP_TRIES)) {

[Severity: Medium]
In sl_ctrl_link_up_callback(), up_count, attempt_time, total_time, and
up_time are uninitialized on the stack. Although sl_ctrl_link_up_callback()
already has the ctrl_link pointer, it calls sl_ctrl_link_up_clocks_get() and
sl_ctrl_link_up_count_get(), which look up ctrl_link via sl_ctrl_link_get().

When sl_ctrl_link_del() has set ctrl_link->delete_requested =3D true,
sl_ctrl_link_get() returns NULL and both getters return -ENODEV without
writing their output arguments. Doesn't sl_ctrl_link_up_callback() then use
the uninitialized up_count in
"if ((up_count >=3D max_up_tries) && (max_up_tries !=3D SL_LINK_INFINITE_UP=
_TRIES))"
(and log uninitialized up_count, attempt_time, and total_time in the
SL_CORE_LINK_STATE_UP case), similar to the uninitialized stack reads in
sl_ctrl_link_fec_data_check() and sl_ctrl_link_fec_limit_calc()?

Reading ctrl_link->up_clock directly via internal helpers Taking ctrl_link
(or initializing the variables and handling the error) would avoid this.

> diff --git a/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_llr.c b/drivers/net=
/ethernet/hpe/sl/ctrl/sl_ctrl_llr.c
> new file mode 100644
> index 0000000000000..016ea353da4f5
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_llr.c

[ ... ]

> +	case SL_CORE_LLR_STATE_START_TIMEOUT:
> +		SL_CTRL_LLR_COUNTER_INC(ctrl_llr, LLR_START_TIMEOUT);
> +		if (ctrl_llr->policy.options & SL_LLR_POLICY_OPT_CONTINUOUS_START_TRIE=
S) {
> +			sl_ctrl_log_dbg(ctrl_llr, LOG_NAME, "start TIMEOUT retry");
> +			rtn =3D sl_core_llr_start(ctrl_llr->ctrl_lgrp->ctrl_ldev->num, ctrl_l=
lr->ctrl_lgrp->num,
> +						ctrl_llr->num, sl_ctrl_llr_start_callback, ctrl_llr, 0);
> +			if (rtn)
> +				sl_ctrl_log_warn_trace(ctrl_llr, LOG_NAME,
> +						       "start TIMEOUT core_llr_start retry failed [%d]", rtn);
> +		}
> +		rtn =3D sl_ctrl_lgrp_notif_enqueue(ctrl_llr->ctrl_lgrp, ctrl_llr->num,
> +						 SL_LGRP_NOTIF_LLR_START_TIMEOUT, NULL, ctrl_llr->start.imap);
> +		if (rtn)
> +			sl_ctrl_log_warn_trace(ctrl_llr, LOG_NAME,
> +					       "start TIMEOUT ctrl_lgrp_notif_enqueue failed [%d[", rtn);
> +		return;

[Severity: High]
Does the SL_LLR_POLICY_OPT_CONTINUOUS_START_TRIES retry in
sl_ctrl_llr_start_callback() ever succeed?

In drivers/net/ethernet/hpe/sl/core/hw/sl_core_hw_llr.c,
sl_core_hw_llr_start_timeout_work() sets core_llr->state to
SL_CORE_LLR_STATE_START_TIMEOUT before invoking sl_ctrl_llr_start_callback(=
),
and only transitions core_llr->state back to SL_CORE_LLR_STATE_SETUP after
the callback returns:

sl_core_hw_llr_start_timeout_work() {
    ...
	core_llr->state =3D SL_CORE_LLR_STATE_START_TIMEOUT;
	spin_unlock_irqrestore(&core_llr->data_lock, irq_flags);
    ...
	sl_core_hw_llr_start_callback(core_llr);

	spin_lock_irqsave(&core_llr->data_lock, irq_flags);
	core_llr->state =3D SL_CORE_LLR_STATE_SETUP;
	spin_unlock_irqrestore(&core_llr->data_lock, irq_flags);
}

Because sl_core_llr_start() only accepts SL_CORE_LLR_STATE_SETUP and returns
-EBADRQC for SL_CORE_LLR_STATE_START_TIMEOUT, calling sl_core_llr_start()
synchronously inside sl_ctrl_llr_start_callback() will always fail with
-EBADRQC (and even if it succeeded, sl_core_hw_llr_start_timeout_work() wou=
ld
immediately overwrite core_llr->state back to SL_CORE_LLR_STATE_SETUP).
(Also note that ctrl_llr->policy.options, ctrl_llr->setup, and
ctrl_llr->start are accessed in these callbacks without holding
ctrl_llr->data_lock.)

> +	case SL_CORE_LLR_STATE_SETUP:
> +		SL_CTRL_LLR_COUNTER_INC(ctrl_llr, LLR_SETUP);
> +		rtn =3D sl_ctrl_lgrp_notif_enqueue(ctrl_llr->ctrl_lgrp, ctrl_llr->num,
> +						 SL_LGRP_NOTIF_LLR_CANCELED, NULL, ctrl_llr->start.imap);
> +		if (rtn)
> +			sl_ctrl_log_warn_trace(ctrl_llr, LOG_NAME,
> +					       "start CONFIGURED ctrl_lgrp_notif_enqueue failed [%d[", rtn);
> +		return;
> +	default:
> +		memset(&ctrl_llr->setup.data, 0, sizeof(struct sl_llr_data));
> +		sl_ctrl_log_err(ctrl_llr, LOG_NAME, "start ERROR invalid (state =3D %u=
 %s)",
> +				core_llr_state, sl_core_llr_state_str(core_llr_state));
> +		info.error =3D -ENOMSG;
> +		rtn =3D sl_ctrl_lgrp_notif_enqueue(ctrl_llr->ctrl_lgrp, ctrl_llr->num,=
 SL_LGRP_NOTIF_LLR_ERROR,
> +						 &info, ctrl_llr->setup.imap);

[Severity: Medium]
In the default branch of sl_ctrl_llr_start_callback(), should
sl_ctrl_lgrp_notif_enqueue() be passed ctrl_llr->start.imap instead of
ctrl_llr->setup.imap?

> diff --git a/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_mac.c b/drivers/net=
/ethernet/hpe/sl/ctrl/sl_ctrl_mac.c
> new file mode 100644
> index 0000000000000..a4202757d238d
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sl/ctrl/sl_ctrl_mac.c

[ ... ]

> +	tx_rtn =3D sl_core_mac_tx_stop(ldev_num, lgrp_num, mac_num);
> +	if (tx_rtn) {
> +		/* Log error, but allow the function to continue to mac rx stop */
> +		sl_ctrl_log_err_trace(ctrl_mac, LOG_NAME, "reset - core_mac_tx_stop fa=
iled [%d]", tx_rtn);
> +	}
> +
> +	rx_rtn =3D sl_core_mac_rx_stop(ldev_num, lgrp_num, mac_num);
> +	if (rx_rtn) {
> +		/* Log error, but allow the function to continue execution */
> +		sl_ctrl_log_err_trace(ctrl_mac, LOG_NAME, "core_mac_rx_stop failed [%d=
]", rx_rtn);
> +	}
> +
> +	if (tx_rtn && rx_rtn) {
> +		SL_CTRL_MAC_COUNTER_INC(ctrl_mac, MAC_RESET_FAIL);
> +		rtn =3D -EIO;
> +	} else {
> +		SL_CTRL_MAC_COUNTER_INC(ctrl_mac, MAC_RESET);
> +	}

[Severity: Medium]
In sl_ctrl_mac_reset(), should this check "if (tx_rtn || rx_rtn)" instead of
"if (tx_rtn && rx_rtn)" so that a failure in either sl_core_mac_tx_stop() or
sl_core_mac_rx_stop() is reported as a reset failure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-cxi-netdev=
-submission-v1-0-8c2c391cc283@hpe.com?part=3D12
