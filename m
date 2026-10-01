Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74577419302;
	Thu,  1 Oct 2026 16:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873878; cv=none; b=V8gM+83Zlmo4w6RCZfxFMgFiZXNIq57gzo09Ztyzx6xX4ovwvA/zIX9E06M8vq2bZzaTIMNa907h+tXwr2A4o3pme6IEZjEp+SLp6mdFOmqbUpuBBp6FLfXOS8J12JW8jDuO+P2QIgpYiPI4vmXwuecq5tjVjPmdRgCs57lqGcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873878; c=relaxed/simple;
	bh=bqqcD5uGSPTXpoqMgTDCaAYMvQrQ0DEx0hOijPZIzNI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KCTdJjiaWTAXN/ugT43uUE1LOXSTMu7gWDqy91GHE8JANBIK4c9fxijYkqesmIttHIthZmO6p7NGcwTQhBY6BMYobxUPfinSIYbTpp69o+5vKzjjZVh7fLmXbmWsyszEjosr51p6HaLpsaK5SNJZ/59yxU+P4kEcFt7AI7xK/fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=XS50oMlV; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="XS50oMlV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=Message-Id:Content-Type:MIME-Version:Subject:Date
	:From; bh=c9nnVi5dNuW58KgB8WVicvJQWfkeCYAVCauaYtGercU=; b=XS50oMlVtfrOTy3xWly
	AMG7BON7i/3Vw+d0g5s5sgABK664LTS5vuCLV5e/rBh298cvKrZO1BjB6AhGPNpbX8jXK3OzLPv3q
	A7VVpXGwVwRiFEGZaWyVfM0IjH9NXib1jC4IPVsn0zebq6CWy0Imjj4GZ+HBMSi5GDEEAGmn5D2Zy
	f23dtE+3f2RhuUW+VlCYhOmiPQsZqgeVkxnIaxg/qxBvNJhJHFX+Ug3UrFNQuj1bLW98funpB9X2Q
	LRiC6Bty1EuoQBEuLpuDifkwggO6DzsDrpUwku0cb7dKrgsfbNB59wpnk8kXgO5tcyEY2lYpn2lXW
	eQDmar5mZ0fbPow==;
Received: from ch-demo-asa.virtuozzo.com ([130.117.225.8] helo=f0.sw.ru)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <khorenko@virtuozzo.com>)
	id 1xCK3B-001W2F-28;
	Thu, 01 Oct 2026 18:57:40 +0200
From: Konstantin Khorenko <khorenko@virtuozzo.com>
Date: Thu, 01 Oct 2026 18:57:12 +0200
Subject: [PATCH 2/2] kbuild: move GCOV flags to scripts/Makefile.gcov
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-b4-prep-gcov-v1-2-794792e06f24@virtuozzo.com>
References: <20261001-b4-prep-gcov-v1-0-794792e06f24@virtuozzo.com>
In-Reply-To: <20261001-b4-prep-gcov-v1-0-794792e06f24@virtuozzo.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Peter Oberparleiter <oberpar@linux.ibm.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Mikhail Zaslonko <zaslonko@linux.ibm.com>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konstantin Khorenko <khorenko@virtuozzo.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4238;
 i=khorenko@virtuozzo.com; h=from:subject:message-id;
 bh=bqqcD5uGSPTXpoqMgTDCaAYMvQrQ0DEx0hOijPZIzNI=;
 b=owEBbQKS/ZANAwAKAVGWCkf5YVwqAcsmYgBqvpEFygr8m9YxOLhPf0JMWzH/b8BAo9EFk6Zv5
 aOhb/ca2jmJAjMEAAEKAB0WIQRWD23IPcXT0GO9CCxRlgpH+WFcKgUCar6RBQAKCRBRlgpH+WFc
 KoltD/9p5Z8jvJRGwn7+O4+xbxNPKbi5Z7rxXdDS3mw8ihd4fO623mlFKvagq9rztO/v+r+1g9H
 QfLkPtSem7wnhYIz2nLIfwNtZbXnx8WWe2JvmjON+LoJqd5DsKPkMmV5urEJl20jAykyYn1FyJ3
 ULqApwLgsvA01elmTrjabBn3mr7YSWgVBIvbgqHHM3ZmVgqVbe2YSvULlwrIpv2P+1FfBt+I0aM
 WV5lmRGXWP2grQGeYdMXgMB8c1r70rpulHM5MVyU45zb4+f3nZoGL2GNOCsB8WQcgGRp4ZhwCVA
 Lj0TYQzPo2yNiRLYrV4uqPmMYJnEm02Eyu2FbDijYhQ+wBD9CizMEVuda20R+nBdWQRzeKMoQC0
 i6bImkHjprFCIlhsB9odMY2dQkzsP5CwPxMbS9emPxgdC0P1HAI9a1KvVFCYSwmFwH+JUrNWRwp
 ja2M748gPbq/3G9/bXS/YyciS6jpT7JoFRE80wZpjZL8Otql6RMcBoWh75EO12/dUfk+8DMQdom
 97v/tw1K7RSTxkA6MAEFXu5kErUN6CFk10YLWIta/oGrMJhhyPCbQ+UJtNy78bWSer/1NPqyRBY
 9+LlY47upam6I8IkBFoEdralSmUhDTPT/wOaDYo9WZzW+5i/XHiaP7b2KpzIYZ2Xn3MEmLyvsY3
 /J//ev0seZ2nrXg==
