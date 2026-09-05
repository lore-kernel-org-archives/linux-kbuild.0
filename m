Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EF323AE9B
	for <linux-kbuild@vger.kernel.org>; Sat,  5 Sep 2026 12:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611569; cv=none; b=G3wx9wkIQsNcRnUxbvrfol+FWHaXt5rvVxZ6KffoGtt24OL1AWKuMO8b/x/aqNrnMviW7u7CcT89kDG5sSR+i+5hiTgKNHCZzrYUE9nUV9G0bfSzMjvmdx/vhDO6OeeeqquCmPeh6J5fMr34C3AGWsNvjkjCuZX5DN9s3sVnlRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611569; c=relaxed/simple;
	bh=Zqnc75eH9l1R1ldneMAODSFBcp3t1bLl+QgbQnbmsEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QYnSGe82emcI8NaFH4GB6yFGbvlJ61NGh1vRd7vYWjXTvXwfGLL+MGdc4DHidwD1FbHJYNyroQdI8TR/Fergyq4JohEHDi1DwkXz1yEFeFe90FAky3TMTv2R6Yi9WGp8pAmTba9/iUDU3WMZgpcVbSiTrBzUHZEZa0V1v9AIpc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0rHXHRC; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0rHXHRC"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49954b88fffso14305805e9.0
        for <linux-kbuild@vger.kernel.org>; Sat, 05 Sep 2026 05:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611566; x=1789216366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xWSSfgErFMktAfe6G35eCBTHHADB8r9vLVP06EqoFO8=;
        b=k0rHXHRCa8KR1d53eQMHG6o/T4zsqljG5W5MFxTsbL1+zQU9lrV2KoqR4YKEjB94ji
         PsOBvCXzikgT0/2AqMbiBTgAmr6KzG61Wfahx4iXZNAjWHfWtq2FzuMiJdc2FwSrg0X9
         vc0vzw/iEKr5XPJLUcyydfQDw2jr/MFxjfz6kmqUmgZGLVXygTxYBkt0/L+ktT+qEOBR
         RdRIdbJJcq6EqpEZb2Uv7cHtSyLslu9zwFgjFbuFobnXQ8fuERU28D4VK+U2TsSJN8pB
         GKFMFU4K7emOGHu7COxBhcoJMLFeWusOy2pCIKIKSVEa6doWRd2pvvUgzAMiDwUTkwBo
         yZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611566; x=1789216366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xWSSfgErFMktAfe6G35eCBTHHADB8r9vLVP06EqoFO8=;
        b=ourX6i86nu/wdXtqLeRiWRfEX+Sp0sL5bSfQNa51RukFN0sXyzJ3ojlz0d42B9XC4J
         Q3AGJe5J3aC3ExniYxYfPGLGt6UonCrLuYPkExwA5C+N7ic3SFoLFI33JbEIRqLOSzKF
         MauavLZ2Jutl8T6shZslhNE+UdwlR6M1XZ8sycE19DB+6TLC/WIbHk0EIqNdS+mptyYF
         curKxV0JtDeFtY8EcXttOHUY1EW/k3au4DMUkDx/dGGsKLAXj7hD0HZ6+A2L8IO4er13
         3gZ9Bn+jWzACCft2Y9vC+nyC4sn1kS1vtgU65Oyyw3ZHW6Sn8J6TxzhvulJ4RUdOrWVg
         Ittg==
X-Forwarded-Encrypted: i=1; AKwUvBwRsb+uw2n8IDRDRl+d5UGnztrQk05i7sMABUqnVJDPQZtjDDKr9Kn/cShC3mJlqjuMXmZwUWyOQ1PxYkc=@vger.kernel.org
X-Gm-Message-State: AFuF++kQja6NkT1MktzcUN5PK2qC10Qls60Ei0E/eqcNpZGK5LcTD/mC
	I9+kSXnf6WzgdxLbjVg1xNE49tVUCo+VniFC+QulMCgNofiBKn7lc9+w
