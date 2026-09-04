Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE553911B5;
	Fri,  4 Sep 2026 18:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788545983; cv=none; b=TpqsvXfvWssaCiZUaOXX87Q96hbqcGy0u+n5BnEt2c1TfG/7ytLPiYkeqYP5p/AErfAY22SHQ5da8NLCcwBS7C1uJrQDhW3hxYZ7MDo1WmIAL/elTyBJ2sQb4u7RN1Na/d+4kaowMP59gY3lIXd0atgtMVibgSGAVOYic8oCIhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788545983; c=relaxed/simple;
	bh=K67UAh45lnHiRxuKGWLeFyuTLdyFRfNm+f8uGnyvfx0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fxXgkAK/m3J5VmrzuTCFlKhJls5z7W7E7rYRkAsThdOTthCqUaRZmEVksKr0LxyrhflC5a8KGgsks5VUdyBLNvQRfQ3Fe85JAq2V/In2ac61Fzh6zbc+Mp5brTBvtNVouSC0JYubP8SHP8ATOYT4IcJPnH0F/ytwloiTBrXV0ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6ZJq9kI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6ZJq9kI"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E370B1F00A3D;
	Fri,  4 Sep 2026 18:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788545982;
	bh=62jm9Q77S2sVZx0JPQ7aMm4YDbqkZyG9GTqZdJ8kxUg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=a6ZJq9kIsIVCK6/Fjg8Td1RT85Fn0E0YjzWuzBazyUtqo1zVcL3MVaXQ2q6c/Izs7
	 8N1MB9R/SUGbQG+sCokn3qiLjKV0KKHn5sHpIsyGEhNwhI2MUOV8jyZqX5UsSpmnWJ
	 f5Dm+oBcKUBPSaoT4nvVnVTzZRu0du/Q2RqF1XXGCJcYfpgSgM4KLsfrMnHsEc/Yve
	 d9egC3AmYhENDVAb9bujt9sVQ+Fve42gt+IQb4gCRU7kIs25Dhv0z53iuHGJ2JxobY
	 RCgfnaKTuWG7DuJ0ZHc1MosIbgZ6yVOD+c8Uc5l++OJXRr3JaPgrPDoKJYqgo33foQ
	 cKW/BmeJHDxbg==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, 
 Vlad Poenaru <vlad.wing@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 regressions@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
In-Reply-To: <20260902161347.4163577-1-vlad.wing@gmail.com>
References: <20260902161347.4163577-1-vlad.wing@gmail.com>
Subject: Re: [PATCH] kbuild: don't delete in-flight filechk temporaries in
 asm-headers
Message-Id: <178854595964.42024.7648905452681649287.b4-ty@b4>
Date: Fri, 04 Sep 2026 20:19:19 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-1f2f7
X-Developer-Signature: v=1; a=openpgp-sha256; l=755; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=K67UAh45lnHiRxuKGWLeFyuTLdyFRfNm+f8uGnyvfx0=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqmwu2Djz4T/jH8vD193mYB/Tka2Kq+5JaLPktO
 zBde6kfFz+JAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCapsLtgAKCRAHUgpwFiYS
 aY6CD/wKnFfvFi0SWkA9oRvBxG8GLVFkblgSXPSouPD2RzreZ690ag/EyY5gZqRe7wnhhXkh30t
 vuBPwg0ayCSA0xi56CE0LVl5YImVI9pOekJ46VbmUrpsrcaWA+muZR6smqExcu3g7RodscG0Kyc
 6e92I80ayBLk/jcQ6u9kg5QFQEKwnfJYUMZhFW+gg0iiC0jxR83LCEKPIjT5z3NrmjOcgZ/fQZ1
 oJ6OPaupSBFlN+Db72U7Jo+lRNquJdh/iDPbO4phbNy34+REx8qByXhCMmI3huA7tkFTTITzxII
 XJ+rNcXTrxuZZREZnB5jf+/wMuYjgBpSvmQSpwFv8X5tcT9sxwF/xkvaIGfn+fO11TxQOqWoNdB
 Cm2cuLvFRRZWxEztUhnkJbvTGjji4tMwDF41O8II/M+gbTGJZ+Fy3OgIiO2l11NK21HEqTuQsg9
 +S6wLXk2W/8ya810whR7JsNOd2KGXvskr1jgac34BguFAeCvk7l4ucxqQnWRZpS/o41gN8E8LQF
 ZjTRO5mzzNn7cp4A0ePlIg8v7QjtqGge5J2sZaiL/eJmzy8xdGeB9i5ISXXWQWz0ZZxuVg3w5Up
 1EvJjZbzRVYgZXkvAaINN4GUu6i/0z1q2YJb50OkV+cHs2tQeOzRJ1GkuYj7cDcTHpi/nItsm9s
 0fhvUnB+eT8hf8w==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

On Wed, 02 Sep 2026 09:13:47 -0700, Vlad Poenaru wrote:
> kbuild: don't delete in-flight filechk temporaries in asm-headers

Applied to kbuild/linux.git (kbuild-fixes-unstable), thanks!

[1/1] kbuild: don't delete in-flight filechk temporaries in asm-headers
      https://git.kernel.org/kbuild/c/94f7bba7

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers).

Patches applied to the kbuild-fixes-unstable branch are accepted pending
wider testing in linux-next and any post-commit review; they will
generally be moved to the kbuild-fixes branch within about a week if
no issues are found.

Best regards,
-- 
Nicolas


