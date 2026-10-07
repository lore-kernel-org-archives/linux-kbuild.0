Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AA6392821
	for <linux-kbuild@vger.kernel.org>; Wed,  7 Oct 2026 08:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362657; cv=pass; b=f/cTIu/zil6+B3fWOJdkoCEk3Ksc+C+AEsp86YUXkURGJhO0Xmq0rjYhMR1uFjRDTh5oMQWGMb2kMYHErBJ0oFOD1FAv/TFD5/cmZEle0sP9SD56LGQ8Vpbj9qGXNk1I5rCc5aztj/fKom2RRV6M464zBsWBuhksgxE09684v2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362657; c=relaxed/simple;
	bh=ShHUO7mPTrqlSS4cXnMvGeM4pkz1AlNdBLozhKe9y5E=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=uIK1sdIlmAHKuSlOHexpGTkZXwrUpppHBw/O8l0Ud22l6Pl163cGq3CdVirZaKvUUOX8Smpo5SwFCYrD6VmJ2KYtkyI9cJF0/l9bUgR8o+xPdz+mDUwfYzEldk6XG/VTAP/hw7Jh0rdP0LDWyKci0QtwEPTKTXuyXqzrYKj8Hms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQlUnKmv; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQlUnKmv"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5337fb43c16so15576171cf.3
        for <linux-kbuild@vger.kernel.org>; Wed, 07 Oct 2026 01:44:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791362655; cv=none;
        d=google.com; s=arc-20260327;
        b=qO4vQPXQ18xS7+pBue5EUz046w2xVX+qXNDddYuzojU9vP71dKKvhx3elUiglzb3Aa
         lCXueulvslUTWn7qqkzQW46ladG7JT/4/cmGRaw+sIDnb2bVxfYp55/GXd6H2wfpwTkK
         ZqSHjbSrwiZLMPlmiW8ga6j4Ft9fmgqLJHY22Qt5IylpcsWE7epta8ma8yHof0FSXC5L
         5Un8XxjD2AGD+JXV5wSpUi0prV14Dd25+3F5odTd6SuHYSEYlJEMY/P/XFtphJkPXgWU
         F9l+cQC78S1p9BxarYh258pRLwZQSCc/0mHY0cnIyff1x7Jvb3dV9sM7XEC7I5rm3aVQ
         9oow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=UQHkn3xShl+rCSGZ+dRdU7pRSbW50bIYa4iEZV1gMbo=;
        fh=tXbyBSyZ2b8XCyYidy6fFl0rOauu+H5LL9jf7/xajqo=;
        b=CH6vsw0ENXvEUsbhgHv6vzWhG1ELQeBFpzjOs+A0o8z+S8QYLzlU3Frn29HPb12dfH
         RkOnr3ThGlBVbal9DQK9KiFV7lzHK0qSe87q0JTqLVkwv3+MZOzxUwVTMoHmNF2MwrMb
         S+ALL7xh7t8Pa5vCDZEB+N9vBCvkZyJFIKN++9gceQ9iCVSe4jiBKHh2FXDoF3O5lNbl
         2EI7EuH95X9VIm3XOf1oLQT9V3Z9jT6Np7DAhGkBDZ7M1Y2+pD69TzNtFRT4PXgp2vIt
         GsmQotrYdzwZoeSBorGLGPSqMdnsmOS9jhkGqjhChric3Hq+fH28mpYKiuBlKETtQuEG
         pdBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791362655; x=1791967455; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UQHkn3xShl+rCSGZ+dRdU7pRSbW50bIYa4iEZV1gMbo=;
        b=MQlUnKmvb658lGt/htuFe9ydDaAsJ9BgktphEkMFGe+9WN/9EHwev9w2I39f2mAHmD
         hsgE6R4vWibDhFdZrAOyj7fzgYeg4uWOb1r7oT+BcgnJRnSjUstAC8q0WBduLyCa+j08
         WU5/27wLM3lXKfS4pDtFS0ZSdXBKN+HKSZlyCt2kUkGp3zBu1NYR7Kv3CGr3FjgWWntG
         yl5STvbaOvJQXun5a0PQwIEdFwsNJoqgxEZKvXDYFMBlqhGJu3sDMyOTECNKQ3MIa4r0
         F2wIqf3WOpfcYTux3pYAUuX2uRtbyX8Ksq85Pttmbvhv9xVGYGeJi4oXKA0ivZvL0qHP
         MC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362655; x=1791967455;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UQHkn3xShl+rCSGZ+dRdU7pRSbW50bIYa4iEZV1gMbo=;
        b=pucZb4YRcUQzVWNhgccFvrbl7+tm8099dSRZECjCfHKYQIiibanjiRW7haoZT8lWgE
         CqbFMqzV0V/w8UhxVKwzdaArNAQ3lMRsPl/CHya1Hi6pzoX3G9qslA1FSECLfH+yIxfX
         2hvzYVlYn6ujASpb7+9fScZ7l3USf4f5pLCeBWOCbAb406zKEEPlJtIcwC3C8cC3wZ2Z
         XUS7BcfyicIl95bBk9dFpjeNrD4RbdsFMFa+PTMoQ4/LvLdLizQvhJ2id/8AlOSZrNc8
         gwxC68KtN0SQcY31FtDWcH2Lsns3SSO0YUTVLoPhmV7VOq1w+jHryWmXVNyO32oMoTLE
         qEpg==
