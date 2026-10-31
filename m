Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480531;
	b=0IkR43DXrd79rEa0TYdFZeK+0A3KHawCUo13JnTUt71hHQoyUcjw47e/YBwlAqICkafC
	 VUj0ecc1bDoSvxUVobtBbEI9a1w57wNZFMpS0wp5LuM5FNHEZ9hZjBTdNM7pNmp3JSsgi
	 Ya2EItHkNwDBEzUOXaMj95gI0yHOZ4fF1W+4YfmOXCTkQJPlbY1b+FqEoohvJnKl++1KC
	 /DHx0q+Sj8r3KtXP/5ftjYgx8Q9QzC49I1rp/lKSdkMf8sXY1uxudGYV6AGpX/oEoZZ7j
	 t/1u7lFNc/8r6AgKuDuOR9pIf1C2eUrlqfpFJIaFf4NOOLU7XPH/rqtmNPwc8iYEwSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480531;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PwaTnc4OfkfFqCpF7/s42MPnj9Q3c5xW6s4OEpf0R/Y=;
	b=m32hRQunJDYzXN/ncq6/tcmU2h3JmuTYUevM8FevDOf7yXQky7NBnDXBzWA45LHTQES0
	 HQiO6sHilLL20aiSb69D66PtZph157p3tCnxvP9ySHW7FQ+jwvoUL04SdNiWCUS4qWYC8
	 E7C0KgvuO1jolB9vnTsMlQLYb4UF12XduA4y7znTclFdp5Xf0+joGEK8x3+VkEw8Y270A
	 3OuS4hrzN8lcWVXVa5seDp/rzlEMXr7fq+xqex5PkPsQHINpZmZZVyxYLdZKqvmPwrKho
	 sls2qsQxxPzZPq8CiyYgeIQmHX+DF+RsUWrwBR32lEombrNfSS/V+N+faMPTg1iOlbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TwESMte1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39A6606A31C
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 21:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TwESMte1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92FD81F00919;
	Sat, 31 Oct 2026 21:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793480530;
	bh=PwaTnc4OfkfFqCpF7/s42MPnj9Q3c5xW6s4OEpf0R/Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TwESMte1UP1LtifvaqSHHKuf6uoXhegxGpbki7wnoSRK19q1e+kxECbB0e8xYV7av
	 Z2PBJTm0Pmuwtfg0DWrOHhy/QHltnymRt8fVMWp+FIRWY9Yfiakd/o5is6LQyQ2x29
	 YszXkDU6ht2V7B4jBcfyBJTMKvK/2MzU9m+BkfpKQkhzcIizXoaOqvey6V9L1Im8hl
	 SDzB/Ta9lM8PUOczYWIFsher9wIvV8xO+XOCx/e3fNXXssn6F9WP+PZFiv65j4SbjB
	 QpuUrQ2Y9ESAbwKFg5puWCZ9874MTLCB6qZZKY+4xrl1kr/5RAaOsXPCCxrkRYsiXq
	 TQnjOXrHSt9kg==
Message-ID: <sashiko-outbox-192139@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/23] net: hpe: sbl: add the SBM serial bus layer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Doug Ledford" <doug.ledford@hpe.com>, "Slingshot Open Source Team" <slingshot-os-team@groups.ext.hpe.com>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Richard
 Cochran" <richardcochran@gmail.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Guenter
 Roeck" <linux@roeck-us.net>
Cc: linux-kbuild@vger.kernel.org
In-Reply-To: <20261030-cxi-netdev-submission-v1-7-8c2c391cc283@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030-cxi-netdev-submission-v1-7-8c2c391cc283@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 21:02:09 +0000
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
- [High] net: hpe: sbl: mask before shift zeroes data in sbl_sbm_spico_int()
- [High] net: hpe: sbl: clobbered err and uninit result read in sbl_sbus_op=
_aux()
- [High] net: hpe: sbl: ABBA lock inversion in sbl_serdes_spico_int() via s=
pico_reset
- [Low] net: hpe: sbl: non-static inline helpers in sbl_sbm.h lack prototyp=
es
- [Low] net: hpe: sbl: excessive stack buffers in sbus_msg() and sbus_cmd_t=
o_string()
--

commit 631299f2193252311d8e118f2c871a0e2587bd5a
Author: Doug Ledford <doug.ledford@hpe.com>

net: hpe: sbl: add the SBM serial bus layer

