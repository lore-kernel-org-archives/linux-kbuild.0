Received: from outbound.ms.icloud.com (ms-2003l-snip4-11.eps.apple.com [57.103.72.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81423546D3
	for <linux-kbuild@vger.kernel.org>; Thu, 20 Aug 2026 19:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.72.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787252533; cv=none; b=H5LJ2TgQu4ojs234qIOUfZqylxgKA3or/IIA+FHvcKNIhnRU42S2+/eKc0yDnw7s9PX/zARRn7E+GTHRT1udi3uGsSR62JQZ8r0cc7BKga9hU33kdirtU0tZMiBH4EPKaYKm+O4wCpldsxWumfZ2gnmZ5Xm16PpnaS/79dUKj1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787252533; c=relaxed/simple;
	bh=9JupTvUrkiOT7jYCykFgKBfvRDob9c0at47S+DlZ+cI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=psNJjPLZZ+dA+nUUHmpcpqzMduwB3Fed9i/7ZKI3CiFMdnW7S3ybi9aIx69iyVDqq8p+7qqBPUW/9ARX7wqod+suJ71wUaoolBmvXBA4F66Oh//shyXqc3ezsgTVBC0UQ4eDJJTpQ8sPwXjuRn+TRCLLhiVpFt6gIYdn9qESgcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=kS2nUebB; arc=none smtp.client-ip=57.103.72.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="kS2nUebB"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-5 (Postfix) with ESMTPS id 4577518002BE;
	Thu, 20 Aug 2026 19:02:09 +0000 (UTC)
X-ICL-RepId: 01a0208d-586c-7e6a-9c15-f7da8366d07b
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQhABkMAWBxBDkkdXwZfEhVdRVUIRRlTHhccRgxFGVswVB0dDlgGEhZdRV4IGQhdHRkKUFACS1oVVRcOAkIfUB9MFldDWhgcGVoUXBhTRVEfVFhDGUVWaUELTx1dGVscQmRYVwkKBldeWhdeTVoCVk0FSgNfAVsKQglJCl0FWwJeC0gAXA9eH0EUHlYfRQpcXl0NUh9FAnIdXFZQAlpVEgRACFZQXgheH0wc
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai; t=1787252530; x=1789844530; bh=ii954tAi/JBMkVeTx5G4C2RpbnoP8FmKLuKtu60/oTs=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=kS2nUebBgebdGrZd5T8UqPr7GJ7FQd20tYqCqc7QpgUxJgLVu/CcFPzFlb5Yzx0GyU3FjVJeruEeSY1TI3azBJXYnNInPntfE8xl9jrSnUrGtZtSLEnOygAcdte9BjKjA9U1Px8UrZALbHjwN0jlGhCbG7T/t3jwiipfOtbr8hlOLeHAqFyi2R++HMo+yKDfy6Qa4165tnfGvEe6wtBCaXc2rMYAriw6MERNkMMEhYOIsdrpx5Dp60Qur8T7g1NO3vzWQkhSELr/78YUIQKf+l6tX+ykamxCAay6NIwr0D/srpZFyLssxQNqNR5GZfsDBzaI8MeqD+8YHu/BFQFgGg==
Received: from ncore (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-100-percent-5 (Postfix) with ESMTPSA id C93B318000FC;
	Thu, 20 Aug 2026 19:02:07 +0000 (UTC)
From: Ferran Duarri <ferran.duarri@me.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ferran Duarri <ferran.duarri@me.com>
Subject: [PATCH] kbuild: ubsan: skip UBSAN for external modules by default
Date: Thu, 20 Aug 2026 21:01:58 +0200
Message-ID: <20260820190200.203185-1-ferran.duarri@me.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=Sbn6t/Ru c=1 sm=1 tr=0 ts=6a874f31
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10
 a=B9nqV3Rn1-QA:10 a=VkNPw1HP01LnGYTKEx00:22 a=HHGDD-5mAAAA:8
 a=pWqLgb-FWpTYisbz52gA:9
X-Proofpoint-ORIG-GUID: q3ghTP_jjBCVviMoSkGqeASGQLrYbWEp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE0MyBTYWx0ZWRfX8o3mv1V/tzNU
 UgZcME6cQ8slL7X/+QaeqK5PUR+uWEBoS2fgW5MI+9K/oOUabM/K1TP0/sVgk2ormlXJldMNV5Z
 YNb27fFguCOoWVHO7w94elR2D2nrqzcVObW8/IKTA4vnmtQMdZgp2Gjz8P+LqpYjz8QRf9jhgDm
 CQIRHXuSrcgXoXeMdiyfIuuu7cxMC5p9JpgVI5GATiSJrLAgf+RwKfcALbYOEqWDPdNjVWwScOM
 GsguS9JOjWkvSdX4oiYneNehx6+c5unE0WW2GLtNSnj2+Mis3Bpt2ao4yxE+8EO6XIbQnIjgxB+
 3Q/LF4jU0lru9QrddiO3JXMsQocPEaoZnJiL4fVLd+1gqbeWZ3JT8wPJMNQcp8=
X-Proofpoint-GUID: q3ghTP_jjBCVviMoSkGqeASGQLrYbWEp
X-JNJ: AAAAAAAB6mCShIWhAIjn5hyXQnB3y/S4WqiH8SKuzKSRz0dyYgtcrsU24pBiBfgwj32INsgBS1Ma91shW2PDxBZsarcbUwckcr2bULH42+TMrBLXnOW3gbis2S7WbS994JHTXIwvlqB6H2JHx1zBfc4ouYAkoEhVXpjStXzq+BG8ZJBoXEaV4VlfUZ0EAT2JkjB1X0Gmzos/oiegrWS5Ch6/KzOCvmoDX6i41tDhU9KFCQ7j4tzTVnC05bOSaPo3tWoS7g3+eFUv29XH3SYGUkER7WlPV1hoT5qo/+qU+gMWdxbWy8/csDtd1g1hqV4Q1qxMFi1sovgOACV4OglhEBxZBPAWYOeIKol4gxacP2XLHB7dB3QAqdi6Xl5enbRvj3KTyP3ga1dHuASdFlFwvZARe2idEgSjF5iPQIt2KmlN0K3O5bdo7O6vdCHiec64v+5wCRiPkltcyGkfUaWYs6qJJznGnPdvjHObS+S+zF2aGZ3pyibhezGvf5taYSMlpdSTGI18LDtbyOMiBu/ccQttAOYVHDner3ZdjrFPvRRi6Zic34O+sGJV24tWR+BNqomk2OElPmv7/NardzKNGXX73FKdYr+ELLgds2MWzoe9QGSsczhtC3loQQZdQdz6JHR6U8pAl5S9F5zvRRDeh1td33kCjp8r947XjNCc6fBLzq1Vr+tJSNScc9LEORU66/boEGySJ7zsgzW0ocCYSAPMpR/y+LbfNyGzeiSPPg7cP5z5+dpQeBI6qLjkzkv7z5yz+Zau6pOfNqGSSEt1zz1PjwgBQ23uNPupuF5PI3yRyldO2oaTOnQVZxo+FgGW+qMfnmjRQdjuJjewITHe33keVL7hSBPoPuIz7sIrtdDVFUBNSS2XjU8ze4ZOhcdEbthIQWzysDzMzoVfmR0PPf/GGW71Xb5PBTw0ONi/Gk5aPIaBJjsdKKLZBzQtifgNXRTENh3+y1NDFeqYcz9t4hErva8ee8G
 jSxTaP4QIZMZpfq3B8F18YDkgfPe+gxYXW+ZulRJiIuSw0v8w+XmcR35AkhI7L4lWCbjSQuN19WwJk6RwS9daJ4WP5Y3+MItDMkYsJAPtg95zUcb3ynG7iArCEq15F6KRpqQpHz+VcwrM7FqRWVtszWFf2BLoBM1C91zGwCTv8H0d08+2DL1vybXT6UlDPAcczRfZCmtfBg==

External modules built with KBUILD_EXTMOD set inherit UBSAN sanitizer
flags from the kernel's KBUILD_CFLAGS because is-kernel-object is 'y'
for any obj-m object. This silently breaks third-party modules whose
source code (e.g. VMware vmnet/vmmon) triggers UBSAN UB checks at
runtime, causing packet-forwarding failures and VM instability while
the module itself loads successfully.

Make UBSAN opt-in for external modules: skip the is-kernel-object 'y'
fallback when KBUILD_EXTMOD is set. External modules that explicitly
need UBSAN can still opt in by setting UBSAN_SANITIZE := y.

In-kernel module builds are not affected.
Signed-off-by: Ferran Duarri <ferran.duarri@me.com>
---
 scripts/Makefile.lib | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 0718e39cedda..393af3f970af 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -74,10 +74,10 @@ endif
 
 ifeq ($(CONFIG_UBSAN),y)
 _c_flags += $(if $(patsubst n%,, \
-		$(UBSAN_SANITIZE_$(target-stem).o)$(UBSAN_SANITIZE)$(is-kernel-object)), \
+		$(UBSAN_SANITIZE_$(target-stem).o)$(UBSAN_SANITIZE)$(if $(KBUILD_EXTMOD),,$(is-kernel-object))), \
 		$(CFLAGS_UBSAN))
 _c_flags += $(if $(patsubst n%,, \
-		$(UBSAN_INTEGER_WRAP_$(target-stem).o)$(UBSAN_SANITIZE_$(target-stem).o)$(UBSAN_INTEGER_WRAP)$(UBSAN_SANITIZE)$(is-kernel-object)), \
+		$(UBSAN_INTEGER_WRAP_$(target-stem).o)$(UBSAN_SANITIZE_$(target-stem).o)$(UBSAN_INTEGER_WRAP)$(UBSAN_SANITIZE)$(if $(KBUILD_EXTMOD),,$(is-kernel-object))), \
 		$(CFLAGS_UBSAN_INTEGER_WRAP))
 endif
 