X-Developer-Key: i=khorenko@virtuozzo.com; a=openpgp;
 fpr=560F6DC83DC5D3D063BD082C51960A47F9615C2A

 * split the CFLAGS_GCOV block out of the top-level Makefile into
   scripts/Makefile.gcov
 * include it via include-$(CONFIG_GCOV_KERNEL) like neighbour
   KASAN/KCOV/UBSAN makefiles do
 * keep the include before scripts/Makefile.gcc-plugins: the try-run
   must not get -fplugin= options, plugins do not exist on clean builds

CFLAGS_GCOV is no longer defined when CONFIG_GCOV_KERNEL is off:
 * its user in scripts/Makefile.lib is guarded by the CONFIG_GCOV_KERNEL
 * in i915/xe header an empty value is harmless

The try-run compiler invocations also stop running on builds without
GCOV.

Suggested-by: Peter Oberparleiter <oberpar@linux.ibm.com>
Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
---
 MAINTAINERS           |  1 +
 Makefile              | 22 +---------------------
 scripts/Makefile.gcov | 21 +++++++++++++++++++++
 3 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 360977678f707..fabf33758351f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10897,6 +10897,7 @@ M:	Peter Oberparleiter <oberpar@linux.ibm.com>
 S:	Maintained
 F:	Documentation/dev-tools/gcov.rst
 F:	kernel/gcov/
+F:	scripts/Makefile.gcov
 
 GDB KERNEL DEBUGGING HELPER SCRIPTS
 M:	Jan Kiszka <jan.kiszka@siemens.com>
diff --git a/Makefile b/Makefile
index 3b69b973f7598..f3ea94ceb1cec 100644
--- a/Makefile
+++ b/Makefile
@@ -1176,27 +1176,6 @@ endif
 # Ensure compilers do not transform certain loops into calls to wcslen()
 KBUILD_CFLAGS += -fno-builtin-wcslen
 
-CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage
-ifdef CONFIG_CC_IS_GCC
-CFLAGS_GCOV	+= -fno-tree-loop-im
-# Use atomic counter updates to avoid concurrent-access crashes in GCOV.
-# Only enable if -fprofile-update=prefer-atomic does not introduce new
-# undefined symbols (e.g. libatomic calls that the kernel cannot link).
-CFLAGS_GCOV	+= $(call try-run,\
-	echo 'long long x; void f(void){x++;}' | \
-	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -w $(CFLAGS_GCOV) \
-	-x c - -c -o "$$TMP.base" && \
-	echo 'long long x; void f(void){x++;}' | \
-	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -w $(CFLAGS_GCOV) \
-	-fprofile-update=prefer-atomic \
-	-x c - -c -o "$$TMP" && \
-	$(NM) "$$TMP.base" | grep ' U ' > "$$TMP.ubase" || true ; \
-	$(NM) "$$TMP" | grep ' U ' > "$$TMP.utest" || true ; \
-	cmp -s "$$TMP.ubase" "$$TMP.utest",\
-	-fprofile-update=prefer-atomic)
-endif
-export CFLAGS_GCOV
-
 # change __FILE__ to the relative path to the source directory
 ifdef building_out_of_srctree
 KBUILD_CPPFLAGS += -fmacro-prefix-map=$(srcroot)/=
@@ -1214,6 +1193,7 @@ include-$(CONFIG_KCSAN)		+= scripts/Makefile.kcsan
 include-$(CONFIG_KMSAN)		+= scripts/Makefile.kmsan
 include-$(CONFIG_UBSAN)		+= scripts/Makefile.ubsan
 include-$(CONFIG_KCOV)		+= scripts/Makefile.kcov
+include-$(CONFIG_GCOV_KERNEL)	+= scripts/Makefile.gcov
 include-$(CONFIG_RANDSTRUCT)	+= scripts/Makefile.randstruct
 include-$(CONFIG_KSTACK_ERASE)	+= scripts/Makefile.kstack_erase
 include-$(CONFIG_AUTOFDO_CLANG)	+= scripts/Makefile.autofdo
diff --git a/scripts/Makefile.gcov b/scripts/Makefile.gcov
new file mode 100644
index 0000000000000..16c5b876440c2
--- /dev/null
+++ b/scripts/Makefile.gcov
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0-only
+CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage
+ifdef CONFIG_CC_IS_GCC
+CFLAGS_GCOV	+= -fno-tree-loop-im
+# Use atomic counter updates to avoid concurrent-access crashes in GCOV.
+# Only enable if -fprofile-update=prefer-atomic does not introduce new
+# undefined symbols (e.g. libatomic calls that the kernel cannot link).
+CFLAGS_GCOV	+= $(call try-run,\
+	echo 'long long x; void f(void){x++;}' | \
+	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -w $(CFLAGS_GCOV) \
+	-x c - -c -o "$$TMP.base" && \
+	echo 'long long x; void f(void){x++;}' | \
+	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -w $(CFLAGS_GCOV) \
+	-fprofile-update=prefer-atomic \
+	-x c - -c -o "$$TMP" && \
+	$(NM) "$$TMP.base" | grep ' U ' > "$$TMP.ubase" || true ; \
+	$(NM) "$$TMP" | grep ' U ' > "$$TMP.utest" || true ; \
+	cmp -s "$$TMP.ubase" "$$TMP.utest",\
+	-fprofile-update=prefer-atomic)
+endif
+export CFLAGS_GCOV

-- 
2.43.0

