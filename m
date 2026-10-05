Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7C9477E2E
	for <linux-kbuild@vger.kernel.org>; Mon,  5 Oct 2026 10:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196862; cv=none; b=X7roo/cvlJodbQR07ljV0ocMBEEQr0Zpr0IULd1XQNfbxElUeHYimXG2YzzXo873M4lwNEIQbN6BI5vC+Z6yBCq+EEg31Zc2PSd4HTSv+5aDb6wg0hyBoz/8HCK6IoA11yl63jGgs+eMRBgtBRtZGELYVJoJGvcs9rwoCZYQFOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196862; c=relaxed/simple;
	bh=/HFfd7hELjQy/Kgc8ukSdhXTlt/OCGs8ssekfu02a0o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C+u9fEjYfCQ1ltkMzOuJqbKzkGAbJvGMJtO7EKQEEyqkioDVFQ8f3JGIrr3FbAuKn04esLfo809BsIM5cT4bZ2E0KDqHja9dHFeJ3ln6zOeoKyx4dXXSd8OnsP2RNwjm4hXm/ILaXCQtUYGtsOeeoUpi0fw1MUYvhRzYxPrX2bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmYjBNq8; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmYjBNq8"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46ac6e5d8f7so1009003fac.1
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Oct 2026 03:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196860; x=1791801660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3U5YwHD1Z0Qjfcq1Gvi79ob/V78ZCaci+Pc6FSIkfe8=;
        b=DmYjBNq8V/5Kex7fk73P8FH4CGzy76UXwuoDcgnf38FKXTvKwuNwAgozpdxbnRf98P
         3EYXNeIKC0Pkg4BMPTCq93hdJYsTn2K/E9HFASXSJApJM9UEfaUukETzYINkkLa6i7r+
         MAOiwJs7q0Bt+NCecJh31werIEciFapNR1ITGwVZIE6XMgdEOeWzahiOwTmrtO8joqhx
         MxfKmpyFvUEpW2FJ6wcWuwpKEdezcW4r+F9lk64xq92jzhH05ps6Lj+29BvpWUhendv2
         rZLl9XwtsVWhc8IM9Ik/JD3DuevkOdDSzob+gcf0dIytE4p5J7uTGoLQ/eCwKAOfEAZ+
         cmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196860; x=1791801660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3U5YwHD1Z0Qjfcq1Gvi79ob/V78ZCaci+Pc6FSIkfe8=;
        b=WoxVCwVkmZ1sL0aXzK0B6FIfC/BvrO5XXUmrJnsELfJW6bqOo7KdzBCbvdmMuRtNd9
         FAR8LY/eGlyS52ZhRCstNaQ+H5nhhl/kIIH4ipfSCJoVWDyl3q9hYnE9woYy46ctlU4A
         PsI/H6X2Pt/zRbZiQBW5hzKfFfO45CGGaUHHpo+XDyFzAatqGIHzMLA+C++X52YwS11w
         zj4WsdWbizgj1YOXa2dahxNmsQGuNJOhhdpi1JkuyIh1xS4WR2g5NJAtwCuGXEm5r4HG
         2WVIKcd8c3VxJpfwPsTXKIY82wZc6GP8nkFgBhX+2w85MjnJseyxwXphg1gxOfDYUmgj
         pX4g==
X-Forwarded-Encrypted: i=1; AKwUvBw9bjmSGJ3L87TFGQ07hj1o5w8bnnxSvvL+3GcFHWl7nZe5zXcTurLxgJZaJAdXusK/YrBYoPnycjBF1hA=@vger.kernel.org
X-Gm-Message-State: AFuF++nYY2gq45jwXjzrr5+ji0fvlwQ251ub4M2M7lTw0MjpJxDri1xP
	hYnC8dCUt1dtYwtkznZ+4cvgZPvAP8IJV/vjrkbTp1Qt1ViqTzYD/ZF9
