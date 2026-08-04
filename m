Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053BD36194B;
	Tue,  4 Aug 2026 12:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785847552; cv=none; b=DiDNC3f0Czi+HW6kkiSdklyFc+35PpzjjnG360Oy2OgadLiCpWHawFoviR4eFXqXDz00AtoxW88k+R4BFM4ZKMoA77Fb3udxwUv4hGt2TC75GGe1qQibmTRdExPYq5wapPA6WpI187yUnnAuu7HzyVkRGjY0VSVwAAMtKnUP0x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785847552; c=relaxed/simple;
	bh=0dmebcuEyVuQ4JtEfj2pXsBJawVvFBQAFFrpkvtmlRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XjioerPTHBHkqPfaqXPSuISuVJ1CLxHO6WV8iUsekVcsxjP0DA7riie+Mb/rRH1U2tGT6kzBFhQAJFrt58U/1HFn0YzmnQCdszd4uk+LFiocIkIlK+dILRqFMvNbAujSGTLB6Tf+GKv12dqA06H0g42CcB2bqdzrgVs11H3q+jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flto9Vzp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="flto9Vzp"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 1F4AA1F000E9;
	Tue,  4 Aug 2026 12:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785847550;
	bh=cNyCi7lRc19Uf0QlAzBQj+4Sbh7Agb3Ei/VpQH9fyds=;
	h=From:Date:Subject:To:Cc;
	b=flto9Vzp1VxtMGKIsXCjKNWUfg1H6ChKEMHvIch8jCuqEfEuDK7osxzjSUFQ8s8bl
	 ChXH7bYDMb4FOVboF7b7TtBv6yU2NC/AY/7+NwZER7T65ZFoelfaMBtZwAHYjSgir/
	 dhE9PRInYVdrqmejXcidmS33E5SBVIOzclDQF5IJUhLSeYVqaGTEbalrkjc52MqPiG
	 N98CLQoOoF5GGJKNUpEdyZ4ineXkdWCDP5jb9aJoJVEO4vlUp77iMUZHc2rBKf+Ro6
	 mI9LeLPINKLPbmFvIsXp8z+AzdgFpNXWp60cMU3py1mA/k5I5HWe3afxBxnT2hGSaO
	 9qbeDxmOKZOtA==
From: Nicolas Schier <nsc@kernel.org>
Date: Tue, 04 Aug 2026 14:45:32 +0200
Subject: [PATCH] kconfig: Warn on dead select or imply for choice values
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-kconfig-warn-on-dead-select-for-choice-value-v1-1-e5c9a274d291@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOvecWoC/52Ry07DMBBFfyXymolmbDd2IoT4D9SF40xbt3mAn
 QSkqv+O27KERVle6Z47R5qzSBwDJ9EUZxF5DSlMYw70VAh/cOOeIXQ5C4myQosSTn4ad2EPny6
 OMI3Qsesgcc9+ht0UwR+m4BlW1y8MbWfIUcfk6krkyffIu/B1O/e2vee0tMfMXm/8NCJ/LNljv
 tdE6xKDn4YhzE2xmlJC9PpaHTgldxNsiuebn5G1RGX1plTWSFUDwXHpgxvb6A7udT+40Jd56uV
 33CJRhaSxzCwh4oO8IU0kUWdHhdpuqkd5qQh1rVRJZDSpf+BSWrKlVub6qj/x7eXyDY2wzHH5A
 QAA
X-Change-ID: 20260802-kconfig-warn-on-dead-select-for-choice-value-bd71a1de1a96
To: Nathan Chancellor <nathan@kernel.org>, 
 Julian Braha <julianbraha@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kees Cook <kees@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Nicolas Schier <nsc@kernel.org>
