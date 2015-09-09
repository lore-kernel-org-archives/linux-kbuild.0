Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:33958 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753224AbbIIReF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Sep 2015 13:34:05 -0400
From: Gabriel de Perthuis <g2p.code@gmail.com>
Subject: [PATCH 2/2] kconfig/merge_config.sh: Accept a single file
References: <1756d31a07bcee06ada066bcaccb506c6c43fc57.1441819862.git.g2p.code@gmail.com>
Message-ID: <55F06D89.7080000@gmail.com>
Date: Wed, 9 Sep 2015 19:34:01 +0200
MIME-Version: 1.0
In-Reply-To: <1756d31a07bcee06ada066bcaccb506c6c43fc57.1441819862.git.g2p.code@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

merge_config.sh can usefully be applied to a single file.
It implicitly merges with the default configuration.

Signed-off-by: Gabriel de Perthuis <g2p.code@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>
---
  scripts/kconfig/merge_config.sh | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/merge_config.sh 
b/scripts/kconfig/merge_config.sh
index 5f1e110..4e16681 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -75,11 +75,11 @@ while true; do
  		break
  		;;
  	esac
  done
  -if [ "$#" -lt 2 ] ; then
+if [ "$#" -lt 1 ] ; then
  	usage
  	exit
  fi
   INITFILE=$1
-- 
2.6.0.rc0.29.g24f8d8a

