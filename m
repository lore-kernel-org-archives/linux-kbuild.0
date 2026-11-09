Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794211789;
	b=kTiy3ZHvu8j92ZPirpSWRwoWWb6XT78fnBvtkDk3NPPQjyzKEj7jAsiIh94rpVwhxWqi
	 nQ2AH8zI1lyYk4/Y7cPh7vAKvbHpHYHXlEd4GtAPbxkmF+51yZZAKA/3Yqc6a0C3blQCK
	 EZLT/U2Xpqvv3HVkDaPvQLMUfWPGgoGWz/SmnTkMQhBj0S7mCdDyzIwKkhYCL5b3t50HC
	 wLxupXCuPrsnR8rnd2p0JpeVvTKYQJhA4mQsvrT3y8Q+9BYGJYYCiBA46Nf6Ohly8XW08
	 730Gx8DON/f+rwBaTQGQiyyL0YTrhpR1iYxhndKDDIS6YazcXgpPJ22uR39VzK1YSYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794211789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=N2keICUbCE9LxNGMu98kwwmZ1JbmLwrSlbYRImcv3Tw=;
	b=Sd9eu+kZwY6ZBf65MW/IwKKK0Qx2jFESnHtCjaGFfLLVTrRzU/OuQ0H7ZkwJ4iJSredV
	 qH5uIRhKEEq8At5DhSbrDA0LqYwOCuSV9Ds0xQAV32PkbsqeSz6ifQKnpLoUkisTx8wNo
	 kTYuEGrTvaHdTpwiC1N/cIBVDO/UmbwR7eos+HH3HoOkrhmh5ILOKSoihyCQ+Y4zNEmhM
	 FgPjrU1qK/CB67RDAKQKtQI+nZe58JzvuxJjGqr/doyIOkxbXdGl1JYooBcbMkmp2cfaJ
	 QB21nidm6A6zRX3p1GTankfrIeU0+fSCXhC5P3reNaw6AfNL9svn2uvOTC2o3SsUEqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=syyn0Bb3;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93087606A323
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Nov 2026 08:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93087606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=syyn0Bb3
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-37071c0f42aso1186392eec.0
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Nov 2026 00:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794211789; x=1794816589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N2keICUbCE9LxNGMu98kwwmZ1JbmLwrSlbYRImcv3Tw=;
        b=syyn0Bb3WujsQqKe3RBqM1Su4zL2bjghtLPkK16Z+lJGmfLOWaOQXvXu2pwJcxK1Gg
         N9qBnEHjCWpW528StzFRqsGBW4pQ9Hd2FBQXwQai4NkJQHHfkgBQdVNBrtZ2KeLHwbI3
         CMp4Qpuqw65Wmbds1tMj3Rj5LcuZxHbnpQiTdTJguZscXXawYWUQdBqKeLihlg6XHA+q
         3O58ICrykanbfd5dRZB4Pk2++Nr9Y93LKjVwWVrTFsi1XiUVAb+a/au/w4ro4BeJaeKo
         d6pHXRFJHuR4gPhxfUyliWM5pXV2mLvwE08faqJ/AnX+L0DBM4zaBosn+YZuPaJx521N
         ispQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794211789; x=1794816589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2keICUbCE9LxNGMu98kwwmZ1JbmLwrSlbYRImcv3Tw=;
        b=E8DoSSj992zaflsIepCPnjBzaalLti0HUO1zA9jqhlbllpcSlVc6z/5mEqfK68TdFF
         nZmJLnI2y61GUwuZ8wYHARDbeiSOR0W7Mg3mEyAVGtjCbQiKmtYYFZ9eEDi/GAO0oHTB
         RCsFx+PF8xoeLlyQ2GKeaTqlfOJOUM5pyuQnnSMJO3Rv6MCoH02P3yR4UKrxYZjS61vS
         3fz6/53Er7GEBOxEfnxd6wpOHQ0R9Y6K1IF9/7wksgFxjP9+mm0v4EYM4xAIqRRK2n/b
         0qFiHFQNNXDVFbXtPbSUVkEJj99nFA67SRQqqyJnrYo67yuUDIN1ytOdTOg5iI27GhJH
         yVuQ==
X-Forwarded-Encrypted: i=1; AL+hErGg5Wsg+/wyL9gCIiXbzEfJZOKZ2Ix43v8eAxdojQuq9JGNWM0ncrU9VhZJYGvlws3/B3wKhGoOaJ7bWtU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+qQvPlqovaB3PG7XUTMhSB2F7kOprWB/y1i7c3qRGXLceG4gg
	r5pPqdEeI5TzKQ96U3iiA5Tzg0cS2m2I6pyPKtzUESuyskXyKYGKGZU7
