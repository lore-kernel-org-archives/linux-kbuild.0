Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f179.google.com ([209.85.217.179]:38860 "EHLO
	mail-lb0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752745Ab3LEUos (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 Dec 2013 15:44:48 -0500
Received: by mail-lb0-f179.google.com with SMTP id l4so10379430lbv.10
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Dec 2013 12:44:47 -0800 (PST)
Message-ID: <52A0E5BB.9070602@gmail.com>
Date: Thu, 05 Dec 2013 22:44:43 +0200
From: "v1kt0p.rus@gmail.com" <v1kt0p.rus@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH]kconfig:qconf: Add an option to the "find" dialog for
 search in the description.
References: <526C1E31.2040604@gmail.com> <20131118190033.GE3458@free.fr>
In-Reply-To: <20131118190033.GE3458@free.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.cz, james.hogan@imgtec.com, ralf@linux-mips.org, tkhai@yandex.ru

On 18.11.2013 21:00, Yann E. MORIN wrote:
> Victor, All,
> 
> On 2013-10-26 22:55 +0300, v1kt0p.rus@gmail.com spake thusly:
>> Adding the ability to search in description.
>>
>> Signed-off-by: Victor Danchenko <v1kt0p.rus@gmail.com>
> 
> Your patch is space-mangled, and does not apply:
> 
> $ pwclient git-am 3098691
> Applying patch #3098691 using 'git am'
> Description: kconfig:qconf: Add an option to the "find" dialog for search in the description.
> Applying: kconfig:qconf: Add an option to the "find" dialog for search in the description.
> error: patch failed: scripts/kconfig/lkc_proto.h:35
> error: scripts/kconfig/lkc_proto.h: patch does not apply
> error: patch failed: scripts/kconfig/mconf.c:430
> error: scripts/kconfig/mconf.c: patch does not apply
> error: patch failed: scripts/kconfig/nconf.c:720
> error: scripts/kconfig/nconf.c: patch does not apply
> error: patch failed: scripts/kconfig/qconf.cc:1197
> error: scripts/kconfig/qconf.cc: patch does not apply
> error: patch failed: scripts/kconfig/qconf.h:5
> error: scripts/kconfig/qconf.h: patch does not apply
> error: patch failed: scripts/kconfig/symbol.c:990
> error: scripts/kconfig/symbol.c: patch does not apply
> Patch failed at 0001 kconfig:qconf: Add an option to the "find" dialog
> for search in the description.
> The copy of the patch that failed is found in:
>    /home/ymorin/dev/linux/linux-kconfig/.git/rebase-apply/patch
> When you have resolved this problem, run "git am --resolved".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> 
> Sending via a webmail (eg. gmail) is broken. Please use git 'send-email'
> to send your patch.
> 
> Regards,
> Yann E. MORIN.
> 

Sorry, Thunderbird replace tabs by spaces.
Proper patch:
Signed-off-by: Victor Danchenko <v1kt0p.rus@gmail.com>
---
 scripts/kconfig/lkc_proto.h |  3 ++-
 scripts/kconfig/mconf.c     |  2 +-
 scripts/kconfig/nconf.c     |  2 +-
 scripts/kconfig/qconf.cc    | 13 ++++++++++++-
 scripts/kconfig/qconf.h     |  3 +++
 scripts/kconfig/symbol.c    | 41 ++++++++++++++++++++++++++++++++++++++---
 6 files changed, 57 insertions(+), 7 deletions(-)
diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index ecdb965..5379647 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -35,7 +35,8 @@ P(sym_lookup,struct symbol *,(const char *name, int flags));
 P(sym_find,struct symbol *,(const char *name));
 P(sym_expand_string_value,const char *,(const char *in));
 P(sym_escape_string_value, const char *,(const char *in));
-P(sym_re_search,struct symbol **,(const char *pattern));
+P(sym_re_search, struct symbol **, (const char *pattern,
+			const bool in_description));
 P(sym_type_name,const char *,(enum symbol_type type));
 P(sym_calc_value,void,(struct symbol *sym));
 P(sym_get_type,enum symbol_type,(struct symbol *sym));
diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 2c39631..e7aeb5b 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -430,7 +430,7 @@ again:
 	stpart.text = str_get(&sttext);
 	list_add_tail(&stpart.entries, &trail);
 
-	sym_arr = sym_re_search(dialog_input);
+	sym_arr = sym_re_search(dialog_input, false);
 	do {
 		LIST_HEAD(head);
 		struct menu *targets[JUMP_NB];
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 4fbecd2..bac5054 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -720,7 +720,7 @@ again:
 	if (strncasecmp(dialog_input_result, CONFIG_, strlen(CONFIG_)) == 0)
 		dialog_input += strlen(CONFIG_);
 
-	sym_arr = sym_re_search(dialog_input);
+	sym_arr = sym_re_search(dialog_input, false);
 	res = get_relations_str(sym_arr, NULL);
 	free(sym_arr);
 	show_scroll_win(main_window,
diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 1500c38..3df276a 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -1197,6 +1197,9 @@ ConfigSearchWindow::ConfigSearchWindow(ConfigMainWindow* parent, const char *nam
 	layout2->addWidget(searchButton);
 	layout1->addLayout(layout2);
 
+	searchInDescription = new QCheckBox(_("Search in all texts."), this);
+	layout1->addWidget(searchInDescription);
+
 	split = new QSplitter(this);
 	split->setOrientation(Qt::Vertical);
 	list = new ConfigView(split, name);
@@ -1253,7 +1256,15 @@ void ConfigSearchWindow::search(void)
 	list->list->clear();
 	info->clear();
 
-	result = sym_re_search(editField->text().latin1());
+	bool in_description = false;
+#if QT_VERSION >= 0x040000
+	if (searchInDescription->checkState() == Qt::Checked) {
+#else
+	if (searchInDescription->isChecked() == TRUE) {
+#endif
+		in_description = true;
+	}
+	result = sym_re_search(editField->text().latin1(), in_description);
 	if (!result)
 		return;
 	for (p = result; *p; p++) {
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index 3715b3e..70f283e 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -5,8 +5,10 @@
 
 #if QT_VERSION < 0x040000
 #include <qlistview.h>
+#include <qcheckbox.h>
 #else
 #include <q3listview.h>
+#include <QCheckBox>
 #endif
 #include <qsettings.h>
 
@@ -294,6 +296,7 @@ protected:
 	QSplitter* split;
 	ConfigView* list;
 	ConfigInfoView* info;
+	QCheckBox *searchInDescription;
 
 	struct symbol **result;
 };
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index c9a6775..baa6ac3 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -990,7 +990,7 @@ static int sym_rel_comp(const void *sym1, const void *sym2)
 	return strcmp(s1->sym->name, s2->sym->name);
 }
 
-struct symbol **sym_re_search(const char *pattern)
+struct symbol **sym_re_search(const char *pattern, const bool in_description)
 {
 	struct symbol *sym, **sym_arr = NULL;
 	struct sym_match *sym_match_arr = NULL;
@@ -1008,8 +1008,43 @@ struct symbol **sym_re_search(const char *pattern)
 	for_all_symbols(i, sym) {
 		if (sym->flags & SYMBOL_CONST || !sym->name)
 			continue;
-		if (regexec(&re, sym->name, 1, match, 0))
-			continue;
+		if (in_description) {
+			struct property *prop;
+			size_t length = 1;
+			if (sym->name)
+				length += strlen(sym->name);
+			for_all_prompts(sym, prop) {
+				if (prop->text)
+					length += strlen(prop->text) + 1;
+				if (prop->menu && prop->menu->help)
+					length += strlen(prop->menu->help) + 1;
+			}
+			char *all_text = 0;
+			all_text = malloc(length);
+			if (!all_text)
+				goto sym_re_search_free;
+			*all_text = 0;
+			if (sym->name)
+				strcat(all_text, sym->name);
+			for_all_prompts(sym, prop) {
+				if (prop->text) {
+					strcat(all_text, "\n");
+					strcat(all_text, prop->text);
+				}
+				if (prop->menu && prop->menu->help) {
+					strcat(all_text, "\n");
+					strcat(all_text, prop->menu->help);
+				}
+			}
+			if (regexec(&re, all_text, 1, match, 0)) {
+				free(all_text);
+				continue;
+			}
+			free(all_text);
+		} else {
+			if (regexec(&re, sym->name, 1, match, 0))
+				continue;
+		}
 		if (cnt >= size) {
 			void *tmp;
 			size += 16;

Or in base64:
U2lnbmVkLW9mZi1ieTogVmljdG9yIERhbmNoZW5rbyA8djFrdDBwLnJ1c0BnbWFpbC5jb20+Ci0t
LQogc2NyaXB0cy9rY29uZmlnL2xrY19wcm90by5oIHwgIDMgKystCiBzY3JpcHRzL2tjb25maWcv
bWNvbmYuYyAgICAgfCAgMiArLQogc2NyaXB0cy9rY29uZmlnL25jb25mLmMgICAgIHwgIDIgKy0K
IHNjcmlwdHMva2NvbmZpZy9xY29uZi5jYyAgICB8IDEzICsrKysrKysrKysrKy0KIHNjcmlwdHMv
a2NvbmZpZy9xY29uZi5oICAgICB8ICAzICsrKwogc2NyaXB0cy9rY29uZmlnL3N5bWJvbC5jICAg
IHwgNDEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KIDYgZmlsZXMg
Y2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKZGlmZiAtLWdpdCBhL3Nj
cmlwdHMva2NvbmZpZy9sa2NfcHJvdG8uaCBiL3NjcmlwdHMva2NvbmZpZy9sa2NfcHJvdG8uaApp
bmRleCBlY2RiOTY1Li41Mzc5NjQ3IDEwMDY0NAotLS0gYS9zY3JpcHRzL2tjb25maWcvbGtjX3By
b3RvLmgKKysrIGIvc2NyaXB0cy9rY29uZmlnL2xrY19wcm90by5oCkBAIC0zNSw3ICszNSw4IEBA
IFAoc3ltX2xvb2t1cCxzdHJ1Y3Qgc3ltYm9sICosKGNvbnN0IGNoYXIgKm5hbWUsIGludCBmbGFn
cykpOwogUChzeW1fZmluZCxzdHJ1Y3Qgc3ltYm9sICosKGNvbnN0IGNoYXIgKm5hbWUpKTsKIFAo
c3ltX2V4cGFuZF9zdHJpbmdfdmFsdWUsY29uc3QgY2hhciAqLChjb25zdCBjaGFyICppbikpOwog
UChzeW1fZXNjYXBlX3N0cmluZ192YWx1ZSwgY29uc3QgY2hhciAqLChjb25zdCBjaGFyICppbikp
OwotUChzeW1fcmVfc2VhcmNoLHN0cnVjdCBzeW1ib2wgKiosKGNvbnN0IGNoYXIgKnBhdHRlcm4p
KTsKK1Aoc3ltX3JlX3NlYXJjaCwgc3RydWN0IHN5bWJvbCAqKiwgKGNvbnN0IGNoYXIgKnBhdHRl
cm4sCisJCQljb25zdCBib29sIGluX2Rlc2NyaXB0aW9uKSk7CiBQKHN5bV90eXBlX25hbWUsY29u
c3QgY2hhciAqLChlbnVtIHN5bWJvbF90eXBlIHR5cGUpKTsKIFAoc3ltX2NhbGNfdmFsdWUsdm9p
ZCwoc3RydWN0IHN5bWJvbCAqc3ltKSk7CiBQKHN5bV9nZXRfdHlwZSxlbnVtIHN5bWJvbF90eXBl
LChzdHJ1Y3Qgc3ltYm9sICpzeW0pKTsKZGlmZiAtLWdpdCBhL3NjcmlwdHMva2NvbmZpZy9tY29u
Zi5jIGIvc2NyaXB0cy9rY29uZmlnL21jb25mLmMKaW5kZXggMmMzOTYzMS4uZTdhZWI1YiAxMDA2
NDQKLS0tIGEvc2NyaXB0cy9rY29uZmlnL21jb25mLmMKKysrIGIvc2NyaXB0cy9rY29uZmlnL21j
b25mLmMKQEAgLTQzMCw3ICs0MzAsNyBAQCBhZ2FpbjoKIAlzdHBhcnQudGV4dCA9IHN0cl9nZXQo
JnN0dGV4dCk7CiAJbGlzdF9hZGRfdGFpbCgmc3RwYXJ0LmVudHJpZXMsICZ0cmFpbCk7CiAKLQlz
eW1fYXJyID0gc3ltX3JlX3NlYXJjaChkaWFsb2dfaW5wdXQpOworCXN5bV9hcnIgPSBzeW1fcmVf
c2VhcmNoKGRpYWxvZ19pbnB1dCwgZmFsc2UpOwogCWRvIHsKIAkJTElTVF9IRUFEKGhlYWQpOwog
CQlzdHJ1Y3QgbWVudSAqdGFyZ2V0c1tKVU1QX05CXTsKZGlmZiAtLWdpdCBhL3NjcmlwdHMva2Nv
bmZpZy9uY29uZi5jIGIvc2NyaXB0cy9rY29uZmlnL25jb25mLmMKaW5kZXggNGZiZWNkMi4uYmFj
NTA1NCAxMDA2NDQKLS0tIGEvc2NyaXB0cy9rY29uZmlnL25jb25mLmMKKysrIGIvc2NyaXB0cy9r
Y29uZmlnL25jb25mLmMKQEAgLTcyMCw3ICs3MjAsNyBAQCBhZ2FpbjoKIAlpZiAoc3RybmNhc2Vj
bXAoZGlhbG9nX2lucHV0X3Jlc3VsdCwgQ09ORklHXywgc3RybGVuKENPTkZJR18pKSA9PSAwKQog
CQlkaWFsb2dfaW5wdXQgKz0gc3RybGVuKENPTkZJR18pOwogCi0Jc3ltX2FyciA9IHN5bV9yZV9z
ZWFyY2goZGlhbG9nX2lucHV0KTsKKwlzeW1fYXJyID0gc3ltX3JlX3NlYXJjaChkaWFsb2dfaW5w
dXQsIGZhbHNlKTsKIAlyZXMgPSBnZXRfcmVsYXRpb25zX3N0cihzeW1fYXJyLCBOVUxMKTsKIAlm
cmVlKHN5bV9hcnIpOwogCXNob3dfc2Nyb2xsX3dpbihtYWluX3dpbmRvdywKZGlmZiAtLWdpdCBh
L3NjcmlwdHMva2NvbmZpZy9xY29uZi5jYyBiL3NjcmlwdHMva2NvbmZpZy9xY29uZi5jYwppbmRl
eCAxNTAwYzM4Li4zZGYyNzZhIDEwMDY0NAotLS0gYS9zY3JpcHRzL2tjb25maWcvcWNvbmYuY2MK
KysrIGIvc2NyaXB0cy9rY29uZmlnL3Fjb25mLmNjCkBAIC0xMTk3LDYgKzExOTcsOSBAQCBDb25m
aWdTZWFyY2hXaW5kb3c6OkNvbmZpZ1NlYXJjaFdpbmRvdyhDb25maWdNYWluV2luZG93KiBwYXJl
bnQsIGNvbnN0IGNoYXIgKm5hbQogCWxheW91dDItPmFkZFdpZGdldChzZWFyY2hCdXR0b24pOwog
CWxheW91dDEtPmFkZExheW91dChsYXlvdXQyKTsKIAorCXNlYXJjaEluRGVzY3JpcHRpb24gPSBu
ZXcgUUNoZWNrQm94KF8oIlNlYXJjaCBpbiBhbGwgdGV4dHMuIiksIHRoaXMpOworCWxheW91dDEt
PmFkZFdpZGdldChzZWFyY2hJbkRlc2NyaXB0aW9uKTsKKwogCXNwbGl0ID0gbmV3IFFTcGxpdHRl
cih0aGlzKTsKIAlzcGxpdC0+c2V0T3JpZW50YXRpb24oUXQ6OlZlcnRpY2FsKTsKIAlsaXN0ID0g
bmV3IENvbmZpZ1ZpZXcoc3BsaXQsIG5hbWUpOwpAQCAtMTI1Myw3ICsxMjU2LDE1IEBAIHZvaWQg
Q29uZmlnU2VhcmNoV2luZG93OjpzZWFyY2godm9pZCkKIAlsaXN0LT5saXN0LT5jbGVhcigpOwog
CWluZm8tPmNsZWFyKCk7CiAKLQlyZXN1bHQgPSBzeW1fcmVfc2VhcmNoKGVkaXRGaWVsZC0+dGV4
dCgpLmxhdGluMSgpKTsKKwlib29sIGluX2Rlc2NyaXB0aW9uID0gZmFsc2U7CisjaWYgUVRfVkVS
U0lPTiA+PSAweDA0MDAwMAorCWlmIChzZWFyY2hJbkRlc2NyaXB0aW9uLT5jaGVja1N0YXRlKCkg
PT0gUXQ6OkNoZWNrZWQpIHsKKyNlbHNlCisJaWYgKHNlYXJjaEluRGVzY3JpcHRpb24tPmlzQ2hl
Y2tlZCgpID09IFRSVUUpIHsKKyNlbmRpZgorCQlpbl9kZXNjcmlwdGlvbiA9IHRydWU7CisJfQor
CXJlc3VsdCA9IHN5bV9yZV9zZWFyY2goZWRpdEZpZWxkLT50ZXh0KCkubGF0aW4xKCksIGluX2Rl
c2NyaXB0aW9uKTsKIAlpZiAoIXJlc3VsdCkKIAkJcmV0dXJuOwogCWZvciAocCA9IHJlc3VsdDsg
KnA7IHArKykgewpkaWZmIC0tZ2l0IGEvc2NyaXB0cy9rY29uZmlnL3Fjb25mLmggYi9zY3JpcHRz
L2tjb25maWcvcWNvbmYuaAppbmRleCAzNzE1YjNlLi43MGYyODNlIDEwMDY0NAotLS0gYS9zY3Jp
cHRzL2tjb25maWcvcWNvbmYuaAorKysgYi9zY3JpcHRzL2tjb25maWcvcWNvbmYuaApAQCAtNSw4
ICs1LDEwIEBACiAKICNpZiBRVF9WRVJTSU9OIDwgMHgwNDAwMDAKICNpbmNsdWRlIDxxbGlzdHZp
ZXcuaD4KKyNpbmNsdWRlIDxxY2hlY2tib3guaD4KICNlbHNlCiAjaW5jbHVkZSA8cTNsaXN0dmll
dy5oPgorI2luY2x1ZGUgPFFDaGVja0JveD4KICNlbmRpZgogI2luY2x1ZGUgPHFzZXR0aW5ncy5o
PgogCkBAIC0yOTQsNiArMjk2LDcgQEAgcHJvdGVjdGVkOgogCVFTcGxpdHRlciogc3BsaXQ7CiAJ
Q29uZmlnVmlldyogbGlzdDsKIAlDb25maWdJbmZvVmlldyogaW5mbzsKKwlRQ2hlY2tCb3ggKnNl
YXJjaEluRGVzY3JpcHRpb247CiAKIAlzdHJ1Y3Qgc3ltYm9sICoqcmVzdWx0OwogfTsKZGlmZiAt
LWdpdCBhL3NjcmlwdHMva2NvbmZpZy9zeW1ib2wuYyBiL3NjcmlwdHMva2NvbmZpZy9zeW1ib2wu
YwppbmRleCBjOWE2Nzc1Li5iYWE2YWMzIDEwMDY0NAotLS0gYS9zY3JpcHRzL2tjb25maWcvc3lt
Ym9sLmMKKysrIGIvc2NyaXB0cy9rY29uZmlnL3N5bWJvbC5jCkBAIC05OTAsNyArOTkwLDcgQEAg
c3RhdGljIGludCBzeW1fcmVsX2NvbXAoY29uc3Qgdm9pZCAqc3ltMSwgY29uc3Qgdm9pZCAqc3lt
MikKIAlyZXR1cm4gc3RyY21wKHMxLT5zeW0tPm5hbWUsIHMyLT5zeW0tPm5hbWUpOwogfQogCi1z
dHJ1Y3Qgc3ltYm9sICoqc3ltX3JlX3NlYXJjaChjb25zdCBjaGFyICpwYXR0ZXJuKQorc3RydWN0
IHN5bWJvbCAqKnN5bV9yZV9zZWFyY2goY29uc3QgY2hhciAqcGF0dGVybiwgY29uc3QgYm9vbCBp
bl9kZXNjcmlwdGlvbikKIHsKIAlzdHJ1Y3Qgc3ltYm9sICpzeW0sICoqc3ltX2FyciA9IE5VTEw7
CiAJc3RydWN0IHN5bV9tYXRjaCAqc3ltX21hdGNoX2FyciA9IE5VTEw7CkBAIC0xMDA4LDggKzEw
MDgsNDMgQEAgc3RydWN0IHN5bWJvbCAqKnN5bV9yZV9zZWFyY2goY29uc3QgY2hhciAqcGF0dGVy
bikKIAlmb3JfYWxsX3N5bWJvbHMoaSwgc3ltKSB7CiAJCWlmIChzeW0tPmZsYWdzICYgU1lNQk9M
X0NPTlNUIHx8ICFzeW0tPm5hbWUpCiAJCQljb250aW51ZTsKLQkJaWYgKHJlZ2V4ZWMoJnJlLCBz
eW0tPm5hbWUsIDEsIG1hdGNoLCAwKSkKLQkJCWNvbnRpbnVlOworCQlpZiAoaW5fZGVzY3JpcHRp
b24pIHsKKwkJCXN0cnVjdCBwcm9wZXJ0eSAqcHJvcDsKKwkJCXNpemVfdCBsZW5ndGggPSAxOwor
CQkJaWYgKHN5bS0+bmFtZSkKKwkJCQlsZW5ndGggKz0gc3RybGVuKHN5bS0+bmFtZSk7CisJCQlm
b3JfYWxsX3Byb21wdHMoc3ltLCBwcm9wKSB7CisJCQkJaWYgKHByb3AtPnRleHQpCisJCQkJCWxl
bmd0aCArPSBzdHJsZW4ocHJvcC0+dGV4dCkgKyAxOworCQkJCWlmIChwcm9wLT5tZW51ICYmIHBy
b3AtPm1lbnUtPmhlbHApCisJCQkJCWxlbmd0aCArPSBzdHJsZW4ocHJvcC0+bWVudS0+aGVscCkg
KyAxOworCQkJfQorCQkJY2hhciAqYWxsX3RleHQgPSAwOworCQkJYWxsX3RleHQgPSBtYWxsb2Mo
bGVuZ3RoKTsKKwkJCWlmICghYWxsX3RleHQpCisJCQkJZ290byBzeW1fcmVfc2VhcmNoX2ZyZWU7
CisJCQkqYWxsX3RleHQgPSAwOworCQkJaWYgKHN5bS0+bmFtZSkKKwkJCQlzdHJjYXQoYWxsX3Rl
eHQsIHN5bS0+bmFtZSk7CisJCQlmb3JfYWxsX3Byb21wdHMoc3ltLCBwcm9wKSB7CisJCQkJaWYg
KHByb3AtPnRleHQpIHsKKwkJCQkJc3RyY2F0KGFsbF90ZXh0LCAiXG4iKTsKKwkJCQkJc3RyY2F0
KGFsbF90ZXh0LCBwcm9wLT50ZXh0KTsKKwkJCQl9CisJCQkJaWYgKHByb3AtPm1lbnUgJiYgcHJv
cC0+bWVudS0+aGVscCkgeworCQkJCQlzdHJjYXQoYWxsX3RleHQsICJcbiIpOworCQkJCQlzdHJj
YXQoYWxsX3RleHQsIHByb3AtPm1lbnUtPmhlbHApOworCQkJCX0KKwkJCX0KKwkJCWlmIChyZWdl
eGVjKCZyZSwgYWxsX3RleHQsIDEsIG1hdGNoLCAwKSkgeworCQkJCWZyZWUoYWxsX3RleHQpOwor
CQkJCWNvbnRpbnVlOworCQkJfQorCQkJZnJlZShhbGxfdGV4dCk7CisJCX0gZWxzZSB7CisJCQlp
ZiAocmVnZXhlYygmcmUsIHN5bS0+bmFtZSwgMSwgbWF0Y2gsIDApKQorCQkJCWNvbnRpbnVlOwor
CQl9CiAJCWlmIChjbnQgPj0gc2l6ZSkgewogCQkJdm9pZCAqdG1wOwogCQkJc2l6ZSArPSAxNjsK

