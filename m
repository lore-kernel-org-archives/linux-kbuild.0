Received: from mail-lr2-f9.google.com (mail-lr2-f9.google.com [74.125.230.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7543D3B38B9
	for <linux-kbuild@vger.kernel.org>; Mon, 28 Sep 2026 23:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790639186; cv=pass; b=Q5Dl5QK/vhXRKTNKGnxj0KNlI31jJHWhQkK066GgeWaAoEV+1zmqXc4SqNUrfW1RT7EPG47MQsgMaOvYzJMPgyTJlitCImG5/BHAOPc2UrD7HeIogqwdpJmTVB9vr74SnpwL3QaGa8FKsxOoiR2bZDK5YHo628xPr6knV3OzBb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790639186; c=relaxed/simple;
	bh=hNIG1O9b63uQZMDwp54n4u8BYZPfc6xLK2wlOe6uGrY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=U92IHr3i1bCBQesvP5nx9x7YhzuT6nzqdADHy7Q7rvJLyPvYizeDRXiIJ2cIR52JgyXS8LonOoeo3aO1JaP8t0Qt8eD2vVsF6i8HvaOxXnAhJXW4FKXgKJYf0xvjxQ16klOFBW0EotTURfPyb7C01WWkgNmCwZ+omX0/IotW3O4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsRu7IWE; arc=pass smtp.client-ip=74.125.230.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsRu7IWE"
Received: by mail-lr2-f9.google.com with SMTP id 38308e7fff4ca-3a658f67032so20069011fa.0
        for <linux-kbuild@vger.kernel.org>; Mon, 28 Sep 2026 16:46:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790639183; cv=none;
        d=google.com; s=arc-20260327;
        b=CorpaQ+22cC8P5r3VqcFmNlYO5Vgj97Hhm2JxDNwOvBXivGuwwUAciNCfv/0eiwzw0
         fea3dAb1NvoctF3j7278s4TAUMvGCGwk2ejvvzFsndHsqxcATaTGDFKjracTV1aP/75G
         R4z/Ml6DSk0yBlfETK2kJ+5ZWHnjaX0plS+xpgHGY2pMITm5XEbb5wRss6MyTzm+vj9R
         u6WXUnpHX890yePQPErGV0LLoVay/0t5MvtMcp7VzRlJloLLVNsxhZ5UNVpDeBx2zIYH
         2xRfXaYu5Kymd1WTmsOe2cUXYnV+37S58h2/pcLmHULfAIydTWKkWUAEqokYguoiodDw
         X9Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=CMxKgsjn1fg7B3Ca3OwqQwP+r38CuhXvirJYtgLgTps=;
        fh=IIq2NihYZghK12SzME+CCyyWbyhWKQzrGI0FVnjOG7k=;
        b=cMlrdetFGwalZxNKwrlbh/xp0Q6BEwKfpLND7cRDlQH/CQM5Oomf0K2lqir+JcRp7e
         zGGbXvlhN+2V7W3F5Y731AWLm7XN/+69WnxHoLEAYu2slr+Q6eXKSBqKdWKmRQ7qPwjx
         t1z0b8WTsc3P9C6RXKIukIgB4t8Yr12t1ar9X9I9bmq35chcbyxumfG2y9kEFxmRP/BW
         XmW6kHyefn1wI+skWn8KcEXtQ+yJd/rlWiPmuPUQ2sdsWwqcafjyhCyG03PYeZ2DclWn
         2kqjpgOzwAfh2hiCdcNgTR0fNXpctCW/YPDXv4qAS51d22GHY315diNK7ah13aShX1JB
         xWIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790639183; x=1791243983; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CMxKgsjn1fg7B3Ca3OwqQwP+r38CuhXvirJYtgLgTps=;
        b=BsRu7IWETdmRiFB6zz9BYyghzpifDYQzL2gUoPqu35oPOfiZi8M6djyjNRI7huAkdu
         FRaIA5JDfgFVYbpdIAlGh4PtiHCylP8jID2Yq37e4NUdAoNgEIRfSbfur8EbYTj/f6tL
         JYRZK0CufAYQ4zvLT3MmfzwKQ05dvcaJ3z70V0+/s8lF4m9+7IqeCN3hQnQ3YaSdLbLC
         26tsEQpS2kWPcmgmy+813wKTWqe9ibGGrzXBvv7FHBmnr2PNLj4YK4jazCH3wFS4nJgZ
         SmnIPfsjaHUp/upIYh4X2Tk6HgVR2mrnQiOIPxZOmQVmDB0iJRgS1ObUXALXxpvOAqam
         XjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790639183; x=1791243983;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CMxKgsjn1fg7B3Ca3OwqQwP+r38CuhXvirJYtgLgTps=;
        b=HxXcFJ0xyur9RS+7YPUGxOas+g3CXawd9VhZsqn9nzu/YkeD7gFPJkrU6TwVSkks4m
         2CFBrbBgwc53s9RyQ/QzutPmaEmaatdHNLGjaejI7WfJM/nousx3cDJicfeUjkDLXIWR
         VQTkcFf4dF3wHlIV8o7qY8FgphFOi9RYEl164M7xxQCgPZzrs/C7PLjxWbjtDzwBk+ZN
         Oog9+JyvmSKOb1atmcPGz5iCYCDGrZ3hMMvMJ+izVNzAPK7tnJhSZGCVVM5CqD2jT5TW
         1hC63iRpqO3mP0l8zL1dezJwfw9/BGMzicSjsDBPkPHaoUaE6hOFtHthZ5P6wH1QhilB
         87Tw==
X-Forwarded-Encrypted: i=1; AKwUvByYp9S+TSgcirBXGMOO7fzckGgKExM5F6VdDaFGiJpWEpuCOplQNtBBLSoWc2TZQpFgtaxF2KoHbs3jz3A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoDvfJt1rC9TJUdyGl7fVNR56xN9gmMvWz9JXNB8yU6S1EZiFL
	bBsNlrxlHhMFVSzD+kLIGSVdxT7avyfVnR8kGq+QSkexsQr1CwxPHxJ9qHzYlYKnjS544heLnYy
	5+LTMFKN0Ei0/kx3JmatB2fBsf64zDh8=
X-Gm-Gg: AYBFou2+ks/TSyoGs3wqDw9Qa7jHaKg7YK7MGmbFyiQ/PshIXNthqRV6avEp+hWjUxb
	e8pc0SNZTaQyo1NuWItq53QBscVaa5oBh5hUKIWzj3Qs9NBzzs+8hYmMMeUaY+ZZOujHdJMoYz2
	WeDtgl98gM9wGnkQ5DSC3gihE4CDJ5vm3HaLRani9QWbE37nf3qbDI2cIv591ZLAZU90m6ijFdd
	nY2iyZOVjF7/D/khdC1XCUdnU50uU9AIknLTFYAk0VOqppjQ9alCIY7Tjic17ho/u+9KehKh58T
	yWNWtWnptoaXgKRI+jlrWCFMtQa2qnM1dhjLUIInepjQaPDdFG/vLm2DmqvMIyhgHBWXzGHWajr
	ZvB8637ZSEAFY6j7ZHKXWt9ixeXEiI7CdOzizrofIk8nVOXsUSBf3/qpNsrzB6IbRIMcH+Wk=
X-Received: by 2002:a2e:be9f:0:b0:3a5:f041:d7c4 with SMTP id
 38308e7fff4ca-3a63c0f46admr39352421fa.17.1790639183488; Mon, 28 Sep 2026
 16:46:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: omer zalman <omerzalman42@gmail.com>
Date: Mon, 28 Sep 2026 19:46:11 -0400
X-Gm-Features: AclHuK_QFUDt0E9-fjXxsSQFCCr3a-hEiLPNvrKPEYlNc4wywi6m7hPtYcI0vtM
Message-ID: <CAGLNFZfd65P3C7wd=ShsG3BwVqx56-3FTXRARvFXVoXEJmj6Lg@mail.gmail.com>
Subject: [PATCH] scripts: gen_compile_commands: accept object file paths
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, ndesaulniers@google.com, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000740802065c93ac3a"

--000000000000740802065c93ac3a
Content-Type: text/plain; charset="UTF-8"

The command-line help lists *.o among supported path arguments,
but main() rejects every object path as an unknown file type. Map
an object path to its matching .cmd file so the documented input
produces a compile database entry.

Signed-off-by: Omer Zalman <omerzalman42@gmail.com>

The exact git-format-patch file is attached because Gmail's web
composer removes tabs from inline diffs.

--000000000000740802065c93ac3a
Content-Type: application/octet-stream; 
	name="04-compile-commands-object-input.patch"
Content-Disposition: attachment; 
	filename="04-compile-commands-object-input.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mulwblys0>
X-Attachment-Id: f_mulwblys0

RnJvbSBmOGRkY2EwYzMwMzk3OGEyNzMxNGM2MjMxY2ExMTliNmIyYzE2MGZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbWVyIFphbG1hbiA8b21lcnphbG1hbjQyQGdtYWlsLmNvbT4K
RGF0ZTogU3VuLCAyNyBTZXAgMjAyNiAwODo0MToxMCAtMDQwMApTdWJqZWN0OiBbUEFUQ0hdIHNj
cmlwdHM6IGdlbl9jb21waWxlX2NvbW1hbmRzOiBhY2NlcHQgb2JqZWN0IGZpbGUgcGF0aHMKVG86
IE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4KQ2M6IE5pY29sYXMgU2NoaWVy
IDxuc2NAa2VybmVsLm9yZz4sIE5pY2sgRGVzYXVsbmllcnMgPG5kZXNhdWxuaWVyc0Bnb29nbGUu
Y29tPiwgbGx2bUBsaXN0cy5saW51eC5kZXYsIGxpbnV4LWtidWlsZEB2Z2VyLmtlcm5lbC5vcmcs
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKCkZyb206IE9tZXIgWmFsbWFuIDxvbWVyemFs
bWFuNDJAZ21haWwuY29tPgoKVGhlIGNvbW1hbmQtbGluZSBoZWxwIGxpc3RzICoubyBhbW9uZyBz
dXBwb3J0ZWQgcGF0aCBhcmd1bWVudHMsCmJ1dCBtYWluKCkgcmVqZWN0cyBldmVyeSBvYmplY3Qg
cGF0aCBhcyBhbiB1bmtub3duIGZpbGUgdHlwZS4gTWFwCmFuIG9iamVjdCBwYXRoIHRvIGl0cyBt
YXRjaGluZyAuY21kIGZpbGUgc28gdGhlIGRvY3VtZW50ZWQgaW5wdXQKcHJvZHVjZXMgYSBjb21w
aWxlIGRhdGFiYXNlIGVudHJ5LgoKU2lnbmVkLW9mZi1ieTogT21lciBaYWxtYW4gPG9tZXJ6YWxt
YW40MkBnbWFpbC5jb20+Ci0tLQogc2NyaXB0cy9jbGFuZy10b29scy9nZW5fY29tcGlsZV9jb21t
YW5kcy5weSB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9zY3JpcHRzL2NsYW5nLXRvb2xzL2dlbl9jb21waWxlX2NvbW1hbmRzLnB5IGIvc2NyaXB0
cy9jbGFuZy10b29scy9nZW5fY29tcGlsZV9jb21tYW5kcy5weQppbmRleCA4ZDE0YjgxLi5kZWNm
ODI0IDEwMDY0NAotLS0gYS9zY3JpcHRzL2NsYW5nLXRvb2xzL2dlbl9jb21waWxlX2NvbW1hbmRz
LnB5CisrKyBiL3NjcmlwdHMvY2xhbmctdG9vbHMvZ2VuX2NvbXBpbGVfY29tbWFuZHMucHkKQEAg
LTIwMyw2ICsyMDMsOCBAQCBkZWYgbWFpbigpOgogICAgICAgICAgICAgY21kZmlsZXMgPSBjbWRm
aWxlc19pbl9kaXIocGF0aCkKICAgICAgICAgZWxpZiBvcy5wYXRoLmJhc2VuYW1lKHBhdGgpID09
ICdsaWJnY2MuYSc6CiAgICAgICAgICAgICBjbWRmaWxlcyA9IFtdCisgICAgICAgIGVsaWYgcGF0
aC5lbmRzd2l0aCgnLm8nKToKKyAgICAgICAgICAgIGNtZGZpbGVzID0gW3RvX2NtZGZpbGUocGF0
aCldCiAgICAgICAgIGVsaWYgcGF0aC5lbmRzd2l0aCgnLmEnKToKICAgICAgICAgICAgIGNtZGZp
bGVzID0gY21kZmlsZXNfZm9yX2EocGF0aCwgYXIpCiAgICAgICAgIGVsaWYgcGF0aC5lbmRzd2l0
aCgnbW9kdWxlcy5vcmRlcicpOgo=
--000000000000740802065c93ac3a--