X-Gm-Gg: AYBFou0e8R2zEYRPTxy3cMYhXwEo9yRc3CHVoICbiNUAi0pI08kH+SXIvrKyGYQGCG5
	Ui718lkRXWp7Y6/88JaL3or/sbfDKyDSicWOJkyjQxf39+0m0O9L/C6A5O5T2WgghSrWCRFU3q2
	J43iP1FSb8DbL09PGJY6FMSDnZr8VMOJ/oo4RHgHVOly+PJehDKUgCa07vJxrZxR5X1+5UjvVi8
	sYHGdoNl6XnahVIj2/2r85wDQe0/iuTQv1/4g/jKbxMQ3tTDA049RjKRwmMNf6aKvzCGSLkEdpP
	T9gaq7MlyPg7eAiXerxe2B+0uxopc5qpOymTwUsTq9E3/hVJkczpO8TcaFTCsk6dNyrUvl+h7jO
	cwFqyafSct6qg99fjxJ9iyPzPShIYjhKexSMOjPvctCiJfbgubuAZmq8qs1N2LSAjLNrjoZ/ufU
	Pc18AjIL87TgZ7Dil3g9q3owp2yjg/o0rUrEf06557jqN5mtWxVrDR7Ak8x6Xb+4RhjH+LhUGex
	1YHA227N5rOuXOMzpR1mfiSTjLMi22KiYbbrkjBuXzOXK4O5c9PZw9mhaPx0IzS7iRTW+REN2wY
	CQ2bXj1Qot2QIRn16c2Ot0oawTPuon7QI/BBRTnT6uoA15rj8W38LD1/cxB3nFMAYWbLRUcu22L
	0fQYs/CYyRKJh/R6rDqv/CAMzopYwUaxqFZtBoA==
X-Received: by 2002:a05:7301:e0a:b0:373:d25b:8cf0 with SMTP id 5a478bee46e88-373d25b9033mr3417937eec.29.1794211788472;
        Mon, 09 Nov 2026 00:09:48 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372669d2826sm12000389eec.29.2026.11.09.00.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:09:47 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Daniel Mack <daniel@zonque.org>,
	Russell King <linux@armlinux.org.uk>,
	Sasha Levin <sashal@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Input: apm-power - remove driver
