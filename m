Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8970D40F756
	for <linux-kbuild@vger.kernel.org>; Mon,  5 Oct 2026 08:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791190657; cv=none; b=r6bHCwa0jkWdSnikcL8+pvd4IlBCJbj+/Lqn2LJ7Z6qOwE9uHg69RToCjBMsQlT8sSSpHLh5+YVxIJ/h11klpFnl1l3B54XyojAzPYF048G5FV7Zx23j7S/b6+CQBKFyrZaOh4mDAkfd304o72i+xb5kAC/ue5IbblXhVk1b1Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791190657; c=relaxed/simple;
	bh=meebE/h5u6rOUA/vPbZJJdVkADIHNr9DhZxBNZm44SM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OlixnN93aApwic0UsMq4E9ZT3e7Ney279RJjeLA7W6way1Nddkg+zqHP4ExPpr7USjhyMZZIlAnMgfwmDOEf6RVIZwwrn90TIov/bscYc0ZK1cKqLDPdufH8R5NFlDVda+JLEyhxFhHwzWK/SEM/awi8tcT9lsSFsBS3Mehk9S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LsEe6koi; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LsEe6koi"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6aa9606ddadso1109477eaf.0
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Oct 2026 01:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791190655; x=1791795455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hgapWjxckwHwiqh7aA0j5a3SO6MCzmt6cYgXvBBHOoU=;
        b=LsEe6koiwv3jLSOLOdFuvIYrSflTXrO71IkQiPuWjR2IQbilgTk1Q/tb8dsqjGSkLQ
         fyWfHTvFnD1UDocwa+2M83MBU8gBJ/b8M8Jk+6R2UCXwseRp3pMpEryDnoOBYW6Cp1i7
         WCa3mx6LBBUhkCzT3cYDW8CKmdoR80DlWZNXBVSppQCBnxbwcG1M9QlKYpuIxrfKxfCl
         YWUcQTu/duueFB55GLclQQoclraHoaeWyqDkAH4gwyaCRyIlBkpn4WuPv2NBMlWHo58Z
         Z6tf4DVbMJs2QdP6SmGb720nRv+uC5dHRFBuMKyQpDdfsOh7irOpFaVUkVU00wOmqNbr
         51EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791190655; x=1791795455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hgapWjxckwHwiqh7aA0j5a3SO6MCzmt6cYgXvBBHOoU=;
        b=XRnMimklQPuFymGL+rmLV4sK9ja7sye0TAmKCn0QqdUpG9gtW6AhDVSRYrCZskU9/H
         0JicojPovUkzHyvg/HgQUcPOlwFJHy88i3r8sgt+sAdMv0nHcAv5RTkG/ni2XWwzYPY6
         xcwBuWqP25O2dVjajB/F2ab152eQWnGRlKLGb8sQ/lJLmummj/UkbhiVlVOP8UMjJOLi
         ld4E25DJg+VewCgG/l01za52KBVn45k+I9+vi4VdbrqG7S0QoAUwOR3xBS5dt3k7hAC7
         hZ8n81COC+pJz6AQPtw1pgWwO3CZ9gLNTkKGTa0eRMsJCa5w60b7+7P2gkOD9HpkWJjZ
         /Eeg==
X-Gm-Message-State: AFuF++m1vP9Llu6uxJPvvbkliCesAK92TN5av5lBUdAx2JSmHsSSMizg
	vyE9eQYtRNKy3UEm3p9c6jBPsIYNTf1nd6Rr/0cV6JcE7XjCJQvg9B2g
X-Gm-Gg: AYBFou0TxW1H2KZ8Zs4VbwOAl8qRRXIMZSs/efjhI23Y9N7PAeKDeVU3mZKpnDfXKYh
	9qtSNz4pviAi/EyJn8u/uoXtN/WhSDmPYHkW39rOo7gY7dXQPujLl4bRuW+M+UHZZrktp44oufu
	2Kcjf/QERoDtCi1D2ZCSrVvjeHgUZSLddt9Kmp9xcbfukh/FhhKJandQEVihDSdytA9jozLg1Mb
	JnuPFrBLMgY9PJRmUbjIR8IzT5U6a4KDOzCUI+akWSkchJ9EIU8voqGr76pBlcbJCKlWGaRfYcu
	TW377bqPrV9BOt2lxkqQs++1DMlTmF6dGoy/nTDPD4o7tIFsZ967kRtK3wV6dGaNxj6Js3ozA+/
	nVJl994J2cd3QeMe8yucnqe+fqkpzSCwBjZCcKcvSGx0mchW61Ol9+BHC1zOjeJkjwF2DTsOW+s
	KPOLIvGayMYM5mtFQrVfe7TJa4TgDmBlT284uLwNr03+KvBlGqIOPvR+e1pp4SzFXCBE5VqIIJu
	AmTV2sKUpkd
X-Received: by 2002:a05:6820:310b:b0:6dd:40e5:3788 with SMTP id 006d021491bc7-6e09fafc51dmr4924556eaf.83.1791190655282;
        Mon, 05 Oct 2026 01:57:35 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e1b2e3664sm7670463fac.7.2026.10.05.01.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 01:57:34 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gen_init_cpio: stop parsing on lines with a missing argument list
Date: Mon,  5 Oct 2026 03:57:29 -0500
Message-Id: <20261005085729.872402-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a line in the cpio list consists of a file type followed only by
whitespace and no newline (e.g. "slink " as the last line of the file),
strtok(NULL, "\n") returns NULL. main() prints an error and sets ec, but
then carries on and passes the NULL args pointer to the type handler,
which hands it to sscanf() and crashes:

  AddressSanitizer: SEGV on unknown address 0x000000000000
    #4 __isoc99_sscanf
    #5 cpio_mkslink_line usr/gen_init_cpio.c:169

Break out of the loop as is already done for the other format error, so
that the error is reported and gen_init_cpio exits with a failure status.

Found by fuzzing gen_init_cpio built with ASan/UBSan.

Reproducer:
  printf 'slink ' > list && usr/gen_init_cpio list

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: Claude:claude-opus-5-5 ASan UBSan
Signed-off-by: lzhan011 <lzsx618@gmail.com>
---
 usr/gen_init_cpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/usr/gen_init_cpio.c b/usr/gen_init_cpio.c
index b7296edc6..0f0c61ec2 100644
--- a/usr/gen_init_cpio.c
+++ b/usr/gen_init_cpio.c
@@ -756,6 +756,7 @@ int main (int argc, char *argv[])
 				"ERROR: incorrect format, newline required line %d: '%s'\n",
 				line_nr, line);
 			ec = -1;
+			break;
 		}
 
 		for (type_idx = 0; file_handler_table[type_idx].type; type_idx++) {
-- 
2.34.1

