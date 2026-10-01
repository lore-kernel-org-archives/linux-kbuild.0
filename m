Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7462941F5C4;
	Thu,  1 Oct 2026 16:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873877; cv=none; b=e2cty/XQqXz2fhAPtbvrp9rpJGLrCTZrl9lJ4GZDd7hmo5WlaU7qVeXHvvef5d40/uKw7Nckj/rFj7aaGO64DOKQVOJeBijgcCF9rSbuIeO4zxoUjtusN5gdwkPt8L3UsEBtTfNcf5zNsj1pSiuLsl++bgxTr2jcRep3D4XGWJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873877; c=relaxed/simple;
	bh=F8m+/KaA2f2aGqESdoerAEhTiZUTucwzfPOgdVWVx6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hXNSg+ZyLlrKPE8DUEdP39F/zKTa1MiNwyd7wdOqPeKOCNDZp9ycLIylyaozXoPLR417BdxJ/5vQAZYujQ6pj+0APzzQK3LUCEa6ZlKirO71JwEIkSzFIS+HBV996CtS0+sDp2EpniSw9Z4RX2CIRR8iZncO2culUeaLyOD0Wfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=FyPrm45a; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="FyPrm45a"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=Message-Id:Content-Type:MIME-Version:Subject:Date
	:From; bh=n4Uf3Bi9gNTHARUSRTnUx1BhFBq1Fn5yVgT2ywOy2aY=; b=FyPrm45aS8i30lt/Gzb
	lKwaOkqYtQBMd5pwYmsgxJHZ2H5PbvOnl21Pebwa1yn2Xyjfs2cD7vV/TTB6WFt584YDjqsNDfWnj
	LQgtHCITSwo0007502dWaIYdZJ0SD/0E3hgqfGTxS9wQ9ZUduUKA8jbvDN3epcEVh/Z8Pb12I5/e4
	ltara3sUL3sAV/eBnaS8Ub+/r09gRjpQ01ZbosI7EknP3uji3SzTL4jxLqLIZUqXKKiOL5pQ4hnbo
	By1Dg/3k6PmsV2X716spFeOFTw5caZWiTV2ibLgt3pB+VZsEm+9zw7JTQggHWBQKUWlbn941qitFl
	81HangpjL2kyjkg==;
Received: from ch-demo-asa.virtuozzo.com ([130.117.225.8] helo=f0.sw.ru)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <khorenko@virtuozzo.com>)
	id 1xCK3B-001W2F-10;
	Thu, 01 Oct 2026 18:57:40 +0200
From: Konstantin Khorenko <khorenko@virtuozzo.com>
Date: Thu, 01 Oct 2026 18:57:11 +0200
Subject: [PATCH 1/2] kbuild: use $(CFLAGS_GCOV) in the prefer-atomic
 try-run test
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-b4-prep-gcov-v1-1-794792e06f24@virtuozzo.com>
References: <20261001-b4-prep-gcov-v1-0-794792e06f24@virtuozzo.com>
In-Reply-To: <20261001-b4-prep-gcov-v1-0-794792e06f24@virtuozzo.com>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Peter Oberparleiter <oberpar@linux.ibm.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Mikhail Zaslonko <zaslonko@linux.ibm.com>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konstantin Khorenko <khorenko@virtuozzo.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1579;
 i=khorenko@virtuozzo.com; h=from:subject:message-id;
 bh=F8m+/KaA2f2aGqESdoerAEhTiZUTucwzfPOgdVWVx6c=;
 b=owEBbQKS/ZANAwAKAVGWCkf5YVwqAcsmYgBqvpEFr1lDv+sWfUAUVlTpXCnPP/WqFqgkMSMo1
 cW1PL8Fj3yJAjMEAAEKAB0WIQRWD23IPcXT0GO9CCxRlgpH+WFcKgUCar6RBQAKCRBRlgpH+WFc
 KmbsD/9jwFHdznvEHgICPDulvlY96YHvTLQorXiFn4rUnYWkq+Jlh7Ew8ce2coauVuB/aPpN1Qv
 rXPyapgvBUFMZT3W6V+nF3DsYs4IIWn4pSynxGEkIqYxzj7fVLlb5NZDk0acshbl0ZOk9yNV2+k
 Y89fPmdcVfyzrtRvK3LlbU8f/Mh8iMqerfMsE057wq8jqdsp0/TewGYkMO13vrolWfVCJ9XCaru
 YLS2N7uuZ9mdBlJVc+v63A5eHTl2UGTLo/+apeS0hX5Cz3y3sawrLGHuyp+szHDlGVgkKpp/hGt
 cV2pus2QsaDhmtvGNDIVWNbEGZD3Zl7x9Ycm5pbqoePOZ+CQpeK5cJD6fyj3XNK92DA29o2hcij
 w0Zgx55TFGi5SZq8Zo86umdZX00Q8kI5npq2Gewepi6033E4VUbgFATXQZy+Agr+9kJQfdNpSWr
 7RAPQDCjwEBRrKqujHow/u6klBzAySC+kUnq+QxKgr/iYuX4OtPhBO7VlrzUFlbNsUIaS11yQ0k
 Uk89M0BEKPPyafjMQZ6AnauE8TLLofYjR+ZCLOiII+dLmraUxUdn2z05ofUtOixWQqNA0dxv9Bj
 llCyJ6sr9Er+rChfzihdYa5tsfYbuVfyCjXU4iBKakcxjG0d1MNSjEZOBPqQIWHP4fMdAWPNhxO
 u/PlMkdbXdD5h2A==
X-Developer-Key: i=khorenko@virtuozzo.com; a=openpgp;
 fpr=560F6DC83DC5D3D063BD082C51960A47F9615C2A

Reference $(CFLAGS_GCOV) in the try-run test introduced by
commit 56cb9b7d96b2 ("gcov: use atomic counter updates to fix
concurrent access crashes"), otherwise it can miss potential future
changes in the list of flags used for GCOV profiling like it misses
-fno-tree-loop-im at the moment.

The outcome of the test is unchanged: -fno-tree-loop-im does not affect
the undefined symbols the test compares.

Suggested-by: Peter Oberparleiter <oberpar@linux.ibm.com>
Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
---
 Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 6b8b812f23b92..3b69b973f7598 100644
--- a/Makefile
+++ b/Makefile
@@ -1184,11 +1184,11 @@ CFLAGS_GCOV	+= -fno-tree-loop-im
 # undefined symbols (e.g. libatomic calls that the kernel cannot link).
 CFLAGS_GCOV	+= $(call try-run,\
 	echo 'long long x; void f(void){x++;}' | \
-	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -w -fprofile-arcs \
-	-ftest-coverage -x c - -c -o "$$TMP.base" && \
+	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -w $(CFLAGS_GCOV) \
+	-x c - -c -o "$$TMP.base" && \
 	echo 'long long x; void f(void){x++;}' | \
-	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -w -fprofile-arcs \
-	-ftest-coverage -fprofile-update=prefer-atomic \
+	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -w $(CFLAGS_GCOV) \
+	-fprofile-update=prefer-atomic \
 	-x c - -c -o "$$TMP" && \
 	$(NM) "$$TMP.base" | grep ' U ' > "$$TMP.ubase" || true ; \
 	$(NM) "$$TMP" | grep ' U ' > "$$TMP.utest" || true ; \

-- 
2.43.0