This commit adds the Serial Bus Master (SBM) layer for accessing SerDes
and PMI registers along with NIC-specific SerDes address helpers.

> diff --git a/drivers/net/ethernet/hpe/sbl/sbl_sbm_serdes.c b/drivers/net/=
ethernet/hpe/sbl/sbl_sbm_serdes.c
> new file mode 100644
> index 0000000000000..1d1c4d01e1598
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sbl/sbl_sbm_serdes.c
> @@ -0,0 +1,1114 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/* Copyright 2025-2026 Hewlett Packard Enterprise Development LP. All Ri=
ghts Reserved. */
> +
> +#include <linux/kernel.h>
> +#include <linux/device.h>
> +#include <linux/delay.h>
> +
> +#include <uapi/ethernet/sbl_sbm_constants.h>
> +
> +#include "sbl_sbm_serdes.h"
> +#include "sbl_serdes_map.h"
> +#include "sbl_sbm.h"

[Severity: Low]
In drivers/net/ethernet/hpe/sbl/sbl_sbm.h, the nine inline helper functions
(sbl_sbm_sbus_op(), sbl_sbm_sbus_op_reset(), sbl_sbm_pml_serdes_op(),
sbl_sbm_get_sbus_op_timeout_ms(), sbl_sbm_get_sbus_int_timeout(),
sbl_sbm_get_sbus_int_poll_interval(), sbl_sbm_get_serdes_op_timeout_ms(),
sbl_sbm_get_sbus_op_flags(), and sbl_sbm_get_serdes_op_flags()) are defined
with bare inline rather than static inline:

drivers/net/ethernet/hpe/sbl/sbl_sbm.h:
inline int sbl_sbm_sbus_op(struct sbl_inst *sbl, int ring, u32 req_data,
			     u8 data_addr, u8 rx_addr, u8 command,
			     u32 *rsp_data, u8 *result_code, u8 *overrun,
			     int timeout, u32 flags)
{
	return sbl_sbus_op(sbl, ring, req_data, data_addr, rx_addr, command,
			   rsp_data, result_code, overrun, timeout, flags);
}

Because the kernel defines inline with __gnu_inline, bare inline functions
without static or extern have external linkage and emit out-of-line global
definitions without prior prototypes when sbl_sbm.h is included here.

Should these helpers in sbl_sbm.h be marked static inline to avoid
-Wmissing-prototypes and -Wmissing-declarations warnings (and multiple
definition errors if sbl_sbm.h is included elsewhere)?

[ ... ]

> +static void
> +sbus_cmd_to_string(u8 command, char *cmd_str)
> +{
> +	char str0[SBL_MAX_STR_LEN], str1[SBL_MAX_STR_LEN], str2[SBL_MAX_STR_LEN=
];
> +
> +	switch (command & SBUS_CMD_MODE_MASK) {
> +	case SBUS_CMD_MODE_CTLR:
> +		sprintf(str0, "CM_CTLR");
> +		break;
> +	case SBUS_CMD_MODE_RCVR:
> +		sprintf(str0, "CM_RCVR");
> +		break;
> +	default:
> +		sprintf(str0, "CM_UNKNOWN");
> +		break;
> +	}

[ ... ]

> +	sprintf(cmd_str, "%s:%s:%s", str0, str1, str2);
> +}

[ ... ]

