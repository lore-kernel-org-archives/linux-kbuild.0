Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from webmail10.mail.sp.isp-net.nl ([217.149.192.62]:63365 "EHLO
	webmail10.mail.sp.isp-net.nl" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756737Ab0JKWaM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Oct 2010 18:30:12 -0400
Date: Tue, 12 Oct 2010 00:12:11 +0200
From: Dick Streefland <dick@streefland.net>
Subject: Re: [Bugme-new] [Bug 19852] New: extract-ikconfig only works with
	gzip'ed kernel images
Message-ID: <20101011221211.GC5577@streefland.net>
References: <bug-19852-10286@https.bugzilla.kernel.org/> <20101010101904.b20bf9c8.rdunlap@xenotime.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20101010101904.b20bf9c8.rdunlap@xenotime.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org

On Sunday 2010-10-10 10:19, Randy Dunlap wrote:
| On Thu, 7 Oct 2010 17:06:32 GMT bugzilla-daemon@bugzilla.kernel.org wrote:
| 
| Hi Dick,
| 
| Please look at this kernel bugzilla entry.
| Thanks.
| 
| > https://bugzilla.kernel.org/show_bug.cgi?id=19852
| > 
| >                URL: https://bugs.gentoo.org/show_bug.cgi?id=340021
| >            Summary: extract-ikconfig only works with gzip'ed kernel images
| >            Product: Other
| >            Version: 2.5
| >           Platform: All
| >         OS/Version: Linux
| >               Tree: Mainline
| >             Status: NEW
| >           Severity: normal
| >           Priority: P1
| >          Component: Other
| >         AssignedTo: other_other@kernel-bugs.osdl.org
| >         ReportedBy: jlec@gentoo.org
| >         Regression: No
| > 
| > 
| > When anything else then CONFIG_KERNEL_GZIP is selected e.g.
| > CONFIG_KERNEL_BZIP2, the script extract-ikconfig fails with "extract-ikconfig:
| > Cannot find kernel config."
| > This should be either checked in the script or support for pther compression
| > methods may be nice.

Here is a patch to resolve this issue:

----------------------------------------------------------------------

Add support for kernels compressed with bzip2, lzma or lzo, in
addition to gzip.

Signed-off-by: Dick Streefland <dick@streefland.net>
---

 scripts/extract-ikconfig |   41 +++++++++++++++++++++++++++--------------
 1 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/scripts/extract-ikconfig b/scripts/extract-ikconfig
index 37f30d3..d27589a 100755
--- a/scripts/extract-ikconfig
+++ b/scripts/extract-ikconfig
@@ -7,12 +7,10 @@
 # The obscure use of the "tr" filter is to work around older versions of
 # "grep" that report the byte offset of the line instead of the pattern.
 #
-# (c) 2009, Dick Streefland <dick@streefland.net>
+# (c) 2009,2010 Dick Streefland <dick@streefland.net>
 # Licensed under the terms of the GNU General Public License.
 # ----------------------------------------------------------------------
 
-gz1='\037\213\010'
-gz2='01'
 cf1='IKCFG_ST\037\213\010'
 cf2='0123456789'
 
@@ -21,11 +19,25 @@ dump_config()
 	if	pos=`tr "$cf1\n$cf2" "\n$cf2=" < "$1" | grep -abo "^$cf2"`
 	then
 		pos=${pos%%:*}
-		tail -c+$(($pos+8)) "$1" | zcat -q
-		exit 0
+		tail -c+$(($pos+8)) "$1" | zcat > $tmp1 2> /dev/null
+		case	$? in
+		2)	# there will be a warning about trailing garbage
+			cat $tmp1
+			exit 0
+		esac
 	fi
 }
 
+try_decompress()
+{
+	for	pos in `tr "$1\n$2" "\n$2=" < "$img" | grep -abo "^$2"`
+	do
+		pos=${pos%%:*}
+		tail -c+$pos "$img" | $3 > $tmp2 2> /dev/null
+		dump_config $tmp2
+	done
+}
+
 # Check invocation:
 me=${0##*/}
 img=$1
@@ -35,18 +47,19 @@ then
 	exit 2
 fi
 
+# Prepare temp files:
+tmp1=/tmp/ikconfig$$.1
+tmp2=/tmp/ikconfig$$.2
+trap "rm -f $tmp1 $tmp2" 0
+
 # Initial attempt for uncompressed images or objects:
 dump_config "$img"
 
-# That didn't work, so decompress and try again:
-tmp=/tmp/ikconfig$$
-trap "rm -f $tmp" 0
-for	pos in `tr "$gz1\n$gz2" "\n$gz2=" < "$img" | grep -abo "^$gz2"`
-do
-	pos=${pos%%:*}
-	tail -c+$pos "$img" | zcat 2> /dev/null > $tmp
-	dump_config $tmp
-done
+# That didn't work, so retry after decompression.
+try_decompress '\037\213\010' xy  gunzip
+try_decompress 'BZh'          xy  bunzip2
+try_decompress '\135\0\0\0'   xxx unlzma
+try_decompress '\211\114\132' xy  'lzop -d'
 
 # Bail out:
 echo "$me: Cannot find kernel config." >&2
