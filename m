Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0E13939B1
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Feb 2026 11:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772018802; cv=none; b=qDTM3mhOSqNh0L4nEQCkTwPcib+nr5iD5fWS08vEchrFsoJRZdsce08d7JNu0OFkikjSIqDjzd+ZycX2l/BrKa0OBoqgur8GsO6kCXQoRWnoeczsaOh0RRerKuR0ergMvtk2FbewacH9qGDnn3EwZFagyCYtcLYNSOgHM2k6NA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772018802; c=relaxed/simple;
	bh=848KSFqMfQKcftSqZrLvnn4Y/ezt4btZT5W9lStjXhk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TjSS5yH7NXs4O3olYB1fwP1LEC9pHRTUmWPB4wt/AHqX4No2ZdvYnyfWH9ZMHbjAbyavQhGn1g5b+g1D/mOoqxUt6pmYAEuBQkjxArFN9psJF8Vj6uDrDLswWZ5V5chGtjxKEbf3qwTygYNcF3V5v2/E0CZEIzOisL8Wi4li534=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TqXispPx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0W8Q2kuK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TqXispPx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0W8Q2kuK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TqXispPx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0W8Q2kuK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TqXispPx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0W8Q2kuK"
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	by smtp-out1.suse.de (Postfix) with ESMTP id A87623FEB8;
	Wed, 25 Feb 2026 11:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772018799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=aAo6h/uXX5my0h0Me22WmbMB9lQ2ulta+fvfwI1SWLw=;
	b=TqXispPxjJCBOm6AiQcEVnBv2G5QJ5BoGJko3IdG73UGd0dIeJzr2i073jBAAFsrzFrowT
	lNVlWqfDij8GQFhtPaPsv/8cb86JDXTLtuvwxgAJh9n0dBsjaVWiR6l4rn5KepUYqFgVKo
	aap862hdCNcVqm/1KtgafTB2P46pqOg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772018799;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=aAo6h/uXX5my0h0Me22WmbMB9lQ2ulta+fvfwI1SWLw=;
	b=0W8Q2kuKsXvO3ik2AbBZP3GT0pewMhyoUHJ/yyUHeatfYhSHURCgF8b+f9gznjiJ4UIZle
	zfevOCppe4MqRFBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772018799; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=aAo6h/uXX5my0h0Me22WmbMB9lQ2ulta+fvfwI1SWLw=;
	b=TqXispPxjJCBOm6AiQcEVnBv2G5QJ5BoGJko3IdG73UGd0dIeJzr2i073jBAAFsrzFrowT
	lNVlWqfDij8GQFhtPaPsv/8cb86JDXTLtuvwxgAJh9n0dBsjaVWiR6l4rn5KepUYqFgVKo
	aap862hdCNcVqm/1KtgafTB2P46pqOg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772018799;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=aAo6h/uXX5my0h0Me22WmbMB9lQ2ulta+fvfwI1SWLw=;
	b=0W8Q2kuKsXvO3ik2AbBZP3GT0pewMhyoUHJ/yyUHeatfYhSHURCgF8b+f9gznjiJ4UIZle
	zfevOCppe4MqRFBA==
From: Michal Suchanek <msuchanek@suse.de>
To: linux-kbuild@vger.kernel.org
Cc: Michal Suchanek <msuchanek@suse.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Tamir Duberstein <tamird@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jiri Slaby <jslaby@suse.cz>
Subject: [PATCH] kbuild: only clean objtool on mrproper
Date: Wed, 25 Feb 2026 12:26:29 +0100
Message-ID: <20260225112633.6123-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.991];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-Spam-Flag: NO

For packaging purposes I want to be able to grab the tool binaries
without the .o files

Fixes: 68b4fe32d737 ("kbuild: Add objtool to top-level clean target")
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index e944c6e71e81..e9b8811a02f5 100644
--- a/Makefile
+++ b/Makefile
@@ -1675,7 +1675,7 @@ vmlinuxclean:
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/link-vmlinux.sh clean
 	$(Q)$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) clean)
 
-clean: archclean vmlinuxclean resolve_btfids_clean objtool_clean
+clean: archclean vmlinuxclean resolve_btfids_clean
 
 # mrproper - Delete all generated files, including .config
 #
@@ -1686,7 +1686,7 @@ PHONY += $(mrproper-dirs) mrproper
 $(mrproper-dirs):
 	$(Q)$(MAKE) $(clean)=$(patsubst _mrproper_%,%,$@)
 
-mrproper: clean $(mrproper-dirs)
+mrproper: clean objtool_clean $(mrproper-dirs)
 	$(call cmd,rmfiles)
 	@find . $(RCS_FIND_IGNORE) \
 		\( -name '*.rmeta' \) \
-- 
2.51.0

