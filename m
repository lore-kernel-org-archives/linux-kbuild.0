Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731234756B6
	for <linux-kbuild@vger.kernel.org>; Sun, 20 Sep 2026 19:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933090; cv=none; b=EoqaeN2YTjkdMyj6ueo6OLUKHhdZmYcGOmiH77jTlWVWb3HhRbKXOJ1Cfuzf6mIO+35fzi8BmMN6NDs2Rnk35bcnp+NrdnePi7fJZSwupN0w2j/KMLTje1f0v9ts2PcDWvz8//6muibvX7u/mly2byu24d/6P+IJxAlF0+91v/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933090; c=relaxed/simple;
	bh=vD3k0UChVcsUPV8WCpzl60xjcOJJ7AH4O6Kwg/ASCvo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aM0nf+Zi8MORrnknwiZS3fduOVAg+r4HjdniPUNZx9Tnqn9ClSYIkaoiytrmy0cTgAfocZ4RV5iQTVzq+3/YhztF+YoXdRxlb4yP+zGpCXXHfPt/1oaOHt0QGo7qUTd6MyZN1gmU7l3YRhJOtf7ATZGIzgwbKck1zXJNUQbPHmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=RrlNGgY0; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="RrlNGgY0"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aac929eso2019070d50.0
        for <linux-kbuild@vger.kernel.org>; Sun, 20 Sep 2026 12:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1789933086; x=1790537886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xd0t5fQ0wbqovFneONezXRLopfuFSVDwWIsqSLQ6+6E=;
        b=RrlNGgY0iJCLHvLzaOqKkf3gLzRqZRNs3AAepRwIwDleyCYaiOghA4vqiXA6qubzC+
         24dvZefH6rJFbESqgiBexlht9k2P4jayHUVOxKavkv047Iwi3j68ZxrHzNYxx4AhE2Qb
         aKxGtjXjJX6+0Sgcy+nXo4muIMtbk+5iXSH83LreZrlNlj5brul3XvqxZuXYyMkJHbx2
         M9kE4SgGfjg/AgZJ+kZyRU2gcJRKIyvpm8ZE27VVSIw/faLLB90ylpqTLqx8w3sMAtH5
         fDGymuvYj2dE2L3f3IPD7SWIbaWLjxdGzXi9W7OVFRvoL20by8hHYOwrYpq+32pX2pRJ
         NpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933086; x=1790537886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Xd0t5fQ0wbqovFneONezXRLopfuFSVDwWIsqSLQ6+6E=;
        b=LiK0y3Bz+PTdIGHds9CyP9VLiRYEUxQ9SBLO6n/kPWYtPCAfUMApCE8Glx17+IHA5R
         jPw5k/Q2diYkOg9+qlfzc3qUVp54kSqyotiSWvDBgJzyFRxVgnEjWN7Y6ix/2J9uSLDK
         Z8E0taTApLeRc9fHZnwrkwnDpJMksnUu6JVPIEoN7HjZpMFQu6/E6Gw+d5Y818m/j1Yt
         hEuPC0ezWNvI+z6kMq3nqEUeKfUAgmA/ai0H4nXLyJMB6p0dqZG6pCvV4Ai183pxZdFd
         5Yju+t5RQcQ2AomNqft+NwepO9P6PFbuPjaiK/YHuhFYzeeE25OmIADCD3zLGiLYfUqm
         oMbQ==
X-Forwarded-Encrypted: i=1; AKwUvBypUm01g/kHL6v5VE7lnoBUU4hn/FO8l338mPaZzm3RTM+pJVh/qX5HKp0qnjmfoqlqoFAbXHuzrDLjqPE=@vger.kernel.org
X-Gm-Message-State: AFuF++n/VnX795dlZDmdSdZ4X454jHPL7yjaYPB2945hAYctzW+s2FVs
	HwFs4qhMBAEZIM3LPj4Ub1afLDDcjIzf2PrdTF/etseL9ERsrWqKprPkVWKD5EvQfec=
X-Gm-Gg: AYBFou3jkeA0kBoX5GVzqcZU8i/JYjge5NupEBtSWKoT6rsjpzYshCerCzqtERPxqBS
	bxJtcNfK/wt+s9qCSGXRFttPKF0Rw1cX+1YxYYK8sOx9/YTtcDipkX+e7W7G9qC5kuSRXwUI9sR
	mxwVCW3fcgMgB3xVq3hZQ3W/4XtnagsrYtTERArf0GjnSHDVTVml5OrbyaTff6bgYg884aGhGED
	kaRfb5EJAqYsegOjbLg7y/c4GxeK0iHwO9N6BNYB+navGXbDFZG+n7dgsza6Sim1j0lDMdBN6zR
	0keLO/TFXNNMTzZjtFgXhir76276IFduwH1soKLSpDs5RKmZxvEGaLOWFMDivFDVZQ+dvfFBZxo
	N082gC9yO6b0fe4nbt1ca+aQ224NIpRGqBZU0g318tT4PMcGEZYcqm5WIiGXYbS456I3WZv/LYe
	4jypNJ/mx9SqFEG6xno1d95k7eDtPwRy9aDEVBuP4wAyil8qULJ9fVj3LqJqB+JyE7+2H0oVeWc
	0yqOx3PQEwFRVHVAnuHJi0CMzTcqreXNgea83hUW9l/oNE1lXW2En+0pJoDUxKAMbyKdGWD0WGg
	th6UBTihsG4bkXqyHi0=
