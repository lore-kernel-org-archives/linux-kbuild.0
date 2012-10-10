Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:38192 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757532Ab2JJWxz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 10 Oct 2012 18:53:55 -0400
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [ 024/133] localmodconfig: Fix localyesconfig to set to y not m
Date: Thu, 11 Oct 2012 07:50:50 +0900
Message-Id: <20121010224858.802232588@linuxfoundation.org>
In-Reply-To: <20121010224854.313159132@linuxfoundation.org>
References: <20121010224854.313159132@linuxfoundation.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alan@lxorguk.ukuu.org.uk, Yuta Ando <yuta.and@gmail.com>, Steven Rostedt <rostedt@rostedt.homelinux.com>, linux-kbuild@vger.kernel.org

3.5-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Yuta Ando <yuta.and@gmail.com>

commit 4eae518d4b01b0cbf2f0d8edb5a6f3d6245ee8fb upstream.

The kbuild target 'localyesconfig' has been same as 'localmodconfig'
since the commit 50bce3e "kconfig/streamline_config.pl: merge
local{mod,yes}config". The commit expects this script generates
different configure depending on target, but it was not yet implemented.

So I added code that sets to 'yes' when target is 'localyesconfig'.

Link: http://lkml.kernel.org/r/1349101470-12243-1-git-send-email-yuta.and@gmail.com

Signed-off-by: Yuta Ando <yuta.and@gmail.com>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Steven Rostedt <rostedt@rostedt.homelinux.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 scripts/kconfig/streamline_config.pl |    2 ++
 1 file changed, 2 insertions(+)

--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -463,6 +463,8 @@ while(<CIN>) {
 	if (defined($configs{$1})) {
 	    if ($localyesconfig) {
 	        $setconfigs{$1} = 'y';
+		print "$1=y\n";
+		next;
 	    } else {
 	        $setconfigs{$1} = $2;
 	    }


