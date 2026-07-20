Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B6E42E8C3;
	Mon, 20 Jul 2026 19:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576560; cv=none; b=nWHds8xwsbX/RQsB7fbXIRyki+NdaZfeP1pccuYsWfpqTl3ozTslWdcsv1Ghus4hx4K4I4Lo5uVt/JKfaZxAcNf1jDx33AEA3lypSIKxMqpew6R22D+F9Yu3s0KnCo9+t3G1NcCy5suRzjU4tu2Mi6hz8BsOXVL+RiaHN7ABT+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576560; c=relaxed/simple;
	bh=nMYhAo0WN800zcuF481Bf0az+opbYuQRN9xgU73/tOY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=cdmlduuj3RtYeKL0HW4en83Y1ASgcHxNNQLhnVjH2mLxkEz8UcyK3dCr647Z+mYfFo3zi/tuSSEXkkDXxYFH6V+2JR6TvvyzdeOtd+L9mpD13vn+RsqgUDGn3qyocgx/cA7tJlaqE+6bLOQXybRLe0ccR3an1GR9ISmy4CRLBKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=APoZ0n/b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="APoZ0n/b"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 6014C1F000E9;
	Mon, 20 Jul 2026 19:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784576558;
	bh=8XItPYiXyjZai96AOAIoPn6dLXDVDW5iDd75UGqipsI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=APoZ0n/bWDZTfbIQ9qW8BhdrtwAw+oXE1EhnteJA95S/ZLkJ8/p5xLogRtueWTY2r
	 yYQTYPkqRyszrulBMscclDCKn+SOycAAEm5DRkF1fP2WsgoGcT6MDNm7t0K+FXgcvZ
	 pvTAzef1CqdlvUu3Fqy9g8/f3O5FrwviwpNy4pCjjgREhG9mITx4K9yh8nqbV/iSgC
	 I7wTMRQa2e1LR7GPMVF3AmfhQyEtWYUKtSlgDhAlh6JYO7rtsYj6DQ78DVnaYbVhBm
	 Yt8Eb7zRdnWdu0vmAJsW9M7bqavc/zqsSBA6EADGWTGc+FA0+0hRrZoQAIxdoNGqLF
	 bgZQN+wln6eXw==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] scripts/config: Use POSIX standard ERE (-E) in sed
From: Nicolas Schier <nsc@kernel.org>
To: Rong Zhang <i@rong.moe>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260607-config-sed-v1-1-2ff7e35de271@rong.moe>
References: <20260607-config-sed-v1-0-2ff7e35de271@rong.moe>
 <20260607-config-sed-v1-1-2ff7e35de271@rong.moe>
Date: Mon, 20 Jul 2026 21:40:58 +0200
Message-Id: <178457645828.1375946.5314630450097150907.b4-review@b4>
X-Mailer: b4 0.16-dev-4217c
X-Developer-Signature: v=1; a=openpgp-sha256; l=639; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=nMYhAo0WN800zcuF481Bf0az+opbYuQRN9xgU73/tOY=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqXnnNcV5W5cTdirh9A1Ql2eqaWWRGsL0QcQxfC
 38OYTLr/UWJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCal55zQAKCRAHUgpwFiYS
 adrnEADm0Vrc/pbTigTWAb5qzDt9lvxSXbOJgWUufCua25mTPf7OtGEVIkVfaog0mi6ha8xoRls
 Y5fRfydZhx47EJ4ykMP1nDwfnZT+7LsMSVwceqdf7R2rl0WeOWMDJpIyYN7SuG4sRust1lU5lPf
 nj0pxyzLmC2XzyilQ4UnYb3NQK5QO0BLXzeRBgW06cBUq5/w4RLURZbKFubxu2musRURk1vGZWf
 sQCahWsU0kKCvaymopwBmlGgsUq0sRyL/ezw/47szO/R7U2A+ouugFIR4KqhMcwogCf5LezoXhh
 RR53QfXVMyrS/bjMRlO4L4BKA0o3RIHst3yRGZtSF1Huvqn7Fob6hDgDi3FYGuX3dlhulSvwzl2
 KKGjyYP3TUOvqaC86xWKZKujEco1fv3DuihOL7yXUJ2ksAShAZ+fx+4HbgVnCsh9KrP0vxavtZC
 PrT8HPKmuykiI2tgw7Pp4IPl9Ke4C0/jKJ4fqr0M+TkzmI5YxoqpACH4F3ayrK9mEorjC1ybGqM
 HEIsSiIQwiPZHsKP4uH2MkqkfL0k2LN0tDselU4C75NtcC6+zOSa5L74c3sOYt9VJmjSws26QoO
 f6Iot3CjNTyJbA3PKBt+uSwxguXfh1Cc3KkFkqCzuNvJ7yRmywWVSkKluVf/79FY/D92/b32N3N
 Cjbg4gFzoaMn9pQ==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

On Sun, 07 Jun 2026 06:11:31 +0800, Rong Zhang <i@rong.moe> wrote:
> The use of Extended Regular Expressions was removed by commit
> 83e8b90e1d2c ("scripts/config: use sed's POSIX interface").
> 
> Before that, the script used `-r' to enable ERE, which is indeed
> non-portable. However, POSIX.1-2024 [1][2] has accepted `-E' as a
> standard option to use ERE for matching, and major sed implementations
> (GNU, FreeBSD, OpenBSD, NetBSD, macOS) have supported `-E' for over two
> decades, so it makes no sense to use Basic Regular Expressions any more.
> 
> [...]

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