X-Gm-Gg: AYBFou2IZpyRmWjfgjBXhccNvoO8+Y+feCy9MVFxU5ljcgOuuvpxMZSEQnTBjaMSwDf
	VGSkYFJhJaWgXXqkJAuXYHGyEX6ljHCJZSqgNUyxmOR14MyuPRvEig7XWznm1vBDoaWfAwGYtd5
	eqiY9g/ENKifkU7bARzzQBQfRDTJOT3LiqrVl2NS3R8VvuajKf5CqrJR2Cwy7TsWSX0MOc64RYf
	rFzCmYIEAsKzDLlKLNF+2S0x02uRd0F1zUe6UEyqGyj2HIJPyeh3IckZ6cxh5GKeIobWXI+UCam
	fPX1HHOkLpESj6/KROtE/DQ+5fKVs9jp62q3v6dhHf98ldxfbYaBseezfVkSzTmyNRPK0NL5XKd
	liAdLmf/o2raozFTdXaZ207GE0Gcy8pBrLoxb8KtVlrKo/mDs2YdKOgyEqEC0gP1+h+n8VFNaNr
	L+IYanRVXbScSsWzXH/uKJSfu3rFj6bPdSkp2/+wuziKvODcE9vK9r/zckt9n0X4JulrE+X1B54
	teThypWNvFWZVxQfWqUCNk=
X-Received: by 2002:a05:6870:2104:b0:475:e0a7:9f33 with SMTP id 586e51a60fabf-49e15d66acemr9376982fac.33.1791196860092;
        Mon, 05 Oct 2026 03:41:00 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16ebfef1sm7881883fac.13.2026.10.05.03.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:40:58 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] kbuild: fix memory safety and UB bugs in host tools found by fuzzing
Date: Mon,  5 Oct 2026 05:40:41 -0500
Message-Id: <20261005104050.1786222-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: lzhan011 <zhangleizhen645@gmail.com>

This series fixes bugs in kbuild host programs found by building them
with AddressSanitizer and UndefinedBehaviorSanitizer and fuzzing their
inputs. Most patches include a reproducer.

Patches 1 and 2 fix bugs that also trigger without sanitizers:

 - kconfig: a string/int/hex symbol whose default is a choice member
   gets a NULL value and crashes conf (since v6.11).
 - genksyms: a declaration such as "int a, f(int);" makes genksyms loop
   forever while allocating memory (since v6.14; earlier versions
   silently recorded wrong types for such declarations).

Patches 3-9 fix out-of-bounds reads (fixdep, modpost) and undefined
behaviour reported by UBSan (kallsyms, modpost, sorttable,
tools/include byteshift helpers), several of which trigger on every
normal x86_64 build when the host tools are built with UBSan.

The series is based on next-20261002. With it applied, a defconfig +
MODULES + MODVERSIONS x86_64 build succeeds; for kconfig, the generated
.config files for the def/allyes/allno/allmod/rand configs on seven
architectures are unchanged, and for genksyms, the symtypes/CRCs of 149
preprocessed kernel sources are unchanged.

lzhan011 (9):
  kconfig: fix NULL pointer dereference for defaults taken from choice
    members
  genksyms: fix infinite loop on declarations with parameter lists
  fixdep: fix out-of-bounds read on a comment ending with a backslash
  kallsyms: do not call qsort() with a NULL table
  modpost: fix stack out-of-bounds read for unterminated PNP ids
  modpost: fix handling of short reads in read_text_file()
  modpost: fix pointer arithmetic on NULL in parse_source_files()
  sorttable: avoid pointer arithmetic overflow when locating sort_needed
  tools/include: fix signed shift overflow in 32-bit unaligned accessors

 scripts/basic/fixdep.c             |  2 +-
 scripts/genksyms/parse.y           | 23 +++++++++++++++++++----
 scripts/kallsyms.c                 |  6 ++++--
 scripts/kconfig/symbol.c           |  4 ++--
 scripts/mod/file2alias.c           | 10 ++++++----
 scripts/mod/modpost.c              |  6 +++++-
 scripts/mod/sumversion.c           |  3 ++-
 scripts/sorttable.c                |  2 +-
 tools/include/tools/be_byteshift.h |  2 +-
 tools/include/tools/le_byteshift.h |  2 +-
 10 files changed, 42 insertions(+), 18 deletions(-)

-- 
2.34.1

