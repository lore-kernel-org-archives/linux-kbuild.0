Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7D438E13F
	for <linux-kbuild@vger.kernel.org>; Sat,  5 Sep 2026 12:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611572; cv=none; b=KRtqWJ5Sq8Ypvg62FTFz4JOn/n5TWwOPiGslkvvXZDgwoio5GkvnpUTQkqvXhvo1Pjcvtrf+W6abFUVAAVZkWiH7nnHD/vX73YY3PZ91r+PSefXm7kkKvosOIkTdWZPVVkSrkiXPJ4IcPHPIMMX/kRHdkDg0NUaaZBcMG+KeKlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611572; c=relaxed/simple;
	bh=pnRQy5qwBoV4WQmMNMWjMe3Gqr1TWajXwvWn035yQwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W/o0VZ1JDgRgf1BalglDnXa8VagE4JotSp8WW/FOMaDmu6RnewJJJsd6hXdWqh5F1fSFRc7A7SlB6mwHTmkI5fRU9RtThlAMqspLRTvKOrmO2NytvBe7w7XI2/q+i6jVav/yPyQOkUnNhCjuLOhabHxvK23QZDBD6w0Fuda89RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p7/WIqY/; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p7/WIqY/"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso23923345e9.0
        for <linux-kbuild@vger.kernel.org>; Sat, 05 Sep 2026 05:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611567; x=1789216367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FGOdDZVPcGy/cumUvidrcivm9rU85LBlhYiMsnrxU3s=;
        b=p7/WIqY/BCh3PubjRg+WqNxXFwiTcMWk7teOcE5gufhaLJsfr3s1gxStwDRTEmiFlh
         n7S632oU1Tlq4gfr5hosFAsZrhQSDaa/wS+a1UV7/jPE5K0BCwFpdrfdaOAk78QqBEIU
         iAZyefAYuqoXOQLIodm7DiJ+/9uUZe5xetjAhG+BBGENFe7f8yTvMulrWmFUDn06yGTh
         aDskg/mZzTIeRJK0GB8EaXweplkjvdgVRHpRQyzTpmDglxdBh9XFbbCil3/RnCqzFzF5
         jYbVxqmNla1m0P11Ov1qrj6MCiC1EArDWtDKn4IGWpTzwksptOvjj7SlOFVgWpoulFpp
         teAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611567; x=1789216367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FGOdDZVPcGy/cumUvidrcivm9rU85LBlhYiMsnrxU3s=;
        b=muFIM7yA/3gS6GmBsJHVnLRd/fktf5J6avR5qFFV+CcitVD81Yt9SYgqMTqZy6rzf5
         1HVDFj9GD7m9PxCQCd3HyuZWs0XCUbhMzXpADpoP8AMGj42QnjtgIqcRiD3Wh/kPhuni
         6ZVXVpo6DoG0OB9P5lppYMhtb1uRo46m8C8DyM3JRLZ+EG/pD8FeVloe0RQw7JsVvgac
         FA4Eh+vopm/LpA/NLMOhFtJ/AWsTvYk8q5ujeO6OROrk1PdPXewKly3k2VA+sTGZAlTK
         4JARLm8+zKTO2BZWsliRcX+JA+RU2f77tH8V07PgHqFwbHQcg9zRnnDuyAwQx59olOcy
         5sXQ==
X-Forwarded-Encrypted: i=1; AKwUvByPAo4ujCHnJQYjWXLLq38dXgutpZDBNXquPF83u2avpR4PJYE2E4L/wIFLcucSgT1Fq9BPb3Ao5l1/xeI=@vger.kernel.org
X-Gm-Message-State: AFuF++n4ZkIN8Uvrgm6JXU2E/p22ALH7kugp+Yn1OlRx0nv/rx7xJfS1
	bm5hLiTiaKFbpmvqIIKqWV0+c2g2HxvYfWKKjVWn/6zaKzS/eurZhHaEgZA5hH2z1vo=