Date: Mon,  9 Nov 2026 00:09:44 -0800
Message-ID: <20261109080944.3802916-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The apm-power input handler solely listens for EV_PWR KEY_SUSPEND
events to queue APM_USER_SUSPEND via legacy APM emulation. The only
in-tree platforms generating those events are legacy Sharp Zaurus ARM
machines (spitz/borzoi/akita and collie), none of which were converted
to Device Tree. Both mach-pxa board files and mach-sa1100 were marked
deprecated in v7.3 by commit cc7852314abd ("ARM: PXA: mark remaining
board files as deprecated") and commit 7d92e50ceacd ("ARM: mark
mach-sa1100 as deprecated"), and are queued for removal in v7.5. None
of the remaining ARM platforms or other APM_EMULATION targets
(MIPS_ALCHEMY, PMAC_APM_EMU, and SH_HP6XX) emit EV_PWR input events or
enable CONFIG_INPUT_APMPOWER, and arch/arm/configs/pxa_defconfig
already dropped CONFIG_PXA_SHARPSL at the same time, leaving its
CONFIG_INPUT_APMPOWER=m entry inert.

Normalizing dashes and underscores in scripts/modules-check.sh for v7.5
exposes a module name collision (apm_power) between
drivers/input/apm-power.ko and drivers/power/supply/apm_power.ko.
Remove this obsolete input bridge to resolve the collision rather than
renaming a module whose last target platforms are going away in the
same cycle.

Reported-by: Sasha Levin <sashal@kernel.org>
Closes: https://lore.kernel.org/r/20261108225808.1809266-1-sashal@kernel.org
Link: https://lore.kernel.org/r/20261109-apm-power-input-rename-v1-1-0609e7b91825@kernel.org
Link: https://lore.kernel.org/r/e4da2f9d-d3b9-4267-9b64-b0f2cb43402a@app.fastmail.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/configs/pxa_defconfig |   1 -
 drivers/input/Kconfig          |  12 ----
 drivers/input/Makefile         |   2 -
 drivers/input/apm-power.c      | 122 ---------------------------------
 4 files changed, 137 deletions(-)
 delete mode 100644 drivers/input/apm-power.c

diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index e7a7ed2b7ef7..e70d2789d1f6 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -224,7 +224,6 @@ CONFIG_INPUT_MOUSEDEV_SCREEN_X=640
 CONFIG_INPUT_MOUSEDEV_SCREEN_Y=480
 CONFIG_INPUT_JOYDEV=m
 CONFIG_INPUT_EVDEV=m
-CONFIG_INPUT_APMPOWER=m
 CONFIG_KEYBOARD_ATKBD=m
 CONFIG_KEYBOARD_QT1070=m
 CONFIG_KEYBOARD_GPIO=m
diff --git a/drivers/input/Kconfig b/drivers/input/Kconfig
index 88ecdf5218ee..064beedf5558 100644
--- a/drivers/input/Kconfig
+++ b/drivers/input/Kconfig
@@ -162,18 +162,6 @@ config INPUT_KUNIT_TEST
 
 	  If in doubt, say "N".
 
-config INPUT_APMPOWER
-	tristate "Input Power Event -> APM Bridge" if EXPERT
-	depends on INPUT && APM_EMULATION
-	help
-	  Say Y here if you want suspend key events to trigger a user
-	  requested suspend through APM. This is useful on embedded
-	  systems where such behaviour is desired without userspace
-	  interaction. If unsure, say N.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called apm-power.
-
 comment "Input Device Drivers"
 
 source "drivers/input/keyboard/Kconfig"
diff --git a/drivers/input/Makefile b/drivers/input/Makefile
index 2cd6e1c9a778..7d2af8dfd17e 100644
--- a/drivers/input/Makefile
+++ b/drivers/input/Makefile
@@ -27,6 +27,4 @@ obj-$(CONFIG_INPUT_TOUCHSCREEN)	+= touchscreen/
 obj-$(CONFIG_INPUT_MISC)	+= misc/
 obj-$(CONFIG_INPUT_KUNIT_TEST)	+= tests/
 
-obj-$(CONFIG_INPUT_APMPOWER)	+= apm-power.o
-
 obj-$(CONFIG_RMI4_CORE)		+= rmi4/
diff --git a/drivers/input/apm-power.c b/drivers/input/apm-power.c
deleted file mode 100644
index 028fcaf4c142..000000000000
--- a/drivers/input/apm-power.c
+++ /dev/null
@@ -1,122 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  Input Power Event -> APM Bridge
- *
- *  Copyright (c) 2007 Richard Purdie
- */
-
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
-#include <linux/module.h>
-#include <linux/input.h>
-#include <linux/slab.h>
-#include <linux/init.h>
-#include <linux/tty.h>
-#include <linux/delay.h>
-#include <linux/pm.h>
-#include <linux/apm-emulation.h>
-
-static void system_power_event(unsigned int keycode)
-{
-	switch (keycode) {
-	case KEY_SUSPEND:
-		apm_queue_event(APM_USER_SUSPEND);
-		pr_info("Requesting system suspend...\n");
-		break;
-	default:
-		break;
-	}
-}
-
-static void apmpower_event(struct input_handle *handle, unsigned int type,
-			   unsigned int code, int value)
-{
-	/* only react on key down events */
-	if (value != 1)
-		return;
-
-	switch (type) {
-	case EV_PWR:
-		system_power_event(code);
-		break;
-
-	default:
-		break;
-	}
-}
-
-static int apmpower_connect(struct input_handler *handler,
-					  struct input_dev *dev,
-					  const struct input_device_id *id)
-{
-	struct input_handle *handle;
-	int error;
-
-	handle = kzalloc_obj(struct input_handle);
-	if (!handle)
-		return -ENOMEM;
-
-	handle->dev = dev;
-	handle->handler = handler;
-	handle->name = "apm-power";
-
-	error = input_register_handle(handle);
-	if (error) {
-		pr_err("Failed to register input power handler, error %d\n",
-		       error);
-		kfree(handle);
-		return error;
-	}
-
-	error = input_open_device(handle);
-	if (error) {
-		pr_err("Failed to open input power device, error %d\n", error);
-		input_unregister_handle(handle);
-		kfree(handle);
-		return error;
-	}
-
-	return 0;
-}
-
-static void apmpower_disconnect(struct input_handle *handle)
-{
-	input_close_device(handle);
-	input_unregister_handle(handle);
-	kfree(handle);
-}
-
-static const struct input_device_id apmpower_ids[] = {
-	{
-		.flags = INPUT_DEVICE_ID_MATCH_EVBIT,
-		.evbit = { BIT_MASK(EV_PWR) },
-	},
-	{ },
-};
-
-MODULE_DEVICE_TABLE(input, apmpower_ids);
-
-static struct input_handler apmpower_handler = {
-	.event =	apmpower_event,
-	.connect =	apmpower_connect,
-	.disconnect =	apmpower_disconnect,
-	.name =		"apm-power",
-	.id_table =	apmpower_ids,
-};
-
-static int __init apmpower_init(void)
-{
-	return input_register_handler(&apmpower_handler);
-}
-
-static void __exit apmpower_exit(void)
-{
-	input_unregister_handler(&apmpower_handler);
-}
-
-module_init(apmpower_init);
-module_exit(apmpower_exit);
-
-MODULE_AUTHOR("Richard Purdie <rpurdie@rpsys.net>");
-MODULE_DESCRIPTION("Input Power Event -> APM Bridge");
-MODULE_LICENSE("GPL");
-- 
2.56.0.506.g506a7eabc5-goog