X-Gm-Gg: AYBFou1HlhgFr9ee0r7zHoxvXSNDJr0cBdS8nmhbaoKFTMl2BKd5tLDxRuT4v0YL1wJ
	ZHAMaslAC8jXz+Gq63qdA8YoHKuw63RFbh2zuy63crwKCHw/GVcEUvu/SWdZh7u/DW1lAdclJDJ
	+/vQK+pQ5XnwRj5wJ74Yz0L0H5yjw49hS/HijUXQk0L4ihVldqttarNJmeatw/EYXovSCXrWzRo
	1EMU1ktaBNjS77UATYxG/UdAnbNi4NzOMuwzX9o5wcbHVcnnhb/M2XBsXFnIseR4oi8dzsLzzAp
	OXtCn8U6DyFPl8GE+dhSAVl2d8QPlj+f9MYezjZgkQTUgX2GYMLwQ8UwUzoOpca0oNKOlpA3DSB
	6LLfB+nmqJKR3+lOPQQDGroKh9ALwV0aJXuEClTmeyCtYoOyVN9JEHC7YlsAIe8gr3ephpXou5P
	vMp3L7UgZni+KGpV0f874fiVIUkIrtpTljD0vWP09O2c6lBm8GMDf7UMDleau1iXZ7xT62VlLa2
	uMyjLkvnwFQFg6WZJQpipicdpQgEYjZzFOuQIwu7WBHy/PT9+CzBrTR4mDG5oXlRpVNYMHX
X-Received: by 2002:a05:600c:5493:b0:49b:8f18:714a with SMTP id 5b1f17b1804b1-49cf824a6c5mr128476055e9.12.1788611565868;
        Sat, 05 Sep 2026 05:32:45 -0700 (PDT)
Received: from localhost.localdomain ([95.3.12.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce831af89sm171800535e9.1.2026.09.05.05.32.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 05:32:45 -0700 (PDT)
From: Erkan Erdem <hexvalid@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Erkan Erdem <hexvalid@gmail.com>,
	Julian Braha <julianbraha@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kconfig: preserve the final answer when input has no newline
Date: Sat,  5 Sep 2026 15:32:21 +0300
Message-ID: <20260905123237.40670-1-hexvalid@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

conf_string() unconditionally removes the last character returned by
fgets(), assuming that it is a newline. When redirected input ends
without a newline, the last character is part of the answer instead.
For example, feeding 42 to an integer prompt stores 4, and feeding
0xff to a hexadecimal prompt stores 0xf. Both commands succeed despite
silently changing the supplied value.

Strip the newline with strcspn() so that a complete answer at EOF is
preserved. Keep the existing handling of newline-terminated and empty
answers unchanged.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Erkan Erdem <hexvalid@gmail.com>
---

An AI coding assistant found the issue, prepared the fix and changelog,
and ran the verification below after a request to find reproducible
functional bugs in Linux development tools.

Validation:
- Built conf with Clang on macOS and GCC in an x86_64 Linux container,
  using -Wall -Wmissing-prototypes -Wstrict-prototypes -Werror.
- Ran 60 before/after executions on each platform, covering oldaskconfig
  and oldconfig with string, int and hex answers. Unterminated answers
  retain their last character. Newline, empty-answer, empty-input and
  CRLF controls keep the same results.
- The 21 existing Kconfig tests pass on macOS.
- This tests the host configuration tool; a complete kernel was not built.

 scripts/kconfig/conf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index fe8ba09b..46c9ca64 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -343,7 +343,7 @@ static int conf_string(struct menu *menu)
 			}
 			/* fall through */
 		default:
-			line[strlen(line)-1] = 0;
+			line[strcspn(line, "\n")] = 0;
 			def = line;
 		}
 		if (def && sym_set_string_value(sym, def))

base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c
-- 
2.50.1 (Apple Git-155)