X-Received: by 2002:a05:690e:dce:b0:66f:c1be:a646 with SMTP id 956f58d0204a3-6717fd8f1ddmr2788927d50.56.1789933086522;
        Sun, 20 Sep 2026 12:38:06 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-672991445desm2614214d50.20.2026.09.20.12.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:38:06 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	legion@kernel.org,
	kees@kernel.org,
	will@kernel.org,
	ruanjinjie@huawei.com,
	atomlin@atomlin.com,
	rppt@kernel.org,
	jani.nikula@intel.com,
	hamzamahfooz@linux.microsoft.com,
	joey.gouly@arm.com,
	tglx@kernel.org,
	nsc@kernel.org,
	alexandre.chartre@oracle.com,
	james.morse@arm.com,
	dianders@chromium.org,
	bp@alien8.de,
	jpoimboe@kernel.org,
	shuah@kernel.org,
	catalin.marinas@arm.com,
	linux-kbuild@vger.kernel.org,
	linux-arch@vger.kernel.org,
	kvmarm@lists.linux.dev,
	jaredwhite@microsoft.com,
	johan@kernel.org,
	pbonzini@redhat.com,
	mingo@redhat.com,
	linux-mm@kvack.org,
	seanjc@google.com,
	mark.rutland@arm.com,
	vdonnefort@google.com,
	tarunsahu@google.com,
	gshan@redhat.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	xur@google.com,
	djbw@kernel.org,
	oupton@kernel.org,
	nogikh@google.com,
	sumitg@nvidia.com,
	linux-kernel@vger.kernel.org,
	zengheng4@huawei.com,
	peterz@infradead.org,
	corbet@lwn.net,
	suzuki.poulose@arm.com,
	luto@kernel.org,
	hpa@zytor.com,
	zhangpengjie2@huawei.com,
	x86@kernel.org,
	yuzenghui@huawei.com,
	jic23@kernel.org,
	ardb@kernel.org,
	pasha.tatashin@soleen.com,
	petr.pavlu@suse.com,
	ryan.roberts@arm.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	dave.hansen@linux.intel.com,
	rdunlap@infradead.org,
	kvm@vger.kernel.org,
	fuad.tabba@linux.dev,
	maz@kernel.org,
	mbenes@suse.cz,
	jgross@suse.com,
	seiden@linux.ibm.com,
	pierre.gondois@arm.com,
	song@kernel.org,
	nathan@kernel.org,
	pmladek@suse.com,
	graf@amazon.com,
	chao.gao@intel.com,
	zhenglifeng1@huawei.com,
	arnd@arndb.de,
	sidnayyar@google.com,
	linux-arm-kernel@lists.infradead.org,
	vladimir.murzin@arm.com,
	kas@kernel.org
Subject: [RFC PATCH 12/46] liveupdate: Add liveupdate_session_name() helper
Date: Sun, 20 Sep 2026 15:36:16 -0400
Message-ID: <20260920193650.3373435-13-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260920193650.3373435-1-pasha.tatashin@soleen.com>
References: <20260920193650.3373435-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide an accessor function liveupdate_session_name() to retrieve the
name of a live update session from its session handle.

This allows kernel subsystems like CPU preservation to identify the
session managing preserved resources.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/liveupdate.h      |  6 ++++++
 kernel/liveupdate/luo_session.c | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
index 6051abc0612c..119ad0f82705 100644
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@ -256,6 +256,7 @@ int liveupdate_get_file_incoming(struct liveupdate_session *s, u64 token,
 /* Get a token for an outgoing file, or -ENOENT if file is not preserved */
 int liveupdate_get_token_outgoing(struct liveupdate_session *s,
 				  struct file *file, u64 *tokenp);
+const char *liveupdate_session_name(struct liveupdate_session *s);
 
 #else /* CONFIG_LIVEUPDATE */
 
@@ -321,5 +322,10 @@ static inline int liveupdate_get_token_outgoing(struct liveupdate_session *s,
 	return -EOPNOTSUPP;
 }
 
+static inline const char *liveupdate_session_name(struct liveupdate_session *s)
+{
+	return NULL;
+}
+
 #endif /* CONFIG_LIVEUPDATE */
 #endif /* _LINUX_LIVEUPDATE_H */
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index f48e9a4185f9..3c4f195d375d 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -683,3 +683,17 @@ int luo_session_serialize(void)
 
 	return err;
 }
+
+/**
+ * liveupdate_session_name - Get the name of a liveupdate session
+ * @s: Live update session pointer.
+ *
+ * Return: Pointer to session name string.
+ */
+const char *liveupdate_session_name(struct liveupdate_session *s)
+{
+	struct luo_session *session = (struct luo_session *)s;
+
+	return session->name;
+}
+EXPORT_SYMBOL_GPL(liveupdate_session_name);
-- 
2.55.0.1082.g2b9226bbc0-goog

