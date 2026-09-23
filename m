Received: from mail-oi2-f43.google.com (mail-oi2-f43.google.com [74.125.231.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF2A58F079
	for <linux-kbuild@vger.kernel.org>; Wed, 23 Sep 2026 22:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202933; cv=none; b=QB9gROxlNhtsPi1cWIN6i8bFQSh1PlVoJirQ3GMXmaZidsQiLjqkcsWo4b0LGBUXdpomuG0a0yHFzflZ+DMA/2PBnNCsUxJzhjVMurHEvjljz7SOwhinTPliYE2Kd8qE42iVTUmt7ILmGLtpMT2HJSOnjswT1zHe7ZAd5tSwpz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202933; c=relaxed/simple;
	bh=UtRUTMOEcHAABn0fA/3Tsdm7e2FonxveFSA9Gb6l2hE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g/4t2V6Oyy/WYY1X7xiaEr1dl7LgdhoKvcXCouTd0auMF+y8Py3AaPt6np264VnGJrjSftXzgTZ4IxOIS11Sczex2eOBctyIe2bDlCXHKxyQMTt9oeitp7xpfeAeVOMG9VpfSeP6fHzkcsQjr2olHuXavf5faLGbYATTGkgVqg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c09dVfcR; arc=none smtp.client-ip=74.125.231.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c09dVfcR"
Received: by mail-oi2-f43.google.com with SMTP id 46e09a7af769-7f4f0d1779dso1416339a34.2
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Sep 2026 15:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790202929; x=1790807729; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fyx2/lMMioIYQr8FsSk4heofJSR1CaO/m9JvXNhTKXg=;
        b=c09dVfcRWSKLm+uWzlnS3X+PpM5c72ETl8TN2BWskbq7osfnfiMVQjJwGp7GZmxXjX
         yZGkcukat7Nbdf238UMvRqvdfH++P5pRSDddJkyYQ+LI3nld9IT2Rwff6/XjvoTZ9Kfh
         +W9YPvu7F+cj2Qmhnao84jnTZcBA5rla407yMvs/Lc4JNeg5fFtkAOIR5kq74L+MxLcY
         Wc8b1mJtQHPVjB+3ifbt1ziqSrrH1qMpObnzq+KrNNlXPjIcD5PRrGmHfe19OkQl7+Le
         ogUQQsqesE/WZ2rTLyqEkjlSzP+uUIdoJN3jxD+ZYNqP8s5fdJ7EYkXOO1uebs0p1fz+
         ZEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790202929; x=1790807729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fyx2/lMMioIYQr8FsSk4heofJSR1CaO/m9JvXNhTKXg=;
        b=KSqYhWmVR3On2u1rx5FoSYCtKm5ye0MN2SQtoipRNDgfmHKXNiTLZFa3Bw5307ANXQ
         doKCD2f6IxCBs8vWPpxwfzKoVLd4jyAWvU+Xdq2kT6eY2PsK04yR+CIiem4GeNnt4fCw
         JYhggC9W415AeZRhUQymKu8KyyaukbhemOJySviGJLbQ+O92Voj7yKs1+ojvF4IcyoGQ
         uD6a10cE6gWRQ30oxYNvXqZGBRdyL4c1WkDA5jrwvrcIc/wllRLXjj1ZJdbR0PxVzwAo
         jLGuC39yvwpst/pqeS7W3aNy+vAhFE9vQbVBczCX7I14rS0E4mRxbJRqLfaUTGBgQiic
         aPew==
X-Forwarded-Encrypted: i=1; AKwUvByQ5cMDNv1QioPtnzdiLSwCPXdA9pQ9oWwXV7TCXDjT8I57FnzavqGumj7mFCkT2TrDwJasNSaRBWkHoc0=@vger.kernel.org
X-Gm-Message-State: AFuF++kdIbcpdvtS+mAGm2H7rLluY0Lds/rHfHLAy1gO0VTe4S1ROFJA
	lJ9wHD9eEU/WZplz5crgz2/xB4mWVohfqU7MjtYOrk5za4U5W0cIlXfK
X-Gm-Gg: AYBFou3B3jvR+FLn5uK7g7zMw9ANNOXNMmspcc+JBlBxr2ZS6mMn014xXrhNh2J49dV
	PV6cyp9NYQf/xN1QISjA1L6p71fRIpyLexSPBy2yDuWsbIpJ1jKOEbKQsQ9plD2ionTG/dfTJfG
	P9QfsAvJd45gkQRO/lsxbRHU5C0+SAXhr7TgsH7yZUGDEfne1gTanVqFM5BPRirFNEz4PD7mGt1
	SQrQxgO/07Uo/oTDsaQJcGAAW+4QbG4utf4hHC8xmTVgsDpxjLYTS3OkM3ZExjCeeRGhQB+fExX
	Sgeok5fVUp60SyzmDjVM0KPrvRrd/2t0/0tVlIXaTFKboPQwUQ7HHXI0zJBSHKx5YfHCASZ4pFk
	UuhmD93DTkMDM6T/vY776uJhO4Tra919F4HRaKi5oD5m3lZWyMeZJKV6NWYwZIka4QmZr/LOHcF
	ebk0uMXWTpoJUTV6oa58p5TdcUuw5l2TEKpzYbq3y3WK7NZStAwptIamtcW0k4dPnq0GwIkRs6m
	SwlwNghjkVnVN4AEzHF0GlSmwT03gF2MbDF9p6sg19v2f1+t5dvhog7zVtyLXrkoCNlaQzgMD39
	gd9poReljakTYJo5w4Od
X-Received: by 2002:a05:6808:1996:b0:4d6:9153:2964 with SMTP id 5614622812f47-4d72b7338f5mr695991b6e.53.1790202928885;
        Wed, 23 Sep 2026 15:35:28 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-491ee1ac486sm559401fac.16.2026.09.23.15.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:35:28 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Wed, 23 Sep 2026 16:34:46 -0600
Subject: [PATCH v11 22/38] dyndbg: hoist classmap-filter-by-modname up to
 ddebug_add_module
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dd-cmap-part2-clean-v11-22-9b6c217fdf2f@gmail.com>
References: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
In-Reply-To: <20260923-dd-cmap-part2-clean-v11-0-9b6c217fdf2f@gmail.com>
To: Jason Baron <jbaron@akamai.com>, Shuah Khan <shuah@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Jonathan Corbet <corbet@net.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-pm@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790202874; l=5946;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=UtRUTMOEcHAABn0fA/3Tsdm7e2FonxveFSA9Gb6l2hE=;
 b=Q24ZotreobGZfIqTRvWMRFHmUcoi1ByJ37Tnxztz6NXIJr2FHoGYP6QDLtarpJR3FGJ3gqt85
 lMnKhHKFIQnBmjmqW7JDO+RHjgQDlMJxue3aCDGulmrBh5Y+joXJEmD
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

The body of ddebug_attach_module_classes() is just a code-block that
finds the contiguous subrange of classmaps matching on modname, and
saves it into the ddebug_table's info record.

Implement this block in a macro to accommodate different component
vectors in the "box" (as named in the for_subvec macro).  We will
reuse this macro shortly.

And hoist its invocation out of ddebug_attach_module_classes() up into
ddebug_add_module().  This moves the filtering step up closer to
dynamic_debug_init(), which already segments the builtin pr_debug
descriptors on their mod_name boundaries.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
v8: set maps.len = nc unconditionally
v3: expand block-comment in ddebug_add_module

v2: move RvB after SoB

finish hoist - drop old fn - ddebug_attach_module_classes

the v1 rev left the old ddebug_attach_module_classes in place, but it
is completely redundant now, since it already lost the list-linking
job it was doing.

It was being cut out later in the patchset (in the unsent API
adaptation phase), but for cleaner review, lets excise it now.

OLD all-in-1-series (pre split into reviewable chunks)

v10?- reordered params to match kdoc

v12- refactor/rename: s/dd_mark_vector_subrange/dd_set_module_subrange/

1. Renamed the macro from dd_mark_vector_subrange to
   dd_set_module_subrange to better reflect its purpose of narrowing a
   vector to a module-specific subrange.

2. Simplified the arguments by removing the redundant _dst, as the _di
   pointer already provides access to the target _ddebug_info struct.

3. Refactored for Clarity: Instead of overwriting the struct's start
   pointer while the for_subvec loop is using it to iterate, I
   introduced a temporary __start variable. This avoids the "subtle"
   side effect and makes the logic easier to follow.

4. Updated Documentation: Improved the comment block to explicitly
   state that the macro scans for the first match and counts
   contiguous elements.

fiuxp
---
 lib/dynamic_debug.c | 79 +++++++++++++++++++++++++++++------------------------
 1 file changed, 43 insertions(+), 36 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 1627e40efc8f..18289ca7170b 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1174,33 +1174,34 @@ static const struct proc_ops proc_fops = {
 	.proc_write = ddebug_proc_write
 };
 
-static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
-{
-	struct ddebug_class_map *cm;
-	int i, nc = 0;
-
-	/*
-	 * Find this module's classmaps in a subrange/wholerange of
-	 * the builtin/modular classmap vector/section.  Save the start
-	 * and length of the subrange at its edges.
-	 */
-	for_subvec(i, cm, di, maps) {
-		if (!strcmp(cm->mod_name, dt->info.mod_name)) {
-			if (!nc) {
-				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
-					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
-				dt->info.maps.start = cm;
-			}
-			nc++;
-		} else if (nc) {
-			/* end of matching classmaps */
-			break;
-		}
-	}
-	dt->info.maps.len = nc;
-	if (nc)
-		vpr_info("module:%s attached %d classes\n", dt->info.mod_name, nc);
-}
+/*
+ * dd_set_module_subrange - find matching subrange of classmaps
+ * @_i:   caller-provided index var
+ * @_sp:  cursor into @_vec
+ * @_di:  pointer to the struct _ddebug_info to be narrowed
+ * @_vec: name of the vector member (must have .start and .len)
+ *
+ * Narrow a _ddebug_info's vector (@_vec) of classmaps to the
+ * contiguous subrange of elements where ->mod_name matches
+ * @__di->mod_name.  This is primarily for builtins, loadable modules
+ * have only their classmaps, and dont need this sub-selection.
+ */
+#define dd_set_module_subrange(_i, _sp, _di, _vec) ({			\
+	struct _ddebug_info *__di = (_di);				\
+	typeof(__di->_vec.start) __start = NULL;			\
+	int __nc = 0;							\
+	for_subvec(_i, _sp, __di, _vec) {				\
+		if (!strcmp((_sp)->mod_name, __di->mod_name)) {		\
+			if (!__nc++)					\
+				__start = (_sp);			\
+		} else if (__nc) {					\
+			break; /* end of consecutive matches */		\
+		}							\
+	}								\
+	__di->_vec.len = __nc;						\
+	if (__nc)							\
+		__di->_vec.start = __start;				\
+})
 
 /*
  * Allocate a new ddebug_table for the given module
@@ -1209,6 +1210,8 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 static int ddebug_add_module(struct _ddebug_info *di)
 {
 	struct ddebug_table *dt;
+	struct ddebug_class_map *cm;
+	int i;
 
 	if (!di->descs.len)
 		return 0;
@@ -1221,17 +1224,21 @@ static int ddebug_add_module(struct _ddebug_info *di)
 		return -ENOMEM;
 	}
 	/*
-	 * For built-in modules, name (as supplied in di by its
-	 * callers) lives in .rodata and is immortal. For loaded
-	 * modules, name points at the name[] member of struct module,
-	 * which lives at least as long as this struct ddebug_table.
+	 * For built-in modules, di is a partial cursor into the
+	 * builtin dyndbg data; the descriptors are the subrange
+	 * matching the modname, but the classmaps are the full set.
+	 * We find and set the relevant subrange of classmaps here.
+	 *
+	 * The modname string is in .rodata, the descriptors and
+	 * classmaps are in writable .data. All are immortal.
+	 *
+	 * For loaded modules, mod_name points at the name[] member
+	 * of struct module, and the descriptors and classmaps point
+	 * at the module's ELF sections; all have lifetimes matching
+	 * the module's presence.
 	 */
 	dt->info = *di;
-
-	INIT_LIST_HEAD(&dt->link);
-
-	if (di->maps.len)
-		ddebug_attach_module_classes(dt, di);
+	dd_set_module_subrange(i, cm, &dt->info, maps);
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);

-- 
2.55.0