> +static void sbus_msg(void *inst, u32 sbus_addr, u32 req_data,
> +		     u8 reg_addr, u8 command, u32 rsp_data,
> +		u8 result_code, u8 overrun, int timeout,
> +		u32 flags, int rc, int severity)
> +{
> +	struct sbl_inst *sbl =3D inst;
> +	char sbus_addr_str[SBL_HALF_MAX_STR_LEN];
> +	char reg_addr_str[SBL_HALF_MAX_STR_LEN];
> +	char cmd_str[SBL_HALF_MAX_STR_LEN];
> +	char rc_str[SBL_HALF_MAX_STR_LEN];
> +	char message[SBL_MAX_STR_LEN];
> +
> +	if (!sbl)
> +		return;
> +
> +	sbus_addr_to_string(sbus_addr, sbus_addr_str);
> +	sbus_reg_addr_to_string(sbus_addr, reg_addr, reg_addr_str);
> +	sbus_cmd_to_string(command, cmd_str);

[Severity: Low]
sbus_msg() allocates four SBL_HALF_MAX_STR_LEN (128-byte) arrays and one
SBL_MAX_STR_LEN (256-byte) array on the stack (768 bytes total), and its
single-caller helper sbus_cmd_to_string() allocates another three
SBL_MAX_STR_LEN (256-byte) arrays (768 bytes) just to copy string literals
before formatting them into the 128-byte cmd_str buffer.

When sbus_cmd_to_string() is inlined into sbus_msg(), the combined stack
frame exceeds 1536 bytes (and over 1792 bytes when called via
sbl_sbm_spico_int()), which triggers -Wframe-larger-than=3D warnings when
CONFIG_FRAME_WARN is 1024 or 1280.

Could sbus_cmd_to_string() use const char * pointers for str0, str1, and
str2 instead of stack arrays?

[ ... ]

> +int sbl_sbus_wr(void *inst, u32 sbus_addr, u8 reg_addr,
> +		u32 sbus_data)
> +{
> +	struct sbl_inst *sbl =3D inst;
> +	u32 unused;
> +
> +	return sbl_sbus_op_aux(sbl, sbus_addr, reg_addr, SBUS_IFACE_DST_CORE |
> +			       SBUS_CMD_WRITE, sbus_data, &unused);
> +}

[ ... ]

> +int sbl_sbus_op_aux(void *inst, u32 sbus_addr, u8 reg_addr,
> +		    u8 command, u32 sbus_data, u32 *result)
> +{
> +	struct sbl_inst *sbl =3D inst;
> +	u8 result_code =3D 0, overrun =3D 0;
> +	int err =3D -1;
> +	int retry_cnt =3D 0;
> +	int retry_limit =3D 5;
> +	u32 sbus_ring =3D SBUS_RING(sbus_addr);
> +	u32 rx_addr =3D SBUS_RX_ADDR(sbus_addr);
> +	bool valid_result =3D false;
> +	int sbus_op_timeout_ms =3D sbl_sbm_get_sbus_op_timeout_ms(sbl);
> +	int sbus_op_flags =3D sbl_sbm_get_sbus_op_flags(sbl);
> +	void *accessor =3D sbl;
> +
> +	if (!sbl->is_hw) {
> +		*result =3D 0;
> +		return 0;
> +	}
> +	/* Safety check */
> +	if (!mutex_is_locked(SBUS_RING_MTX(sbl, sbus_ring))) {
> +		sbus_msg(sbl, sbus_addr, sbus_data, reg_addr, command,
> +			 0, result_code, overrun, sbus_op_timeout_ms,
> +			 sbus_op_flags, err, LEVEL_WARN);
> +		WARN(1, "%s: Unlocked SBUS ring %d!", __func__, sbus_ring);
> +	}
> +
> +	/* Perform SBus operation */
> +	while (retry_cnt++ < retry_limit) {
> +		err =3D sbl_sbm_sbus_op(accessor, sbus_ring, sbus_data,
> +				      reg_addr, rx_addr, command, result,
> +					     &result_code, &overrun,
> +					     sbus_op_timeout_ms,
> +					     sbus_op_flags);
> +		if (err) {
> +			sbus_msg(sbl, sbus_addr, sbus_data, reg_addr, command,
> +				 0, result_code, overrun, sbus_op_timeout_ms,
> +				 sbus_op_flags, err, LEVEL_WARN);
> +		}
> +		if (err || overrun) {
> +			SBL_INFO(sbl->dev, "Resetting SBUS ring %d!", sbus_ring);
> +			err =3D sbl_sbm_sbus_op_reset(sbl, sbus_ring);
> +			if (err) {
> +				SBL_WARN(sbl->dev,
> +					 "sbl_sbm_sbus_op_reset failed! sbus_ring:%d rc:%d",
> +					 sbus_ring, err);
> +				return err;
> +			}
> +		} else {
> +			break;
> +		}
> +	}
> +
> +	/* Validate results */
> +	if (err || overrun) {
> +		SBL_WARN(sbl->dev, "roshms_sbus_op failed!");
> +		return -EIO;
> +	}
> +	switch (command & 0x3) {
> +	case SBUS_CMD_RESET:
> +		if (result_code =3D=3D SBUS_RC_RESET)
> +			valid_result =3D true;
> +
> +		break;
> +	case SBUS_CMD_WRITE:
> +		if (result_code =3D=3D SBUS_RC_WRITE_COMPLETE)
> +			valid_result =3D true;
> +
> +		break;
> +	case SBUS_CMD_READ:
> +		if (result_code =3D=3D SBUS_RC_READ_COMPLETE)
> +			valid_result =3D true;
> +
> +		break;
> +	case SBUS_CMD_READ_RESULT:
> +		if (result_code =3D=3D SBUS_RC_READ_ALL_COMPLETE)
> +			valid_result =3D true;
> +
> +		break;
> +	}
> +
> +	if (!valid_result) {
> +		SBL_WARN(sbl->dev, "Unexpected result code (%d) 0x%x!",
> +			 result_code, command);
> +		sbus_msg(sbl, sbus_addr, sbus_data, reg_addr, command,
> +			 *result, result_code, overrun, sbus_op_timeout_ms,
> +				sbus_op_flags, err, LEVEL_WARN);
> +		return -ENOMSG;
> +	}
> +	sbus_msg(sbl, sbus_addr, sbus_data, reg_addr, command,
> +		 *result, result_code, overrun, sbus_op_timeout_ms,
> +			sbus_op_flags, err, LEVEL_DBG);
> +
> +	return 0;
> +}

[Severity: High]
In sbl_sbus_op_aux(), when sbl_sbm_sbus_op() fails (err !=3D 0), the error
recovery path overwrites err with the return value of
sbl_sbm_sbus_op_reset(sbl, sbus_ring).

If sbl_sbm_sbus_op() fails on all 5 retries with overrun =3D=3D 0 while
sbl_sbm_sbus_op_reset() succeeds (returns 0), the loop terminates with
err =3D=3D 0 and overrun =3D=3D 0, bypassing the post-loop if (err || overr=
un)
check.

Because result_code was initialized to 0 (which equals SBUS_RC_RESET), a
failed SBUS_CMD_RESET operation (such as in sbl_sbm_firm_upload() and
sbl_serdes_soft_reset()) will set valid_result =3D true and return 0
(success), while failed read or write operations will return -ENOMSG
instead of -EIO.

In addition, sbl_sbus_wr() (as well as sbl_sbm_firm_upload() and
sbl_serdes_soft_reset()) passes an uninitialized stack variable (u32 unused)
as result to sbl_sbus_op_aux(), which unconditionally dereferences *result
when calling sbus_msg() even if sbl_sbm_sbus_op() did not write to *result.

Should sbl_sbm_sbus_op_reset() use a separate return variable so err from
sbl_sbm_sbus_op() is preserved, and should *result (or unused in callers)
be initialized to 0 before the operation?

> +
> +/**
> + * sbl_sbm_spico_int() - spico intilization
> + * @inst: Generic pointer used by various framework
> + * @sbus_addr: address describing a serdes ring and rxaddr
> + * @code: interrupt command
> + * @data: interrupt data
> + * @result: location to store result of interrupt
> + *
> + * Write an interrupt request to a target SBM Spico
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +int sbl_sbm_spico_int(void *inst, u32 sbus_addr, int code, int data,
> +		      u32 *result)
> +{
> +	struct sbl_inst *sbl =3D inst;
> +	int err;
> +	u32 intr_out;
> +	u32 intr_in;
> +	char intr_str[SBL_MAX_STR_LEN];
> +	int sbus_int_timeout =3D sbl_sbm_get_sbus_int_timeout(sbl);
> +	int sbus_int_poll_interval =3D sbl_sbm_get_sbus_int_poll_interval(sbl);
> +	unsigned long last_jiffy;
> +	u32 sbus_ring =3D SBUS_RING(sbus_addr);
> +
> +	if (!sbl->is_hw) {
> +		*result =3D 0;
> +		return 0;
> +	}
> +	/* Safety check */
> +	if (!mutex_is_locked(SBUS_RING_MTX(sbl, sbus_ring))) {
> +		SBL_WARN(sbl->dev, "%s: Unlocked SBUS ring %d!", __func__, sbus_ring);
> +		WARN(1, "sbl_sbus_op_aux: Unlocked SBUS ring %d!", sbus_ring);
> +	}
> +
> +	spico_interrupt_to_string(sbus_addr, code, intr_str);
> +
> +	/* Inject the interrupt via SBus writes */
> +	intr_in =3D ((data & SBMS_INTERRUPT_DATA_MASK) << SBMS_INTERRUPT_DATA_O=
FFSET) |
> +		((code & SBMS_INTERRUPT_CODE_MASK) << SBMS_INTERRUPT_CODE_OFFSET);

[Severity: High]
In include/uapi/ethernet/sbl_sbm_constants.h, SBMS_INTERRUPT_DATA_MASK is
defined as the already-shifted upper 16-bit mask:

#define SBMS_INTERRUPT_DATA_MASK         0xffff0000
#define SBMS_INTERRUPT_DATA_OFFSET       16

which matches how sbl_sbm_spico_int() extracts the result further down:

	*result =3D (intr_out & SBMS_INTERRUPT_DATA_MASK) >>
		SBMS_INTERRUPT_DATA_OFFSET;

When packing intr_in above, masking the 32-bit data with 0xffff0000 before
shifting left by 16 clears bits 15:0 and then shifts bits 31:16 out of the
32-bit word, so the data portion always evaluates to 0.

Should this shift data before masking with SBMS_INTERRUPT_DATA_MASK:

	intr_in =3D ((data << SBMS_INTERRUPT_DATA_OFFSET) & SBMS_INTERRUPT_DATA_MA=
SK) |
		((code << SBMS_INTERRUPT_CODE_OFFSET) & SBMS_INTERRUPT_CODE_MASK);

so that the interrupt data payload is not zeroed out?

[ ... ]

> +int sbl_serdes_spico_int(void *inst, u32 port_num, u32 serdes,
> +			 int code, int data, u16 *result, u8 result_action)
> +{
> +	struct sbl_inst *sbl =3D inst;
> +	int err;
> +	char intr_str[SBL_MAX_STR_LEN];
> +	u16 result_out =3D 0;
> +	u16 *p_result;
> +	u32 sbus_addr;
> +	int serdes_op_timeout_ms =3D sbl_sbm_get_serdes_op_timeout_ms(sbl);
> +	int serdes_op_flags =3D sbl_sbm_get_serdes_op_flags(sbl);
> +	void *accessor =3D sbl;
> +
> +	if ((result_action =3D=3D SPICO_INT_RETURN_RESULT) && (result =3D=3D NU=
LL)) {
> +		SBL_ERR(sbl->dev, "result pointer was NULL!");
> +		return -1;
> +	}
> +	if (result_action !=3D SPICO_INT_RETURN_RESULT)
> +		p_result =3D &result_out;
> +	else
> +		p_result =3D result;
> +
> +	if (!sbl->is_hw) {
> +		*p_result =3D code;
> +		return 0;
> +	}
> +	/* Make a fake SerDes sbus_addr so spico_interrupt_to_string gives us t=
he
> +	   right debug string. This function is only called for CM4 SerDes, so =
this
> +	   will always give the correct string. */
> +	sbl_sbus_addr_get(&sbus_addr);
> +	spico_interrupt_to_string(sbus_addr, code, intr_str);
> +
> +	err =3D sbl_sbm_pml_serdes_op(accessor, port_num, serdes, code,
> +				    data, p_result, serdes_op_timeout_ms,
> +					   serdes_op_flags);

[Severity: High]
Can calling sbl_sbm_pml_serdes_op() here cause an ABBA deadlock between
sbl->link[port_num].serdes_mtx and SBUS_RING_MTX(sbl, sbus_ring)?

In drivers/net/ethernet/hpe/sbl/sbl_serdes_fn.c, sbl_serdes_soft_reset()
and sbl_serdes_firm_upload() acquire serdes_mtx before sbus_ring_mtx:

sbl_serdes_soft_reset()
  mutex_lock(&sbl->link[port_num].serdes_mtx);
  mutex_lock(SBUS_RING_MTX(sbl, sbus_ring));

However, sbl_spico_reset() (called from sbl_serdes_stop_internal() and
sbl_test_serdes_stop()) acquires SBUS_RING_MTX(sbl, sbus_ring) first and
then calls sbl_serdes_spico_int() -> sbl_sbm_pml_serdes_op() ->
sbl_pml_serdes_op(), which locks &link->serdes_mtx:

sbl_spico_reset()
  mutex_lock(SBUS_RING_MTX(sbl, sbus_ring));
  sbl_serdes_spico_int()
    sbl_sbm_pml_serdes_op()
      sbl_pml_serdes_op()
        mutex_lock_interruptible(&link->serdes_mtx);

This inverts the lock order to sbus_ring_mtx -> serdes_mtx. Should
sbl_spico_reset() and its callers follow the serdes_mtx -> sbus_ring_mtx
lock hierarchy (or release sbus_ring_mtx before invoking
sbl_serdes_spico_int())?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-cxi-netdev=
-submission-v1-0-8c2c391cc283@hpe.com?part=3D7