X-Gm-Message-State: AFuF++kXD6cRj7/nwg9EbT1uPgSmTrxJ3FkYAgoZwQXjVY2okTxtO34H
	p2pVqlLKKpfrvfOvTokJnsJdmUIpF7XJ5fQhGYNfnJY5bV2YklkCkRDY9IqmkqvuukEbqz+JYvl
	yktIUOCefSdOMfGJlaB328y8PjgLhJFs=
X-Gm-Gg: AYBFou1Mr7QkXnzt6CysQ7Hy5VxwuVffBKVKzBdAxzk/b44w6zf52h7bHJFufL2F/NW
	apLyxEylpPKISPry5UFTZT9Y++1FixnZhHmTsj1PggPovmdEoiIOgSYdgT7qvjcd/HatEHL9/yW
	w/C004LSbzGq9xYvlMH00TLHeDaiTG7mncVBC7IAFJV7wLgT7lUBQ4ncxvAl6isaCj+o1dYBBUP
	WT1TZXhFYar5nH1A1ZHssQXcOXppGvcD5vIXXAsoS+15ZD0uMx/vqsig3pDaIRCmwlqkqkE/cv/
	ZrucgJ47TQyEQKQmP2zETIchy8Rm7LIjxXE3oFa0X1tWimtQfJ48IZj1HbVT/pHtTimbyZY+X3i
	8Z9lOwcMrA8WfdGrBQCe4oycfMm8gxWkCFhc6QBXYgqpPdvt1e4BK8dajJSAMACpJTSy+lQmc7d
	54e0xvuPL7yMwfx3Q5pTVf++rH6iSMZ9ozqZqT41S7GnB1+z8ICAxYrdC7s+1RFvv+P7TUdBZus
	GSv
X-Received: by 2002:a05:622a:1806:b0:535:70c4:9a96 with SMTP id
 d75a77b69052e-535757e25b0mr24745931cf.76.1791362654939; Wed, 07 Oct 2026
 01:44:14 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 7 Oct 2026 03:44:13 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 7 Oct 2026 03:44:13 -0500
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Ting-Han Hou <ue081723@gmail.com>
Date: Wed, 7 Oct 2026 03:44:13 -0500
X-Gm-Features: AclHuK9fTQbtyZxD3wrfJLJ_jHQiU4Fw4p6ZmXpfoAwI_aLMJpQmgaQ1fIuWgfM
Message-ID: <CA+NtrhQqXgjT+4eg6W4P94Hc=DqdV3gQXz3EKKCxWvdWzfND6A@mail.gmail.com>
Subject: [PATCH] checkkconfigsymbols.py: Parse Git status output line by line
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ting-Han Hou <ue081723@gmail.com>

tree_is_dirty() iterates over the string returned by execute() one
character at a time. Its status check therefore examines filenames as
well as the two status columns.

An otherwise clean tree containing an untracked README is reported as
dirty because its name contains letters matched by [URMADC]. This
prevents --commit and --diff from running, whereas an untracked
notes.txt does not trigger the check.

Split the output into lines before examining the two status columns so
that filenames do not affect the dirty-tree check.

Fixes: b1a3f243485f ("checkkconfigsymbols.py: make it Git aware")
Assisted-by: LLM
Signed-off-by: Ting-Han Hou <ue081723@gmail.com>
---
 scripts/checkkconfigsymbols.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
index 36c920e71..9f7aed98d 100755
--- a/scripts/checkkconfigsymbols.py
+++ b/scripts/checkkconfigsymbols.py
@@ -245,7 +245,7 @@ def tree_is_dirty():
     """Return true if the current working tree is dirty (i.e., if any file has
     been added, deleted, modified, renamed or copied but not committed)."""
     stdout = execute(["git", "status", "--porcelain"])
-    for line in stdout:
+    for line in stdout.splitlines():
         if re.findall(r"[URMADC]{1}", line[:2]):
             return True
     return False
