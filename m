Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6D843F0B5
	for <linux-kbuild@vger.kernel.org>; Sat, 18 Jul 2026 04:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784347396; cv=none; b=ZutyWfNkup9RYs75C0sViTO5QYJZk5ugxuQFtxVtBTs4R2TM8AMjKeakavIBOHdFv3QKsGacGpf8BpxW3RcSxZ2w8NztTb77JpNr+pU1HKk4l5AC4vAJlOqcAO0qKzwD7yfp4Tx/YJ1SyblOIQdsHPjDhtGy+K4Q7ApAUb1E96w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784347396; c=relaxed/simple;
	bh=ouJbhNEySa6wtHXigz28qZUwmmTdTjqDteAFtha4ajo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GxotLqmC2qrgiFJBubFc8cd92bu7oVqaLG6PEVCt061YWstXyEmwai7xWVfCPa449GkCf4tfZpJOoP1hzf4dY1nxKjbgYxzT+dcZVh7ZLGvN8aU5kbOiuJbmg6JLkss8BfsO+pv1v8ZMeVqJye7Gvn4u4rB1YCrc+uG47U7LdHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xhf7Iyrk; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xhf7Iyrk"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784347391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ffPTsUAYPTy3t9bpVraPeoscXLu0Pse7ijb8l0qwCA8=;
	b=xhf7Iyrk+q4u5Qvic4KSm9oiycSPxJPavJa57bf9bbvkM86NT/5YDfmqFfJ9zmp3VcZ+iC
	0n92cW+Nu59RtKrKo/JkONKdjzmf5uLkkX7yDNjeGzXJescNKb9RcnhYHVEQiLXdWn7rN+
	GZmTGyT8efxCYGJLDdI4DNe4MLJzOKM=
From: Yuntao Wang <yuntao.wang@linux.dev>
To: linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>,
	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Yuntao Wang <yuntao.wang@linux.dev>
Subject: [PATCH] kbuild: set the initial value of subdir-rustflags-y
Date: Sat, 18 Jul 2026 12:01:46 +0800
Message-ID: <20260718040146.294700-1-yuntao.wang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Initialize subdir-rustflags-y to an empty value to prevent it from being
inadvertently affected by an environment variable of the same name.

Signed-off-by: Yuntao Wang <yuntao.wang@linux.dev>
---
 scripts/Makefile.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 911745743246..e60d97ef535a 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -28,6 +28,7 @@ ldflags-y  :=
 
 subdir-asflags-y :=
 subdir-ccflags-y :=
+subdir-rustflags-y :=
 
 # Read auto.conf if it exists, otherwise ignore
 -include $(objtree)/include/config/auto.conf
-- 
2.54.0

