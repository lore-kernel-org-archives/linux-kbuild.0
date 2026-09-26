Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7792C2652A2
	for <linux-kbuild@vger.kernel.org>; Sat, 26 Sep 2026 00:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790383955; cv=pass; b=qH/GCKV6Zu64bc8H+gUW995R6CAIjgAuq844rNGGTFtjjTLZMaVMLV0dBOTubmM7pATwbBP6Yx2MwH6fqpy7How8pENTEGI+rzTO6FXWGoc/7l+XABMNgm+rLvsQ9Ps/6foElAwMhOa6S6J3WLYggfu5o8BaJHWa/AjOEUjJiHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790383955; c=relaxed/simple;
	bh=cxL8RY8wdmdsnxOD6Ni6qWQL/8tWTp4bkAuJvPRW6kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kr0aPt1laCK+eI9oCAQdC4TkZJctWxLXJw9GbJfo42iHpGMnUYacO2kuj5Oz/jvbJAAheaIVUjJan8lv7kW18UE+yeKHAAn+3Pym5XGirH6WBiSeZdweZR8S9a4CcOCoo8eseMnB2/CssNAsL96cg40ERoOHoMe6q1HDXYjEYCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SyHT+b62; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SyHT+b62"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb769ca17so12901481cf.2
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Sep 2026 17:52:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790383953; cv=none;
        d=google.com; s=arc-20260327;
        b=JjDiTgm+JyzB1/XutWk1J5ai5F5hUquI7pNN3R54fEMbPXT6YKsFMCuWd9Lh+0lvF8
         vhG1wu9AsbM67AViE2wj20+iSipHgL2VKXTRboVa8Pqu5BZZKWk5maPnsynsdCm996f4
         YRD1j5G1zRZxO+kVpogHaRgKIzP066089Xt+jvmeivfWB/BOrL4KSAQMtW8fLgRLpi7M
         wCAht11+vl5eLbTyMN8nR1nmnCz+0mT1WzTTt+vC1eNQjv3LEzF06lIJRpgZkmsFpTgI
         7tYS2xy3HMstZncldFSU5yGOR002OovH/PMp9eUacn1D5ZKwvjClcBKn9VqeD4QuXoJw
         IaBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CSw04M5idaSqtHaCGqtANMLgl+u3nq3EJIWnJJPoynw=;
        fh=JMGVOwUo9gRkmW59ld4y9o03XDddgvg41bIECJt6JNo=;
        b=qF4Ty/ncJUMde8nunge1ATAyz4yTlW9r0tfbJlCDqu9IPcIDuELvvVvE5iqvl5fcJa
         VB8vpzTM6jvf/q4IEro50r8IohFSVr36YWOV+ktuvUIiX2+v0T4hl2DHv1Nt705EjB/K
         96xu0VJr5PEnQTc7VzBUoIf7ugakVjbDVjosck8iQU1Ho6NrK2laNCeQQn08mo0Ce4ln
         ETn2pWsAfubTNCaGNeJfY10ljfISL+A5MM9szCR5FFQJiX0HEs/cug9DCHGd+7ylZ3SO
         hSvyhn1lp3FLu3+5hblBR8i5yEZfYBFzesLZmEEPhyqSip0QS9KOqkJO5vkozQ/1y5sN
         hegw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790383953; x=1790988753; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSw04M5idaSqtHaCGqtANMLgl+u3nq3EJIWnJJPoynw=;
        b=SyHT+b62yEl5GBC7zQ8CeA3RKlLUvz6rNoSx0R5fXC0fi+KQgVpgqmZCHXQfNpprIU
         LAn8zFD76t71h4G9vu6BiFr5uq/8y5SJ9SVrQOi+6XRf9eKJ3KFg/c7E6jPrK/sULkgf
         IoEZav2HnGXatHzyXEmDD8VHnukJsXRoh24GwyzPhaW3JWXGwlBJ2ktOK5UsBmTaZehe
         tWuSW82rFpKamQsUIh7VNlB+aqXJ0ecnayEMxhNiRxsOkSrEwkTbDFBpJFwYcwbc9kBl
         UH2WWoaf3nA+GdBQeYRsoCROI5S66E8b03Ymi1Xxh5Z6bWneN77562MfluCAh4zIpJ0D
         /aYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790383953; x=1790988753;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CSw04M5idaSqtHaCGqtANMLgl+u3nq3EJIWnJJPoynw=;
        b=dohhr0itWRbA90QH7tQAIErIZMUBmcqHH1GvjTqevKtSTWKdWrecRt/Ur2VwWF9CeN
         hnicQZJh9CzBS5fhrdutUmkJ8rJ68QiIhwVov/FS8Qnn5YQrHi0gUTrd1B9VSc5iqkH+
         jpMBSBX8y4Ls5cv16cS5a8S5m0seIVzrIfhOPN4Lw4s4xpI10ieRfE02+sUo4T5qmu8o
         rUxMvdMaDToOid1PQPk7FCS8zNMK6fNQIOh4D2o0X6OS3PF4qYM7zsncIJNJQuDLYDAH
         IG5Y3v7ipBl3RYBEKsq3xiaeukmPXpiGySuIaS0HWIpxD1mJtAqbAFHzVyjLNL2sUZQV
         HMDA==
