Received: from mail-lr2-f9.google.com (mail-lr2-f9.google.com [74.125.230.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9013C8716
	for <linux-kbuild@vger.kernel.org>; Mon, 28 Sep 2026 23:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790639250; cv=pass; b=JZxICt9PHS95xNE0deStUulxxvdCjhNft4fFAlv5FOEQZehmu0GIxFDFn8QbOxLPcJHSzwCJXfhx3stNaKh0gcsvS9tO8ety8Wi87iyXWAC4ql5I7EtV02hu+NoT+za5ov7MvqHx4SZhw5KKG24lkESdSv+RM4E8Z6eQGrQ+pHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790639250; c=relaxed/simple;
	bh=+snkxebuBNXBZk04SdC0odseMNd9Wiypwa8wfMsQQyM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=AhuOAry7YiQtfJM2NoPL2Ic5DiMj8BSR1GFzTM9aOTXTso9okIxfcipZNLOU01SSYOTkVHyS63BU49JAlsDKAn79ITkwBWOcb3lyXLvhojyC7qwCQc2g57gLjqO5NJYHEMZbb1sDQpYZga+8TY+IOYHZ5l3gl2PFLOwTuQfK78U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BAftoYlQ; arc=pass smtp.client-ip=74.125.230.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BAftoYlQ"
Received: by mail-lr2-f9.google.com with SMTP id 38308e7fff4ca-3a658f67032so20073261fa.0
        for <linux-kbuild@vger.kernel.org>; Mon, 28 Sep 2026 16:47:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790639247; cv=none;
        d=google.com; s=arc-20260327;
        b=dx0Jk5Qx1ccXeZVUrucAbme4E36GmU10MlRyJyezcaJzW8abxC/AIxAULkZSFcviRv
         XQJhV8I9aeeifer+DlKlu+kQ97usZNRQifhhOuxpT3F6J6EVfchcaSMnA4L3Mxx2k42Z
         hYUBgGg8Ww0xTm214/ooTE3wNaoq34D8yBeJS/HpgiI6uBki9Sw5bWkRVSHbtwtXmHBr
         aomPjwHRqw4n3mqWEOtluth3NuUvq/d3suF9Eq/sXpbmSHL8xoiCWkBrt4NhNhcKS9Yg
         EmPTg0n4AjYAFw+gs6CjlilHbrrFl/fHfysRRcOlD1Ni9pRfc4etOu5lUkE2B6etCCEq
         ZrwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=BXFiB3UkXw4qeBR2wwwf1ZyTmNaVLsDH7LkQypp5lJ8=;
        fh=4xQUl3/UigHeqgxefcun0Ntgfov24d0nMmQVUlObZQU=;
        b=PRMAqHkq/gImMASLOhiFwuahgWfSbz55pEmIUftlVgAbqszI0r8Fb6cFtylaV6JASw
         SM/MoBfoHZE6L4B0tB3bbBSuxzazKDHzJ1j365/Py49DVihFrQyHapQQC1m4BaMI9FhR
         qs8n19kJjcF6d9Ru5MPXZVnMXhBe1aUaCFI+LRTMLKmP/FxUDiRx4mDgcP+vtfqQ+f8I
         dmjMI9n8ep6hY9zHeuiCycXHbGfXUqzx3VD90cVScPZ5yNq2FaSUJ/BApkGhGOiDEwDE
         Rv4BaXOdF9i1EMjeZswMXIDhRolKce+GGuEPP+hwZsgCjaVGFfOrQEKft7cAyRtqEoGJ
         cs+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790639247; x=1791244047; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BXFiB3UkXw4qeBR2wwwf1ZyTmNaVLsDH7LkQypp5lJ8=;
        b=BAftoYlQXinmB7oaOmQSiNvjFXHHVCUcaXCQIxoH0odzYq7GNnaj1E1O8pxVIu4B2r
         t0DNLhFyChQdAYur2YlVjKjhve+E8asAQNAst46g6ywVozsHY1g6hV7FpC7BJkfQqxCG
         kOpVClNeBd1JJ0cEIP9mSgrxeG0SYEAUud4AZ7/7yffPcnuVgHawESbM5vWUvsIG6ROs
         LPN0Ddqae52tt/wIc8RJiHTV6y/ERdpD/pLksRwLfacEnVdrQ3zWCvQqlAgrAUaW2NPf
         nqcTswyJH61ygdpjFk1FDk5nsPTVfK4oypo+HQYu60CaMVD1czEpowhNtdF8LDnnYNmF
         hJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790639247; x=1791244047;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BXFiB3UkXw4qeBR2wwwf1ZyTmNaVLsDH7LkQypp5lJ8=;
        b=1zHzt50BNur0HMrTlmjx5QgNQhQT0rmP9T8CW7/YaSa7YunpMJI8CpcQ6C3MvkaHsU
         FcklCgRmnbnPMq4LAbFxCYxcshgsO0pQKzjOaT/Krw9p8eYTMZhGurTCC1/NEiqNqnEJ
         dbJ4bOBLg2M7nP5WTdQlCQRXvctQaT0OsKhYohjX2Xz9GJ0kMlJ4L0Nd2X1tE6OMTXET
         TIAMLX+sGOjNAvqYFaF4beC8cJtXj4sicJslSd+TcWTWAOhbp14rS8Sknpb/xiPKGquA
         1O20m1vj4OldEo0R1QjK5Kq3vz9mqnJcu5E1VaGVqyBRAr8va+iWWTterD4qrwXsayTD
         TroA==
X-Forwarded-Encrypted: i=1; AKwUvBy+Gs3cySgsCOOZ2I0ceq/MAcyJ/m7VK2cA76+oi5/Sv0qXrBZzZjvsq37I8H/GpBaZxk67BK7jGNJtHJY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzGiZmXMOiPOqKknKdMJrU2KS58A6BCm3jR/O/l9ZNuhFLwTyt
	Jpb4uBZj3kz+IrcGuihnYE+6c7nuJTV151rK5NPOhOE4imTs+GuVj3ixSyIvhdItWvQTXo1je7i
	l/THU4bJYotXqdwmlWY312OW4mFw7sOw=
X-Gm-Gg: AYBFou3Z8tWkDqBOR0UTXe74vsQwDgNBahT3KsHr7kSFyIzDQQVzGvjEZFGrC3nAgKh
	JlWMKkwbZWUuOhkbKU7cz2mzQkINEm8nI6t3iaGr7YUTab0ZuFdNWm2ExUHqVIJVJ6iNmhwxTfc
	xcBt88JRzbqFFlw3aP4rkmDUpIs3o5IHAx8wq+ZEXDzwUraL9iSdPF+vvxqGiqbSZzRPeb7VkRG
	r5VumLcrVD5ucgf9HD7CvB0QOwzvu3Dy2OJ1Xo2LJdpTyIulXJ1MgECLh0H+MKMCRdQWLJoLo4j
	O7ua0Ky3Bw0GOPQzKjAbzBZ3bbqHeRqIdqIdqduGpkz2cbYiTIWeTKoUr/VcN7k7C0WBpgu/mRm
	A7F4sZhmYF1ShFy62Z1zwpMvLdKKsYyoLAzolKK1xhwqWUbSkiamx+I7AkKQZG+XkRmGTlIs=
X-Received: by 2002:a2e:bea8:0:b0:3a5:f041:d7cd with SMTP id
 38308e7fff4ca-3a63c311438mr33950311fa.26.1790639246649; Mon, 28 Sep 2026
 16:47:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: omer zalman <omerzalman42@gmail.com>
Date: Mon, 28 Sep 2026 19:47:14 -0400
X-Gm-Features: AclHuK8FsT1Ec-f58jqhX1xRKXeOuLhZ2Q1xSCkGZJLLJldZLmmUEge1BcznI7o
Message-ID: <CAGLNFZeLTDhLj5bzOVC51J6Az6E1D9PWj6yzgHZO8Rg-82kpHw@mail.gmail.com>
Subject: [PATCH] scripts: run-clang-tools: import os for broken pipe handling
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000037de8a065c93b028"

--00000000000037de8a065c93b028
Content-Type: text/plain; charset="UTF-8"

The BrokenPipeError handler calls os.open() and os.dup2(), but the
module never imports os. A broken output pipe therefore raises
NameError while handling the original error. Import os so the
handler can redirect stdout and exit as intended.

Signed-off-by: Omer Zalman <omerzalman42@gmail.com>

The exact git-format-patch file is attached because Gmail's web
composer removes tabs from inline diffs.

--00000000000037de8a065c93b028
Content-Type: application/octet-stream; 
	name="05-run-clang-tools-broken-pipe.patch"
Content-Disposition: attachment; 
	filename="05-run-clang-tools-broken-pipe.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mulwd76t0>
X-Attachment-Id: f_mulwd76t0

RnJvbSBkZjVhZjRkYjAyYWE5Njc4YjEwNmYwMjc0OTEzZmIwYjE4YzBjY2U2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbWVyIFphbG1hbiA8b21lcnphbG1hbjQyQGdtYWlsLmNvbT4K
RGF0ZTogU3VuLCAyNyBTZXAgMjAyNiAwODo0MToxMCAtMDQwMApTdWJqZWN0OiBbUEFUQ0hdIHNj
cmlwdHM6IHJ1bi1jbGFuZy10b29sczogaW1wb3J0IG9zIGZvciBicm9rZW4gcGlwZSBoYW5kbGlu
ZwpUbzogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPgpDYzogTmljb2xhcyBT
Y2hpZXIgPG5zY0BrZXJuZWwub3JnPiwgbGx2bUBsaXN0cy5saW51eC5kZXYsIGxpbnV4LWtidWls
ZEB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKCkZyb206IE9t
ZXIgWmFsbWFuIDxvbWVyemFsbWFuNDJAZ21haWwuY29tPgoKVGhlIEJyb2tlblBpcGVFcnJvciBo
YW5kbGVyIGNhbGxzIG9zLm9wZW4oKSBhbmQgb3MuZHVwMigpLCBidXQgdGhlCm1vZHVsZSBuZXZl
ciBpbXBvcnRzIG9zLiBBIGJyb2tlbiBvdXRwdXQgcGlwZSB0aGVyZWZvcmUgcmFpc2VzCk5hbWVF
cnJvciB3aGlsZSBoYW5kbGluZyB0aGUgb3JpZ2luYWwgZXJyb3IuIEltcG9ydCBvcyBzbyB0aGUK
aGFuZGxlciBjYW4gcmVkaXJlY3Qgc3Rkb3V0IGFuZCBleGl0IGFzIGludGVuZGVkLgoKU2lnbmVk
LW9mZi1ieTogT21lciBaYWxtYW4gPG9tZXJ6YWxtYW40MkBnbWFpbC5jb20+Ci0tLQogc2NyaXB0
cy9jbGFuZy10b29scy9ydW4tY2xhbmctdG9vbHMucHkgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3NjcmlwdHMvY2xhbmctdG9vbHMvcnVuLWNsYW5n
LXRvb2xzLnB5IGIvc2NyaXB0cy9jbGFuZy10b29scy9ydW4tY2xhbmctdG9vbHMucHkKaW5kZXgg
ZTc4YmU4Mi4uNzlkNThiMyAxMDA2NDQKLS0tIGEvc2NyaXB0cy9jbGFuZy10b29scy9ydW4tY2xh
bmctdG9vbHMucHkKKysrIGIvc2NyaXB0cy9jbGFuZy10b29scy9ydW4tY2xhbmctdG9vbHMucHkK
QEAgLTEyLDYgKzEyLDcgQEAgY29tcGlsZV9jb21tYW5kcy5qc29uLgogaW1wb3J0IGFyZ3BhcnNl
CiBpbXBvcnQganNvbgogaW1wb3J0IG11bHRpcHJvY2Vzc2luZworaW1wb3J0IG9zCiBpbXBvcnQg
c3VicHJvY2VzcwogaW1wb3J0IHN5cwogCg==
--00000000000037de8a065c93b028--
