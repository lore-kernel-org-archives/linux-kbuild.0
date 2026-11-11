Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377225;
	b=B7e7nPsfVGAd96sjmEPhYQZ8/qb4GqD5z44AVbw7MP/sfbPf0mWQpeed0KwQIMXQOfn7
	 iF85NLq+XXvTpue8Ngza9J62+JbInPAG/6OZz1Wr08sHW9rJEbRN5JVmOQ+TVrABM8x76
	 uJUbS5ckSsL8Ac9RzF1EixXe6EjhYRIxORz3ubUktrWaVFH5aQtVj8fFPxowFT9L5+/1y
	 +EIK96+2uHddOc6DCdtkmXZlQb4B4DjMU0EzvU+21nUbjlW3RccjbqcvE8YnlLeDAOMbf
	 u9JgGHfej3HI5DKf5LzYBVnk0268g5qh9EwtgC1Ce2X2PipWHE6y7I5hTksu94wpebw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377225;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=s57W9w7Iv5F+RHyTSz3JDjt37fhoA+X/u3bNWlwwXiM=;
	b=Ot2y2OF1AMBD7In4uwaXaHEXz5La5uwz+vDj7MAPAXF2zQ8Q8+Vj7vHJp4GyuWHLF8Lf
	 EH661ZNJrpZw7Q7bE+SUshJ56Ux49ziSR90iLmHgphl6BHjaigJLLzp7ZNzVGUx2wy7pO
	 kZkD2hoaqPAXeYsqVgPkShgKEKBtftdXR6I07Yy7UbqrDFNVpArbYoJB/U2fGVzmq59qR
	 R+C6psTkSP6hiHYwDOF4FpJlWmQ3aSLDUNYPCvAyWgarEGqrBRiP/utZ8OACuKX1OOztS
	 XSSdDnZZhOvWI70J4TuQIQmkVbvBtrkTRJ+ZXG7pNooyYaX/qfws14mjmZLJt48oEPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TCHI8OA2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13143606A31C;
	Wed, 11 Nov 2026 06:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TCHI8OA2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504F71F00A05;
	Wed, 11 Nov 2026 06:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794377224;
	bh=s57W9w7Iv5F+RHyTSz3JDjt37fhoA+X/u3bNWlwwXiM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=TCHI8OA2GtQTooqdYRKZtSbYIn5+oZNyTcJPmtrt9L9agy6e9K5joq4nJ9AWmw61x
	 Z17NerUjXHtOkkgQFgGjBK8zRGN2pgp3boDc/QO9dh6mX9xWJU4/dxCXCmIWdU3Od8
	 N1MoTaWU6yEJBmArMYtTYfmKTxDVOtPrXpVgSgPeo9TojssA5rh3lMKUeptl7pyVLW
	 IAIvC+OT3pTdkvj3iyy5poT8DHNzOcAHDmQqW3sg2KX1FwaU4qbudpe9IA++IZzzCi
	 rMHhT9AhhPBWPVCEH56HcDomt0lBgLdIi3cb3rn1ZRUobg9gfFRt4g7Jz6O8da58XB
	 QxiAb8sphhYtQ==
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] run-clang-tools: Resolve the compilation database
 before changing directory
From: Nathan Chancellor <nathan@kernel.org>
To: Marcus <baronmarcus2005@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20261109211618.1496-1-baronmarcus2005@gmail.com>
References: <20261109211618.1496-1-baronmarcus2005@gmail.com>
Date: Wed, 11 Nov 2026 00:06:54 -0600
Message-Id: <179437721445.3770401.4447679070956736866.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1177; i=nathan@kernel.org;
 h=from:subject:message-id; bh=TJmJGIEQ6pOj7SOZFOYS+CgVYIAsMJjGqV5u0IejsoM=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlf2Jj/c5zZd/N2Vi9j7xqHHl/DNZtmurx6eqh6coLV1
 ICv+6PPdZSyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJ1HowMjTo6IepKhqVvLze
 JnX2o6IOx/12yYaog2EO37bndrcE32BkmLFqxT3JvUs2NsRXXuBP5Z6230vv7l6+vYdu3anWSlr
 /gQ0A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> The script reads the compilation database relative to its working
> directory, but passes the same path to clang-tidy after switching to each
> entry's directory. When the database is outside the build directory, a
> relative path can therefore point to a nonexistent location. clang-tidy
> then runs without the recorded compilation flags or finds an unrelated
> database in a parent directory.
> 
> For example, invoking the script with database/compile_commands.json from
> the parent of database/ and build/ fails to load the database when its
> entries use build/ as their directory.

I do not believe this script is meant to be called arbitrarily by a
user. It is only designed to be called within Kbuild directly via the
clang-tidy and clang-analyzer targets. The rules for those targets
mandate using the current build's compile_commands.json through their
prerequisites, so the script's current working directory must be the
same as the directory of every entry in compile_commands.json, so I do
not think your reproducer can happen in practice. If it can happen
through using one of those targets, please demonstrate how.

-- 
Cheers,
Nathan