X-Forwarded-Encrypted: i=1; AKwUvBx2n2of93iio8Sr8hLQAX9DDnxwuZPUEnEAiOI8idjX2KbdTUobLVIPqTsqcrvfX3Cnf87pzY4Hl+xm3NY=@vger.kernel.org
X-Gm-Message-State: AFuF++mC5dzALtHJDlxtqlfJUQOn5zWuJzpEbG287JJejuC+6XnNZJmr
	6WLwN+XOmHl6ZzFyQs3yvO9LStYZNNcYzUw3iE9HpPWyrgDdljiep7EYc+zo0roryso+DAtn1l1
	4aD2gV7yOwODhPmKLxUNdaKTmUft1p24=
X-Gm-Gg: AYBFou3YG3oSarYMxEsNprxKmHg5WKn/FcGxF/iGriurVFYHfsQ4I15DSLRMs07pci1
	V290zxzqlSH/EUlmKtBT+Rt8pfIj3RgEAy4n4ZHzbRVqEWew7KB8xofmpUe1z64EFDowYrt052M
	g7MXom/07METR4ybTNFpG0WmixCTdDtbb8u0iAsPOp5AoMImF9WLu4Zea88XhU5DJaENgVq/3Vh
	e7lT5zmCkJSigRBvpfxsXxvifxD/USVQsDs58Qj0PbXRjn44yyQJoePZJ4z6iU7/PgfRBN6zmGH
	uNvKqp2pizo42TWq60u+jRPX4DBi+oTiDtxC3eb6/VV5l9R/iQXnfvyT3iJHaM/sbSZRXCrYQqa
	iw9NuhPh+wBh5v7vL9gZ2dQ0sgckw1+Gy7+8RQup1AB8gb/2w9aSuz4sYP9j+z3t9UqxOc0zA8B
	Fk7Sb63ZTX72ZnVnq3YADh6OYF4NA37oudeQVRuerhpjda/FMqHW45Db/4deuTHq88zbBpEYEOV
	v84jT0jusOb5X7mfzaZBYM=
X-Received: by 2002:a05:622a:1818:b0:533:a4a:8826 with SMTP id
 d75a77b69052e-5330b5eed0emr80806541cf.19.1790383953335; Fri, 25 Sep 2026
 17:52:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <179017337986.52388.7943687183785012868@gmail.com> <179037565553.3985470.12035061965740287126.b4-reply@b4>
In-Reply-To: <179037565553.3985470.12035061965740287126.b4-reply@b4>
From: =?UTF-8?B?MTTkvq/lu7fnv7A=?= <ue081723@gmail.com>
Date: Sat, 26 Sep 2026 08:52:24 +0800
X-Gm-Features: AclHuK9Ua7kqnIr5kUYr-Cnfwv_MkcNfJmZDDmk3ND4mcEnL1T_GfZSWuwa6lP0
Message-ID: <CA+NtrhRdnuZOOFpBXvnfOXFs-HA8q+2sLvR0BxH=BjzVAEZBzw@mail.gmail.com>
Subject: [PATCH] clang-tools: Import os for broken pipe handling
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Ting-Han Hou <ue081723@gmail.com>

The BrokenPipeError handler in run-clang-tools.py calls os.open() and
os.dup2() without importing os. If this handler is reached, it raises
NameError instead of redirecting stdout and exiting with status 1.

Import os so the handler can work as intended.

Fixes: 87c7ee67deb7 ("scripts: handle BrokenPipeError for python scripts")
Assisted-by: LLM
Signed-off-by: Ting-Han Hou <ue081723@gmail.com>
---
 scripts/clang-tools/run-clang-tools.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/clang-tools/run-clang-tools.py
b/scripts/clang-tools/run-clang-tools.py
index e78be82..79d58b3 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -12,6 +12,7 @@ compile_commands.json.
 import argparse
 import json
 import multiprocessing
+import os
 import subprocess
 import sys


base-commit: fe2ec83746e501645709761605c2464a44fd2929
-- 
2.52.0.windows.1