X-Gm-Gg: AYBFou3j9QUZzDM8JFhr8vRKfd6QfQ72p+UmHeJZZWRhknaeUkAx7DAccFxTrqYXWq3
	PXidAqDLWcqlC41iU9YuspeSffR31V2xoHFAlrIhd80KILBo1sMpO9ObQqYPHII5JmXvWNgU64R
	Xd0iWT2R4F3SlLPUvT84Tnt4Jp5DWYHn2Wn/Tv4u7HmuMP7UFKOpl7rV1z7qj8EoZmFLOWFGblR
	BHUMVhpxkxk7cRqtMb3+dplpADhOh3ylsXlyi8YkB9UeHNSyAXbEonMZQdAS0WikF9V6QljLJoR
	HvXUu2dghnJ1zXtq3m/CevcGYm1r9p6IVrYj5NXmSjjxidbQcQMZ9ybfcDVNA2wcBBbKmqt+B9r
	wabzBE/6ZICm0P+JM2DgIEgjL3URz4UWwzuVhEH/bU3P1tGSfhFSNX3seTbckOCOCTtFD1vqPP0
	bs/BjiAApKb/Ig8efD3lWrjb7IAgrAslP/UMIDH0bMuuDkKQinp0fODrAN2bHhNn0hYwpPId35r
	4tf4njX+yOl5d/K/GVPLOeJj+o8Ni59HHgspIq5D0ryMz2TKiBCmixg7G2kiw==
X-Received: by 2002:a05:600c:3f19:b0:49c:fc6c:be13 with SMTP id 5b1f17b1804b1-49cfc6cc0f4mr92008045e9.25.1788611567187;
        Sat, 05 Sep 2026 05:32:47 -0700 (PDT)
Received: from localhost.localdomain ([95.3.12.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce831af89sm171800535e9.1.2026.09.05.05.32.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 05:32:46 -0700 (PDT)
From: Erkan Erdem <hexvalid@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Erkan Erdem <hexvalid@gmail.com>,
	Julian Braha <julianbraha@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] checkkconfigsymbols: resolve revisions before resetting the tree
Date: Sat,  5 Sep 2026 15:32:22 +0300
Message-ID: <20260905123237.40670-2-hexvalid@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260905123237.40670-1-hexvalid@gmail.com>
References: <20260905123237.40670-1-hexvalid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit comparison resets the current branch to commit_a before
resolving commit_b. If the second revision is HEAD or the current branch
name, it then resolves to the first revision. For example, --diff
HEAD^..HEAD compares the parent with itself and silently misses newly
undefined symbols. The same problem affects --commit with the current
branch name.

Resolve and verify both revisions as commits before the first reset.
This keeps their meaning stable throughout the comparison and rejects
invalid endpoints before changing the working tree.

Keep lookup diagnostics separate from the resolved hashes. Use the
resolved range for --find too, since resetting also updates ORIG_HEAD.

Fixes: b1a3f243485f ("checkkconfigsymbols.py: make it Git aware")
Link: https://lore.kernel.org/20210901145212.478066-1-arielmarcovitch@gmail.com/
Assisted-by: LLM
Signed-off-by: Erkan Erdem <hexvalid@gmail.com>
---

An AI coding assistant found the issue, prepared the fix and changelog,
and ran the verification below after a request to find reproducible
functional bugs in Linux development tools.

Validation:
- Ran the actual CLI against disposable Git repositories, comparing the
  original script with the patched source. All 15 patched cases pass.
- Covered HEAD-relative ranges, branch names, hashes, tags, annotated
  tags, ambiguous branch/tag names, identical revisions, --commit,
  --find, ORIG_HEAD and invalid or non-commit endpoints.
- Checked HEAD, current branch, index and tracked file contents after
  every invocation. The patched cases preserve these values, including
  when the second revision is invalid.

 scripts/checkkconfigsymbols.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
index 36c920e7..e0a1a631 100755
--- a/scripts/checkkconfigsymbols.py
+++ b/scripts/checkkconfigsymbols.py
@@ -150,6 +150,13 @@ def print_undefined_symbols():
             undefined_a = {}
             undefined_b = {}
 
+        commit_a = execute(["git", "rev-parse", "--verify", commit_a + "^{commit}"],
+                           stderr=None).strip()
+        commit_b = execute(["git", "rev-parse", "--verify", commit_b + "^{commit}"],
+                           stderr=None).strip()
+        if args.diff:
+            args.diff = commit_a + ".." + commit_b
+
         # get undefined items before the commit
         reset(commit_a)
         undefined_a, _ = check_symbols(args.ignore)
@@ -223,10 +230,10 @@ def red(string):
     return "\033[31m%s\033[0m" % string if COLOR else string
 
 
-def execute(cmd):
+def execute(cmd, stderr=subprocess.STDOUT):
     """Execute %cmd and return stdout.  Exit in case of error."""
     try:
-        stdout = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=False)
+        stdout = subprocess.check_output(cmd, stderr=stderr, shell=False)
         stdout = stdout.decode(errors='replace')
     except subprocess.CalledProcessError as fail:
         exit(fail)
-- 
2.50.1 (Apple Git-155)