X-Mailer: b4 0.16-dev-5acee
X-Developer-Signature: v=1; a=openpgp-sha256; l=2698; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=0dmebcuEyVuQ4JtEfj2pXsBJawVvFBQAFFrpkvtmlRU=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqcd7yRFWGdApG/BPgZT2EJESNsqpnlQeX3DxGk
 SdC9hRDB4GJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCanHe8gAKCRAHUgpwFiYS
 afWyEACDyP/LBr+GX6HAssy4Iht3xJcU53LrzSsyw7Cah2ABiYB2CtyXLzxwG9cZE5AKinp77r8
 LHwVU7VJT1sIamlXBQBv8y731AYvVITif0EmY/VE/xdU0AtDc0KICNcO/IJnJ8at6vlohAQFWll
 qPCoRHOeu8JHe3kT+MVA8gK7VdVZhNsohsnnAH5dKqWUHH7e9E8L4HOOkGfOv/ZerRGJztAhFRA
 lOY0ORvfV++T2SbFqhfDF0LwhRpZmmVA18n0Xf1jxwsGLR5jrl8ORavi97b32Zi0UeV6IHfnJjH
 u4lFqRwLG7T61raaIiMzQJViUf9vfb60d7t71hK8aCCYXUJcWIfYcmRa/wKz6W0sAWjSeDKiYaB
 eewvtsc0A12vpvu2sB39q/gXvRq3k3cCCex4acRGa3hGtpyUhd9D5D8lzj/i3mCvtZmtZ2rILOm
 U/hfuKY9/0EbUpPmOav+WAH0Wu9b98uXDXMssua+FhHyPFpVIukt+HbXhYtVXyKHaZCX9MLre6N
 CpzLGygOpe6LHzq2ux+rgl3AgPe7NEHQVjD/kMl3C9QgAooVH2fC34saxBO4HdxV569FepbcwNA
 zuKq4AuiZCXAs5oeaRRHdFPdtCR7I4i54RsdEHm+SIoT60ssG9ZeoGsjxPYGL8X9XNTDFB0m1wY
 TmJewKiAaAg5xAg==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

Update the internal kconfig check to print a warning on 'select' and
'imply' statements that target on choice values.

Julian Braha reported that kconfig's 'select' and 'imply' do not work
for choice values but have no effect all.  Show a warning instead of
error-out to allow kconfig to check the whole kconfig rule set.

Reported-by: Julian Braha <julianbraha@gmail.com>
Closes: https://lore.kernel.org/linux-kbuild/20260715220149.48700-1-julianbraha@gmail.com/ # [1]
Suggested-by: Kees Cook <kees@kernel.org>
Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Nicolas Schier <nsc@kernel.org>
---
Depends on related fixes in Kconfig files:
https://lore.kernel.org/r/20260729203845.387239-1-julianbraha@gmail.com # change-requested
https://lore.kernel.org/r/20260801160140.2391000-1-julianbraha@gmail.com # under-review
https://lore.kernel.org/r/20260714112047.2304856-1-julianbraha@gmail.com # under-review
https://lore.kernel.org/r/20260723104933.117413-1-julianbraha@gmail.com # applied to mips-next
https://lore.kernel.org/r/20260723122818.437802-1-julianbraha@gmail.com # applied
---
 scripts/kconfig/menu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index b2d8d4e11e07..fc8d8cfe034d 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -287,6 +287,10 @@ static void sym_check_prop(struct symbol *sym)
 				    "'%s' has wrong type. '%s' only "
 				    "accept arguments of bool and "
 				    "tristate type", sym2->name, use);
+			if (sym_is_choice_value(sym2))
+				prop_warn(prop,
+					  "config symbol '%s' uses %s for '%s', but '%s' is a choice value",
+					  sym->name, use, sym2->name, sym2->name);
 			break;
 		case P_RANGE:
 			if (sym->type != S_INT && sym->type != S_HEX)

---
base-commit: 6946cd5d0aa4dd10a414ddcb7a10844fdb0ad345
change-id: 20260802-kconfig-warn-on-dead-select-for-choice-value-bd71a1de1a96
prerequisite-message-id: <20260729203845.387239-1-julianbraha@gmail.com>
prerequisite-patch-id: 3bb796da65f588d1df5003dac5af7a9d7420f266
prerequisite-message-id: <20260801160140.2391000-1-julianbraha@gmail.com>
prerequisite-patch-id: 5277c28b2d25752fb7e5827ed744b0cf0c619574
prerequisite-message-id: <20260714112047.2304856-1-julianbraha@gmail.com>
prerequisite-patch-id: bef2d24caba30e7dc2ac5189c10b6473485a1e3c
prerequisite-message-id: <20260723104933.117413-1-julianbraha@gmail.com>
prerequisite-patch-id: da49e2868fbb19afc3195cbd2868739a94aa02c3
prerequisite-message-id: <20260723122818.437802-1-julianbraha@gmail.com>
prerequisite-patch-id: 3c894964a57e4e30515fcb14226dae725555c25e

Best regards,
--  
Nicolas

