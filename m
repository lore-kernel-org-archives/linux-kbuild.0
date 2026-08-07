Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2AC42F71B;
	Fri,  7 Aug 2026 20:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786133449; cv=none; b=Jv1LfmMNFNa5mm+1ZsDOFUPmwv4VPceOAUiB9fYjr0itjiS+L2RkOi87mzwO+tUzDxWSoAqu+hBEq51B1qAoeiGCthHxLZrsY/3BE8EYs1Y953GAT/kcA/I78p/wNkCbSpxmtwASgc7YLAM2qYofTzxZJV+7D7vpOMLaM9v42qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786133449; c=relaxed/simple;
	bh=F0joV0mAldCGxB6tt9PSIBsBbgnShyHWqPcV86Z69xg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KriBCfQ1p6OQvhB5ntfGH+cOQFyzvxztmg3ngjPwkvhA0hTZG1pCERtImLxA+VieD6g92JAapUZ+fczbHiSo7LCuMdF829PMmd0YLohJUlffDX7rp2J89qvXFaK5k9Sft4nab9kvPMvz4GcqD8BfHtjOkoW+wKpNuUiv/WCGTrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VVBFScdK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VVBFScdK"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 82D741F000E9;
	Fri,  7 Aug 2026 20:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786133445;
	bh=TbdE1kZZXAmKawAMRrAwA+EoOiqFIWcgDZBvWGh94z0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VVBFScdKt0L6BWMfPLZaVeVt+RbZY4T21vGA2DorbfZEH21h1dVd4mbP310D060nX
	 Gx9rFjepZkoeBG40vHEiDVwEQV6d9pWuAKbdGQByYKRi+OriVIh+InAkNpllsYrn6k
	 w03T4+4XgMwlwIHhngYEMibhGFsLXc/kf7i3IppfhkFBSbXUfS0b2vKoY3U6WfotAd
	 TsIPcvbL99LurkWOIaEpo5CBFzds08u4Y2G7+plLlLiLe8oH804wuW7Q6EYITTwaiB
	 0JF3PI+JCHcqJzM5VIVLaWNZbJCyBby0cR0lPh4eKNzgxU4CLwK/tmODlSPWzMVCyR
	 bKW8Btls4tebg==
From: Nicolas Schier <nsc@kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jani Nikula <jani.nikula@intel.com>
Cc: Nathan Chancellor <nathan@kernel.org>
In-Reply-To: <cover.1786120005.git.jani.nikula@intel.com>
References: <cover.1786120005.git.jani.nikula@intel.com>
Subject: Re: [PATCH 0/2] modpost: error logging cleanups
Message-Id: <178613342521.4123747.1957099013575804476.b4-ty@b4>
Date: Fri, 07 Aug 2026 22:10:25 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-362b8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1077; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=F0joV0mAldCGxB6tt9PSIBsBbgnShyHWqPcV86Z69xg=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqdju3PLTvlQls1IhS5U4O/FabdsvFj/ftpz4W/
 VQ5HneeTDWJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCanY7twAKCRAHUgpwFiYS
 aW7lD/96poUycj4K0nvkaZkkXlBLArd5awEQHf0yU4UZuJnKPdTRy1rCYHw4ApWXvvy4hZWbb6i
 spVHOxDL0NlvQQLgw2xjBOLDGnmmf+f1rswhsLKYQB/aKefB5NSam749sEFGHVXReMvsaZkWfDM
 W/Gvh2786a3DbaxtI5ZexG5D1DcBsgQpHIUDCAqfWNgrpX7GNUTkG5cMq+ILYWjSXn3pK6xSMZZ
 Xi6rngH7Y9x1SqnsCBYyMLraRRgIwYcZp9cp2KT5oi1dR0kHhNyfvgX6unE6xndg/i8ijTpODbC
 zPjE9Zjh34dcHGW9nFlqxRfHgxatz5AlxS+Q0i5SlVt+QwqZoGyM9Zb+6Nd8+JCHuUvSCUzoJ7X
 M61+b8RJF/iZ0xdcLbFmef8pSUwywwnw40FmiLShRWGakHAi23NAB5SotOENB7DfiIoGPnTJgq4
 r/VvmZPunCd9tvXl9VJvYR7hsvJk9Bx924j6TAkI67tQU1p2cU70MSSPJrdCgLj/hxqMfnEkz4p
 7d5637zrCLMqf6VwroK1kmwgbL/YRVQtgXMXydEdUr7dgO0tXEBR5HAa7YTvsgQiU1V5P3GgRUK
 4jhGzqI4gVY7WDOsvtohUMmV8vyFQ4GwKYRZxOrv9La0HRL/HIhypq3BadHLEs3stCfi3R6Abc9
 +o25D8FqnfzHlIA==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

On Fri, 07 Aug 2026 19:29:39 +0300, Jani Nikula wrote:
> modpost: error logging cleanups
> 
> I was doing some refactoring, and kept hitting modpost errors and
> warnings. It was getting a bit annoying that a lot of the modpost
> messages have different formats for modules, and different quoting for
> symbols, sections, and namespaces.
> 
> [...]

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/2] modpost: add module as parameter to modpost_log()
      https://git.kernel.org/kbuild/c/ae3de10f
[2/2] modpost: use mod_warn() and mod_error(), clean up logging
      https://git.kernel.org/kbuild/c/bbeb002c

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers).

Patches applied to the kbuild-next-unstable branch are accepted pending
wider testing in linux-next and any post-commit review; they will
generally be moved to the kbuild-next branch in about a week if no
issues are found.

Best regards,
-- 
Nicolas


